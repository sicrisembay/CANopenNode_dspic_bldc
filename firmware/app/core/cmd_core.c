#include "autoconf.h"

#if CONFIG_CORE_TEST_CMD
#include "string.h"     // used for memset
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

#endif

void CORE_CMD_init(void)
{
#if CONFIG_CORE_CMD_RESET
    FreeRTOS_CLIRegisterCommand(&cmd_reset);
#endif
}

#endif /* CONFIG_CORE_TEST_CMD */
