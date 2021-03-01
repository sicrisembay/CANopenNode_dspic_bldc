/*!
 * \file drv_adc.c
 */

#include "FreeRTOS.h"
#include "task.h"
#include "global_def.h"
#include "PinConfig.h"
#include "drv_adc.h"
#include "util_trace.h"
#include "util_filter.h"

//*****************************************************************************
//! This enables or disables the use dsPIC33 DSP filter library.
//! 1-ENABLE; 0-DISABLE
//*****************************************************************************
#define ENABLE_DSPIC33_FILTERING        (0) // 1-ENABLE; 0-DISABLE

#if(ENABLE_DSPIC33_FILTERING == 0)
#define ENABLE_LPF_FREQ_1KHZ            (1) // 1-Use 1kHz LPF; 0-Use 500Hz LPF
#endif

/*!
 * \def NUM_ANALOG_BUFFER_WORDS
 * This is the number of words of the analog buffer used for DMA operation.
 * This is equivalent to 2^DMABL.
 */
#define NUM_ANALOG_BUFFER_WORDS         (4)  // 2^DMABL

/*!
 * \def NUMSAMP
 *  This is the number of samples to filter.
 */
#define NUMSAMP                     NUM_ANALOG_BUFFER_WORDS


//*****************************************************************************
// Private member declarations.
//*****************************************************************************
static TaskHandle_t xTaskDma0Notify = NULL;

/*!
 * \var fractional Imon_BufferA
 * Buffer for Peripheral indirect addressing (Scatter/Gather Mode).
 * This is BufferA, one of the two buffers that is used for ping pong DMA
 * operation on ADC peripheral that is used for motor current sensor.
 * The size is 32 bytes (NUM_IMON_CH * NUM_ANALOG_BUFFER_WORDS).
 */
volatile fractional Imon_BufferA[NUM_ANALOG_BUFFER_WORDS][NUM_IMON_CH] __attribute__((space(dma), aligned(32)));

/*!
 * \var fractional Imon_BufferB
 * Buffer for Peripheral indirect addressing (Scatter/Gather Mode).
 * This is BufferB, one of the two buffers that is used for ping pong DMA
 * operation on ADC peripheral that is used for motor current sensor.
 * The size is 32 bytes (NUM_IMON_CH * NUM_ANALOG_BUFFER_WORDS).
 */
volatile fractional Imon_BufferB[NUM_ANALOG_BUFFER_WORDS][NUM_IMON_CH] __attribute__((space(dma), aligned(32)));

/*!
 * \var UNSIGNED16_T Vmon_BufferA
 * Buffer for Register indirect addressing (written in order of conversion)
 * This is BufferA, one of the two buffers that is used for ping pong DMA
 * operation on ADC peripheral that is used for motor terminal voltage sensor.
 * The size is 32 bytes (NUM_VMON_CH * NUM_ANALOG_BUFFER_WORDS).
 */
UNSIGNED16_T Vmon_BufferA[NUM_ANALOG_BUFFER_WORDS][NUM_VMON_CH] __attribute__((space(dma), aligned(32)));

/*!
 * \var UNSIGNED16_T Vmon_BufferB
 * Buffer for Register indirect addressing (written in order of conversion)
 * This is BufferB, one of the two buffers that is used for ping pong DMA
 * operation on ADC peripheral that is used for motor terminal voltage sensor.
 * The size is 32 bytes (NUM_VMON_CH * NUM_ANALOG_BUFFER_WORDS).
 */
UNSIGNED16_T Vmon_BufferB[NUM_ANALOG_BUFFER_WORDS][NUM_VMON_CH] __attribute__((space(dma), aligned(32)));

/*!
 * \var UNSIGNED16_T ImonDmaBuffer
 * This is a flag that indicate which of the two ping-pong buffers is
 * currently used.  This flag is for the motor current sensor.
 * 0: \a Imon_BufferA is active.
 * 1: \a Imon_BufferB is active.
 */
