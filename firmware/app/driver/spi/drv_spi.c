#include "autoconf.h"
#include "global_def.h"
#include "drv_spi.h"

#if CONFIG_ENABLE_DRV_SPI

static BOOLEAN_T bInit = FALSE;

DRV_SPI_RET_T DrvSpiInit(void)
{
    if(!bInit) {
        bInit = TRUE;
    }
    return DRV_SPI_OK;
}

#endif /* CONFIG_ENABLE_DRV_SPI */
