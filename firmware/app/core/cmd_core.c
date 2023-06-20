#include "autoconf.h"

#if CONFIG_CORE_TEST_CMD
#include "string.h"     // used for memset
#include "stdio.h"      // used for snprintf
#include "FreeRTOS.h"
#include "FreeRTOS_CLI.h"

#if CONFIG_CORE_CMD_RESET

static BaseType_t FuncReset( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString )
{
    memset(pcWriteBuffer, 0, xWriteBufferLen);
    asm("RESET");
    return 0;
}


static const CLI_Command_Definition_t cmd_reset = {
    "reset",
    "reset:\r\n"
    "  Resets the MCU\r\n\r\n",
    FuncReset,
    0
};

#endif /* CONFIG_CORE_CMD_RESET */


#if CONFIG_CORE_CMD_TASKSTAT

static BaseType_t FuncTaskStat( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString )
{
    static uint16_t state = 0;
    char ptrTaskList[250];
    BaseType_t ret = pdFALSE;
    memset(pcWriteBuffer, 0, xWriteBufferLen);

    switch(state) {
        case 0: {
            snprintf(pcWriteBuffer, xWriteBufferLen,
                    "**********************************\r\n"
                    "Task  State   Prio    Stack    Num\r\n"
                    "**********************************\r\n");
            ret = pdTRUE;
            state++;
            break;
        }
        case 1: {
            vTaskList(ptrTaskList);
            snprintf(pcWriteBuffer, xWriteBufferLen, "%s", ptrTaskList);
            state++;
            ret = pdTRUE;
            break;
        }
        default: {
            snprintf(pcWriteBuffer, xWriteBufferLen, "\r\n\r\n");
            state = 0;
            ret = pdFALSE;
        }
    }
    return ret;
}


static const CLI_Command_Definition_t cmd_taskStat = {
    "task_stat",
    "task_stat:\r\n"
    "  Prints the task statistics\r\n\r\n",
    FuncTaskStat,
    0
};


#endif /* CONFIG_CORE_CMD_TASKSTAT */

void CORE_CMD_init(void)
{
#if CONFIG_CORE_CMD_RESET
    FreeRTOS_CLIRegisterCommand(&cmd_reset);
#endif

#if CONFIG_CORE_CMD_TASKSTAT
    FreeRTOS_CLIRegisterCommand(&cmd_taskStat);
#endif
}

#endif /* CONFIG_CORE_TEST_CMD */