volatile UNSIGNED16_T ImonDmaBuffer = 0;

/*!
 * \var UNSIGNED16_T VmonDmaBuffer
 * This is a flag that indicate which of the two ping-pong buffers is
 * currently used.  This flag is for the motor terminal voltage sensor.
 * 0: \a Vmon_BufferA is active.
 * 1: \a Vmon_BufferB is active.
 */
volatile UNSIGNED16_T VmonDmaBuffer = 0;

//*****************************************************************************
//! Filtered motor current data in 1.15 Fixed point format.  Update rate
//! is 5kHz.
//*****************************************************************************
volatile fractional Imon_Filter_V[NUM_IMON_CH];

//*****************************************************************************
//! Filtered motor terminal voltage data in 1.15 Fixed point format.  
//! Update rate is 1.25kHz.
//*****************************************************************************
volatile UNSIGNED16_T Vmon_Filter_V[NUM_VMON_CH];

//*****************************************************************************
//! Temporary buffer
//*****************************************************************************
volatile fractional ImonInputSignal[NUM_IMON_CH][NUMSAMP];

#if(ENABLE_DSPIC33_FILTERING == 1)
// Anti-aliasing Low Pass Filter for the Decimator (Downsampling)
extern IIRCanonicStruct ImonDecimatorLpfFilter1;
extern IIRCanonicStruct ImonDecimatorLpfFilter2;
extern IIRCanonicStruct ImonDecimatorLpfFilter3;
extern IIRCanonicStruct ImonDecimatorLpfFilter4;
volatile fractional ImonDecimatorOutputSignal[NUM_IMON_CH][NUMSAMP];
volatile fractional *ptrImonDecimatorLpfOutput[NUM_IMON_CH];
static IIRCanonicStruct *ptrImonDecimatorLpfFilter[NUM_IMON_CH];
// Motor Current Low Pass Filter
extern IIRCanonicStruct ImonLpfFilter1;
extern IIRCanonicStruct ImonLpfFilter2;
extern IIRCanonicStruct ImonLpfFilter3;
extern IIRCanonicStruct ImonLpfFilter4;
volatile fractional ImonInputLpfSignal[NUM_IMON_CH];
volatile fractional ImonOutputSignal[NUM_IMON_CH];
volatile fractional *ptrImonLpfOutput[NUM_IMON_CH];
static IIRCanonicStruct *ptrImonLpfFilter[NUM_IMON_CH];
extern void IIRCanonicInit(IIRCanonicStruct* filter);
extern fractional* IIRTransposed(int numSamps, fractional* dstSamps, fractional* srcSamps,
                                    IIRTransposedStruct* filter);
#else
volatile IIR_BIQUAD_DF2_T ImonLpfFilter[NUM_IMON_CH];
#endif

//*****************************************************************************
// Public / Internal member external declarations.
//*****************************************************************************

//*****************************************************************************
// Private function prototypes.
//*****************************************************************************
static void PrvAdc_InitDma(void);
static void PrvAdc_ProcessImon(UNSIGNED16_T buffId);
static void PrvAdc_ProcessVmon(UNSIGNED16_T buffId);

//*****************************************************************************
// Public function implementations.
//*****************************************************************************

