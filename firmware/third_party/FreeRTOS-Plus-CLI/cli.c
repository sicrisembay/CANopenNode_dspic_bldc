#include "autoconf.h"

#if CONFIG_USE_CLI

#include "stdbool.h"
#include "string.h"
#include "FreeRTOS.h"
#include "task.h"
#include "FreeRTOS_CLI.h"

#include "drv_uart.h"

static bool bInit = false;
static StaticTask_t xTaskBuffer;
static StackType_t xStack[CONFIG_CLI_TASK_STACK_SZ];
static TaskHandle_t xHandle = NULL;
static char input_strBuf[CONFIG_CLI_COMMAND_MAX_INPUT_SIZE];
static const char * const welcomeString = "\r\n\n"
        "******************************************************\r\n"
        "* Type 'help' to view a list of registered commands.\r\n"
        "******************************************************\r\n";
static const char * const strLineSep = "\r\n";
static const char * const strPrompt = "$ ";
#if defined( CONFIG_CLI_ECHO_INPUT )
static const char BsDel[] = { 0x08, 0x20, 0x08 };  // known as "Destructive Backspace"
#endif

static void commandConsoleTask(void * pvParam)
{
    int16_t inputIndex =0;
    int16_t moreDataToFollow = 0;
    char * output_str_buf = NULL;
    char rxChar = 0;

    output_str_buf = FreeRTOS_CLIGetOutputBuffer();

    DrvUart_Write(welcomeString, strlen(welcomeString));
    DrvUart_Write(strPrompt, strlen(strPrompt));

    while(1) {
        DrvUart_Read(&rxChar, portMAX_DELAY);

        /* Accept only ASCII (0x00 - 0x7F) */
        if((rxChar < 0x00) || (rxChar > 0x7F)) {
            continue;
        }

        if(rxChar == '\n') {
            /*
             * A newline character was received, so the input command string is
             * complete and can be processed.  Transmit a line separator, just to
             * make the output easier to read.
             */
            DrvUart_Write(strLineSep, strlen(strLineSep));
            DrvUart_Write(strLineSep, strlen(strLineSep));

            if(strlen(input_strBuf) == 0) {
                /* No command to process */
                /* Just print prompt */
                DrvUart_Write((char *)strPrompt, 2);
                continue;
            }

            /*
             * The command interpreter is called repeatedly until it returns
             * pdFALSE (0).
             */
            do {
                /*
                 * Send the command string to the command interpreter.  Any
                 * output generated by the command interpreter will be placed in the
                 * output_str_buf buffer.
                 */
                moreDataToFollow = FreeRTOS_CLIProcessCommand
                              (
                                  input_strBuf,                         /* The command string.*/
                                  output_str_buf,                       /* The output buffer. */
                                  CONFIG_CLI_COMMAND_MAX_OUTPUT_SIZE    /* The size of the output buffer. */
                              );

                /*
                 * Write the output generated by the command interpreter to the
                 * console.
                 */
                DrvUart_Write(output_str_buf, strlen(output_str_buf));

            } while( moreDataToFollow != 0 );

            /*
             * All the strings generated by the input command have been sent.
             * Processing of the command is complete.  Clear the input string ready
             * to receive the next command.
             */
            inputIndex = 0;
            memset( input_strBuf, 0x00, sizeof(input_strBuf) );

            /* print prompt symbol */
            DrvUart_Write((char *)strPrompt, 2);
        } else {
            /*
             * The if() clause performs the processing after a newline character
             * is received.  This else clause performs the processing if any other
             * character is received. */
            if( rxChar == '\r' ) {
                /* Ignore carriage returns. */\

            } else if(( rxChar == 0x08 ) || (rxChar == 0x7F)) {
                /*
                 * Note: Keyboard backspace sends ascii 0x08 or 0x7F, depending on some settings
                 * Backspace was pressed.  Erase the last character in the input
                 * buffer - if there are any
                 */
                if( inputIndex > 0 ) {
                    inputIndex--;
                    input_strBuf[ inputIndex ] = '\0';
#if defined( CONFIG_CLI_ECHO_INPUT )
                    /* Send destructive backspace */
                    DrvUart_Write(BsDel, 3);
#endif
                }
            } else {
                /*
                 * A character was entered.  It was not a new line, backspace
                 * or carriage return, so it is accepted as part of the input and
                 * placed into the input buffer.  When a n is entered the complete
                 * string will be passed to the command interpreter.
                 */
                if( inputIndex < CONFIG_CLI_COMMAND_MAX_INPUT_SIZE ) {
                    input_strBuf[ inputIndex ] = rxChar;
                    inputIndex++;
#if defined( CONFIG_CLI_ECHO_INPUT )
                    DrvUart_Write(&rxChar, 1);
#endif
                }
            }
        }
    }
}


void CLI_init(void)
{
    if(!bInit) {
        memset(input_strBuf, 0, sizeof(input_strBuf));

        DrvUart_Init();

        /*
         * Create command console task
         */
        if(xHandle == NULL) {
            xHandle = xTaskCreateStatic(
                                commandConsoleTask,
                                "cli",
                                CONFIG_CLI_TASK_STACK_SZ,
                                NULL,
                                TASK_PRIORITY_LOW,
                                xStack,
                                &xTaskBuffer);
        }
        
        bInit = true;
    }
}

#endif /* CONFIG_USE_CLI */
