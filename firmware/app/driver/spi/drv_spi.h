#ifndef DRV_SPI_H
#define DRV_SPI_H

#include "autoconf.h"

#if CONFIG_ENABLE_DRV_SPI

typedef enum {
    DRV_SPI_OK = 0,
    DRV_SPI_INVALID_ARG,
    DRV_SPI_INVALID_STATE,

    N_DRV_SPI_RET
} DRV_SPI_RET_T;


DRV_SPI_RET_T DrvSpiInit(void);

#endif /* CONFIG_ENABLE_DRV_SPI */
#endif /* DRV_SPI_H */