//*****************************************************************************
//! \brief  This function initializes the ADC peripheral.
//!
//! There are two ADC's.  ADC1 is used to measure IMON1 (AN0), IMON2 (AN1),
//! IMON3 (AN2), IMON4 (AN3) using MUXA for simultaneous sampling (CH0, CH1,CH2,
//! CH3).  ADC1 format is 10bit signed fractional (1.15 Fixed point or Q15).
//! ADC2 converter voltage reference is AVdd and AVss.  DMA buffers are written
//! in order of conversion CH0, CH1, CH2, CH3.  and increments DMA address after
//! completion of every 4 samples/conversion. DMA buffer is allocated 4 words 
//! to each 4 analog input.
//! 
//! ADC2 is used to measure VMON1 (AN10), VMON2 (AN11), VMON3 (AN12), 
//! VMON4 (AN13) using MUXA for sequential sampling on CH0.  ADC2 samples 
//! multiple channels individually in sequence, VMON1, VMON2, VMON3, VMON4.  
//! ADC2 format is 10bit unsigned integer.  ADC2 converter voltage reference is
//! AVdd and AVss.  DMA buffer is allocated 4 words to each 4 analog input and
//! increments DMA address after completion of every 4 samples/conversion.
//!
//! This function also initializes the biquad Lower pass filter states for IMON1,
//! IMON2, IMON3, and IMON4.
//!
//! \param  None
//! \return \c void
//*****************************************************************************
void DrvAdc_Init(void)
{
#if(ENABLE_DSPIC33_FILTERING != 1)
    UNSIGNED16_T chIdx = 0;
#endif
    
    // Configure Analog Pin
    AD1PCFGLbits.PCFG0 = 0;
    AD2PCFGLbits.PCFG0 = 0;
    AD1PCFGLbits.PCFG1 = 0;
    AD2PCFGLbits.PCFG1 = 0;
    AD1PCFGLbits.PCFG2 = 0;
    AD2PCFGLbits.PCFG2 = 0;
    AD1PCFGLbits.PCFG3 = 0;
    AD2PCFGLbits.PCFG3 = 0;
    AD1PCFGLbits.PCFG10 = 0;
    AD2PCFGLbits.PCFG10 = 0;
    AD1PCFGLbits.PCFG11 = 0;
    AD2PCFGLbits.PCFG11 = 0;
    AD1PCFGLbits.PCFG12 = 0;
    AD2PCFGLbits.PCFG12 = 0;
    AD1PCFGLbits.PCFG13 = 0;
    AD2PCFGLbits.PCFG13 = 0;

    // Configure pin Direction
    PIN_DIR_IN(DIR_IMON1);
    PIN_DIR_IN(DIR_IMON2);
    PIN_DIR_IN(DIR_IMON3);
    PIN_DIR_IN(DIR_IMON4);
    PIN_DIR_IN(DIR_VMON1);
    PIN_DIR_IN(DIR_VMON2);
    PIN_DIR_IN(DIR_VMON3);
    PIN_DIR_IN(DIR_VMON4);

    // ADC1 ===================================================================
    // - used to measure IMON1 (AN0), IMON2 (AN1), IMON3 (AN2), IMON4 (AN3)
    // - Simultaneous sampling using MUXA (CH0, CH1, CH2, CH3)
    AD1CON1bits.ADSIDL  = CLEAR;    // Continue module operation in Idle mode
    AD2CON1bits.ADDMABM = SET;      // DMA buffers are written in order of conversion
    AD1CON1bits.AD12B   = CLEAR;    // 10-bit
    AD1CON1bits.FORM    = 3;        // Signed Fraction Format (Q15)
    AD1CON1bits.SSRC    = 3;        // MCPWM1 interval ends sampling and start conversion
    AD1CON1bits.SIMSAM  = SET;      // Samples Simultaneously
    AD1CON1bits.ASAM    = SET;      // Sampling begins immediately after last conversion

    AD1CON2bits.VCFG    = 0;        // Converter Voltage Reference (AVdd and AVss)
    AD1CON2bits.CSCNA   = CLEAR;    // Do not scan inputs
    AD1CON2bits.CHPS    = 3;        // Converts CH0, CH1, CH2, CH3
    AD1CON2bits.SMPI    = (NUM_IMON_CH - 1); // Increments DMA address after completion of
                                            // every 4 samples/conversion
    AD1CON2bits.BUFM    = CLEAR;    // Always starts filling the buffer from the start address
    AD1CON2bits.ALTS    = CLEAR;    // Always uses channel input selects for Sample A

    AD1CON3bits.ADRC    = CLEAR;    // Clock Derived from System Clk
    AD1CON3bits.ADCS    = 25;       // Tad = (ADCS + 1) * 1/40M = 0.65us  (Note: min is 76ns as stated in datasheet)
                                    // Tconv = 12*Tad = 7.8us (Conversion Time for one channel)
                                    // Tconv_4CH = 4*Tconv = 31.2us (Total conversion time for 4CH)
                                    // For this application, Tsim is 50us (1 sample per PWM period)
                                    // Tsim = Tsamp + Tconv *4
                                    // Automatic Sampling (ASAM).. Tsamp = 18.8us (Note: min. is 2Tad)

    AD1CON4bits.DMABL   = 2;        // Allocates 4 words of buffer to each 4 analog input
    
    AD1CHS123bits.CH123NA = 0;      // CH1, CH2, CH3 negative input is VREFL
    AD1CHS123bits.CH123SA = CLEAR;  // CH1 positive input is AN0 (IMON1)
                                    // CH2 positive input is AN1 (IMON2)
                                    // CH3 positive input is AN2 (IMON3)
    AD1CHS0bits.CH0NA   = CLEAR;    // CH0 negative input is VREFL
    AD1CHS0bits.CH0SA   = 3;        // CH0 positive input is AN3 (IMON4)
    
    
    // ADC2 ===================================================================
    // - used to measure VMON1 (AN10), VMON2 (AN11), VMON3 (AN12), VMON4 (AN13)
    // - Sequential sampling using MUXA (CH0)
    AD2CON1bits.ADSIDL  = CLEAR;    // Continue module operation in Idle mode
    AD2CON1bits.ADDMABM = SET;      // DMA buffers are written in order of conversion
    AD2CON1bits.AD12B   = CLEAR;    // 10-bit
    AD2CON1bits.FORM    = 0;        // Integer Format
    AD2CON1bits.SSRC    = 3;        // MCPWM1 interval ends sampling and start conversion
    AD2CON1bits.SIMSAM  = CLEAR;    // Sample multiple channels individually in sequence
    AD2CON1bits.ASAM    = SET;      // Sampling begins after conversions complete
    
    AD2CON2bits.VCFG    = 0;        // Converter Voltage Reference (AVdd and AVss)
    AD2CON2bits.CSCNA   = SET;      // Scan Input Selections for CH0+ during Sample A bit
    AD2CON2bits.CHPS    = 0;        // Convert CH0
    AD2CON2bits.SMPI    = (NUM_VMON_CH -1); // Increments DMA address after completion of
                                            // every 4 samples/conversion
    AD2CON2bits.BUFM    = CLEAR;    // Always starts filling the buffer from the start address
    AD2CON2bits.ALTS    = CLEAR;    // Always uses channel input selects for Sample A
 
    AD2CON3bits.ADRC    = CLEAR;    // Clock Derived from System Clock
    AD2CON3bits.ADCS    = 63;       // (ADCS + 1) * 1/40M = 1.6us
    
    AD2CON4bits.DMABL   = 2;        // Allocates 4 words of buffer to each 4 analog input
    
    AD2CHS0bits.CH0NA   = CLEAR;    // Channel 0 negative input is VREFL
    
    // A/D Input Scan Selection Register
    AD2CSSLbits.CSS10   = 1;		// Enable AN10 for channel scan (VMON1)
    AD2CSSLbits.CSS11   = 1;		// Enable AN11 for channel scan (VMON2)
    AD2CSSLbits.CSS12   = 1;        // Enable AN12 for channel scan (VMON3)
    AD2CSSLbits.CSS13   = 1;        // Enable AN13 for channel scan (VMON4) 
            
#if(ENABLE_DSPIC33_FILTERING == 1)
    // Initialize Decimator Anti-aliasing filter
    IIRCanonicInit(&ImonDecimatorLpfFilter1); // Initialize state variables in the digital
                                    // low pass filter to zero.
    IIRCanonicInit(&ImonDecimatorLpfFilter2);
    IIRCanonicInit(&ImonDecimatorLpfFilter3);
    IIRCanonicInit(&ImonDecimatorLpfFilter4);
    ptrImonDecimatorLpfFilter[IMON1] = &ImonDecimatorLpfFilter1;
    ptrImonDecimatorLpfFilter[IMON2] = &ImonDecimatorLpfFilter2;
    ptrImonDecimatorLpfFilter[IMON3] = &ImonDecimatorLpfFilter3;
    ptrImonDecimatorLpfFilter[IMON4] = &ImonDecimatorLpfFilter4;
    
    // Initialize Motor current filter
    IIRCanonicInit(&ImonLpfFilter1);
    IIRCanonicInit(&ImonLpfFilter2);
    IIRCanonicInit(&ImonLpfFilter3);
    IIRCanonicInit(&ImonLpfFilter4);
    ptrImonLpfFilter[IMON1] = &ImonLpfFilter1;
    ptrImonLpfFilter[IMON2] = &ImonLpfFilter2;
    ptrImonLpfFilter[IMON3] = &ImonLpfFilter3;
    ptrImonLpfFilter[IMON4] = &ImonLpfFilter4;
#else
#if(ENABLE_LPF_FREQ_1KHZ == 1)
    // Low Pass Filter
    // Design Method: Butterworth
    // Filter Order: 2
    // Section: 1
    // Fs: 20kHz
    // Fc: 1kHz
    for(chIdx = 0; chIdx < NUM_IMON_CH; chIdx++)
    {
        ImonLpfFilter[chIdx].a1     = -102302;  // Q16(-1.5610180758007182)
        ImonLpfFilter[chIdx].a2     = 42031;    // Q16(0.64135153805756318)
        ImonLpfFilter[chIdx].b0     = 65536;    // Q16(1.0)
        ImonLpfFilter[chIdx].b1     = 131072;   // Q16(2.0)
        ImonLpfFilter[chIdx].b2     = 65536;    // Q16(1.0)
        ImonLpfFilter[chIdx].gain   = 1316;     // Q16(0.020083365564211236)
        ImonLpfFilter[chIdx].d0     = 0;
        ImonLpfFilter[chIdx].d1     = 0;
    }
#else
    // Low Pass Filter
    // Design Method: Butterworth
    // Filter Order: 2
    // Section: 1
    // Fs: 20kHz
    // Fc: 500Hz
    for(chIdx = 0; chIdx < NUM_IMON_CH; chIdx++)
    {
        ImonLpfFilter[chIdx].a1     = -116564;  // Q16(-1.7786317778245848)
        ImonLpfFilter[chIdx].a2     = 52481;    // Q16(0.80080264666570755)
        ImonLpfFilter[chIdx].b0     = 65536;    // Q16(1.0)
        ImonLpfFilter[chIdx].b1     = 131072;   // Q16(2.0)
        ImonLpfFilter[chIdx].b2     = 65536;    // Q16(1.0)
        ImonLpfFilter[chIdx].gain   = 363;      // Q16(0.0055427172102806817)
        ImonLpfFilter[chIdx].d0     = 0;
        ImonLpfFilter[chIdx].d1     = 0;
    }
#endif
#endif
    
    // Enable ADC =============================================================
    // ADC1
    IFS0bits.AD1IF      = CLEAR;    // Clear the A/D interrupt flag bit
    IEC0bits.AD1IE      = CLEAR;    // Do Not Enable A/D interrupt 
    AD1CON1bits.ADON    = SET;      // Turn on the A/D converter
    // ADC2
    IFS1bits.AD2IF      = CLEAR;    // Clear the A/D interrupt flag bit
    IEC1bits.AD2IE      = CLEAR;    // Do Not Enable A/D interrupt 
    AD2CON1bits.ADON    = SET;      // Turn on the A/D converter
    
    // Configure DMA channels used for ADC
    PrvAdc_InitDma();

}


