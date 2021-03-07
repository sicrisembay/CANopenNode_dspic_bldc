/*!
 * \file drv_pwm.h
 */
#ifndef DRV_PWM_H
#define DRV_PWM_H

#include "global_def.h"

/*!
 * \def configPWM_FREQ_HZ
 */
#define configPWM_FREQ_HZ       (20000)

/*!
 * \def configPWM_TMR_PRESCALER
 */
#define configPWM_TMR_PRESCALER (1)

/*!
 * \def PWM_PERIOD
 */
#define PWM_PERIOD              (UNSIGNED16_T)((configCPU_CLOCK_HZ/((UNSIGNED32_T)configPWM_FREQ_HZ * configPWM_TMR_PRESCALER *2))-1)

/*!
 * \def DEAD_TIME
 */
#define DEAD_TIME               (4)

/*!
 * \def PWM_MAX_DUTY_VAL
 */
#define PWM_MAX_DUTY_VAL        (UNSIGNED16_T)((configCPU_CLOCK_HZ/((UNSIGNED32_T)configPWM_FREQ_HZ * configPWM_TMR_PRESCALER))-2*DEAD_TIME) // TODO: Investigate the MAX PWM.

/*!
 * \brief  This function initializes <add here>
 * \param  None
 * \return None
 */
void DrvPwm_Init(void);
void DrvPwm_UpdateDutyCycle(UNSIGNED16_T dutyCycle);
void DrvPwm_UpdateCommutation(UNSIGNED16_T sectorNumber);

#endif // End DRV_TIMER_H