//*****************************************************************************
//! \brief  This function set the task handle for direct task notification to
//! from ISR.
//!
//! \param  tskHandle Handle of the task to be notified from ISR.
//!
//! \return \c void
//*****************************************************************************
void DrvAdc_SetCurrentControlHandlerOne(TaskHandle_t tskHandle)
{
    xTaskDma0Notify = tskHandle;
}


//*****************************************************************************
//! \brief  This function returns the motor current (Imon) ADC value in
//! fractional format (1.15 Fixed Point)
//!
//! \param  chIdx  Motor Current Channel ID
//!
//! \return Motor current ADC value in fractional format (1.15 Fixed Point)
//*****************************************************************************
fractional DrvAdc_GetImonAdcValue(IMON_CH_T chIdx)
{
    fractional retval = 0;
    if(chIdx < NUM_IMON_CH)
    {
        retval = Imon_Filter_V[chIdx];
    }
    return(retval);
}


//*****************************************************************************
//! \brief  This function returns the motor terminal voltage (Vmon) ADC value in
//! unsigned 16-bit integer.
//!
//! \param  chIdx  Motor Terminal Channel ID
//!
//! \return Motor terminal voltage (Vmon) ADC value in 16bit unsigned integer.
//*****************************************************************************
UNSIGNED16_T DrvAdc_GetVmonAdcValue(VMON_CH_T chIdx)
{
    UNSIGNED16_T retval = 0;
    if(chIdx < NUM_VMON_CH)
    {
        retval = Vmon_Filter_V[chIdx];
    }
    return(retval);
}

//*****************************************************************************
// Private function implementations.
//*****************************************************************************

/*!
 * \brief This function configures DMA transfer from ADC.
 *
 * This function configures the DMA for register indirect mode with post
 * increment and for continuous ping-pong mode.  DMA Channel0 transfer is 
 * triggered when ADC1 conversion is done.  DMA Channel1 transfer is triggered
 * when ADC2 conversion is done.
 *
 * \param  None
 * \return \c void
 */
static void PrvAdc_InitDma(void)
{
    // DMA0 Channel (used for ADC1) ===============================================================
    DMA0CONbits.AMODE   = 0;        // Configure DMA for Register indirect mode with post-increment
    DMA0CONbits.MODE    = 2;        // Configure DMA for Continuous Ping-Pong mode
    DMA0PAD = (volatile unsigned int)&ADC1BUF0;     // Point DMA to ADC1BUF0
    DMA0CNT = 15;                   // 16 DMA request
    DMA0REQbits.IRQSEL  = 13;       // ADC1 convert Done
    DMA0STA = __builtin_dmaoffset(Imon_BufferA);
    DMA0STB = __builtin_dmaoffset(Imon_BufferB);
    // Configure interrupt
    IPC1bits.DMA0IP     = configDMA0_INTERRUPT_PRIORITY;
    IFS0bits.DMA0IF     = CLEAR;
    IEC0bits.DMA0IE     = SET;
    
    // DMA1 Channel (used for ADC2) ===============================================================
    DMA1CONbits.AMODE   = 0;        // Configure DMA for Register indirect mode with post-increment
    DMA1CONbits.MODE    = 2;        // Configure DMA for Continuous Ping-Pong mode
    DMA1PAD = (volatile unsigned int)&ADC2BUF0;     // Point DMA to ADC2BUF0
    DMA1CNT = 15;                   // 16 DMA request
    DMA1REQbits.IRQSEL  = 21;       // ADC2 Convert Done
    DMA1STA = __builtin_dmaoffset(Vmon_BufferA);
    DMA1STB = __builtin_dmaoffset(Vmon_BufferB);
    // Configure interrupt
    IPC3bits.DMA1IP     = configDMA1_INTERRUPT_PRIORITY;
    IFS0bits.DMA1IF     = CLEAR;
    IEC0bits.DMA1IE     = SET;
    
    // Finally, enable DMA channels
    DMA0CONbits.CHEN    = SET;      // Enable DMA0
    DMA1CONbits.CHEN    = SET;      // Enable DMA1
}

//*****************************************************************************
//! \brief  PRIVATE FUNCTION: This function processes the buffers used in DMA
//! channel0 (DMA0).
//! 
//! \param  buffId Buffer ID that is used in DMA ping-pong mode.  
//! \return \c void
//*****************************************************************************
static void PrvAdc_ProcessImon(UNSIGNED16_T buffId)
{
    volatile UNSIGNED16_T sampleIdx;
    volatile UNSIGNED16_T chIdx;
    
    if(buffId == 0)
    {
        // Process BufferA
        for(chIdx = 0; chIdx < NUM_IMON_CH; chIdx++)
        {
            for(sampleIdx = 0; sampleIdx < NUM_ANALOG_BUFFER_WORDS; sampleIdx++)
            {
                // Copy DMA data to Filter Input Buffer (Format: Q15)
                ImonInputSignal[chIdx][sampleIdx] = Imon_BufferA[sampleIdx][chIdx];
            }
        }
    }
    else
    {
        // Process BufferB
        for(chIdx = 0; chIdx < NUM_IMON_CH; chIdx++)
        {
            for(sampleIdx = 0; sampleIdx < NUM_ANALOG_BUFFER_WORDS; sampleIdx++)
            {
                // Copy DMA data to Filter Input Buffer (Format: Q15)
                ImonInputSignal[chIdx][sampleIdx] = Imon_BufferB[sampleIdx][chIdx];
            }
        }
    }
}


//*****************************************************************************
//! \brief  PRIVATE FUNCTION: This function processes the buffers used in DMA
//! channel1 (DMA1).
//! 
//! \param  buffId Buffer ID that is used in DMA ping-pong mode.  
//! \return \c void
//*****************************************************************************
static void PrvAdc_ProcessVmon(UNSIGNED16_T buffId)
{
    volatile UNSIGNED16_T sampleIdx;
    volatile UNSIGNED16_T chIdx;
    
    if(buffId == 0)
    {
        // Process BufferA
        for(chIdx = 0; chIdx < NUM_VMON_CH; chIdx++)
        {
            for(sampleIdx = 0; sampleIdx < NUM_ANALOG_BUFFER_WORDS; sampleIdx++)
            {
                //
                // Simple IIR filter.
                // the same operation but more optimized
                //
                // Vmon_Filter_V[chIdx] = (((Vmon_Filter_V[chIdx] * 7) + Vmon_BufferA[sampleIdx][chIdx]) / 8);
                //
                Vmon_Filter_V[chIdx] = (((Vmon_Filter_V[chIdx] << 3) - Vmon_Filter_V[chIdx]) + Vmon_BufferA[sampleIdx][chIdx]) >> 3;
            }
        }
    }
    else
    {
        // Process BufferB
        for(chIdx = 0; chIdx < NUM_VMON_CH; chIdx++)
        {
            for(sampleIdx = 0; sampleIdx < NUM_ANALOG_BUFFER_WORDS; sampleIdx++)
            {
                //
                // Simple IIR filter.
                // the same operation but more optimized
                //
                // Vmon_Filter_V[chIdx] = (((Vmon_Filter_V[chIdx] * 7) + Vmon_BufferB[sampleIdx][chIdx]) / 8);
                //
                Vmon_Filter_V[chIdx] = (((Vmon_Filter_V[chIdx] << 3) - Vmon_Filter_V[chIdx]) + Vmon_BufferB[sampleIdx][chIdx]) >> 3;
            }
        }
    }
}


//*****************************************************************************
//! \brief  This function is the Interrupt Service Routine of DMA Channel0.
//! \param  None
//! \return \c void
//*****************************************************************************
void __attribute__((__interrupt__, auto_psv)) _DMA0Interrupt(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    volatile UNSIGNED16_T chIdx;
#if (ENABLE_DSPIC33_FILTERING != 1)
    UNSIGNED16_T sampleIdx;
#endif

    HOOK_TRACE_IN(CTX_DMA0_ISR, TRUE);
    IFS0bits.DMA0IF = CLEAR;
    PrvAdc_ProcessImon(ImonDmaBuffer);
    for(chIdx = 0; chIdx < NUM_IMON_CH; chIdx++)
    {
#if (ENABLE_DSPIC33_FILTERING == 1)
        //**********************************************************************
        // ADC sampling rate for motor current is the same as the PWM frequency 
        // at 20kHz.  The motor current control loop runs at 5kHz. Thus, 
        // decimator (downsampling) is needed. Decimator factor (M) is 4 (equal 
        // to NUM_ANALOG_BUFFER_WORDS per DMA interrupt).
        //
        // Step1: Reduce high-frequency signal components with a Digital LPF.
        // Step2: Downsample the filtered signal by M; keep only every Mth sample.
        //**********************************************************************
        
        // Step1: Reduce high-frequency signal components with a Digital LPPF.
        // Anti-aliasing filter cut-off frequency should be less than the nyquist
        // frequency divided by the decimator factor (M).
        //
        // Nyquist Frequency: (20kHz / 2) = 10kHz
        // Anti-alias LPF Maximum allowable cut-off frequency: 10kHz / M = 2.5kHz
        // For this application, Fc = 1.0kHz is used 
        ptrImonDecimatorLpfOutput[chIdx] = IIRCanonic(NUMSAMP, (fractional*)&ImonDecimatorOutputSignal[chIdx][0], 
                (fractional*)&ImonInputSignal[chIdx][0], ptrImonDecimatorLpfFilter[chIdx]);
        
        // Step2: Downsample the filtered signal.
        // Filtered signal is stored in the array ImonDecimatorOutputSignal. The 
        // downsampled signal is stored in ImonDecimatorOutputSignal[chIdx][NUMSAMP-1].
        ImonInputLpfSignal[chIdx] = ImonDecimatorOutputSignal[chIdx][NUMSAMP-1];
        
        //**********************************************************************
        // The downsampled motor current is furthered passed through a 
        // Low Pass Filter to filter out unwanted noise.
        //
        // LPF Sample Frequency, Fs: 5kHz
        // LPF Cutoff Frequency, Fc: 100Hz
        //
        // Note: Previous implementation is to directly filter the ADC signal
        // (sample rate at 20kHz) using a LPF with 100Hz cutoff frequency without
        // downsampling.  However, the result was undesirable and distorted. It
        // was suspected that it was due to coefficient truncation
        //**********************************************************************
        ptrImonLpfOutput[chIdx] = IIRCanonic(1, (fractional*)&ImonOutputSignal[chIdx],
                (fractional*)&ImonInputLpfSignal[chIdx], ptrImonLpfFilter[chIdx]);
        
        Imon_Filter_V[chIdx] = ImonOutputSignal[chIdx];
#else
        for(sampleIdx = 0; sampleIdx < NUMSAMP; sampleIdx++)
        {
            Imon_Filter_V[chIdx] = UtilFilter_ExecuteDF2(ImonInputSignal[chIdx][sampleIdx],
                    (IIR_BIQUAD_DF2_T *)&(ImonLpfFilter[chIdx]));
        }
#endif
    }
    ImonDmaBuffer ^= 1;
    
    if(NULL != xTaskDma0Notify)
    {
        vTaskNotifyGiveFromISR( xTaskDma0Notify, &xHigherPriorityTaskWoken );
    }
    HOOK_TRACE_OUT(TRUE);
    if( xHigherPriorityTaskWoken != pdFALSE )
    {
        taskYIELD();
    }
}

//*****************************************************************************
//! \brief  This function is the Interrupt Service Routine of DMA Channel1.
//! \param  None
//! \return \c void
//*****************************************************************************
void __attribute__((__interrupt__, auto_psv)) _DMA1Interrupt(void)
{
    HOOK_TRACE_IN(CTX_DMA1_ISR, TRUE);
    PrvAdc_ProcessVmon(VmonDmaBuffer);
    VmonDmaBuffer ^= 1;
    IFS0bits.DMA1IF = CLEAR;
    HOOK_TRACE_OUT(TRUE);
}
