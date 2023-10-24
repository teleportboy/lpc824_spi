#include "fsl_spi.h"
#include "pin_mux.h"
#include "board.h"
#include "fsl_debug_console.h"

#include <stdbool.h>

#define SPI_MASTER          SPI0
#define MASTER_CLK_SRC      kCLOCK_MainClk
#define SPI_MASTER_CLK_FREQ CLOCK_GetFreq(MASTER_CLK_SRC)
#define SPI_MASTER_BAUDRATE 500000U
#define SPI_MASTER_SSEL     kSPI_Ssel0Assert

static void SPIMasterInit(void);
static void MasterStartTransfer(uint8_t reg);
static void TransferDataCheck(void);
static void activateISM330(void);
static void writeToISM330Registr(uint8_t, uint8_t);

#define BUFFER_SIZE (4)
static uint8_t txBuffer[BUFFER_SIZE];
static uint8_t rxBuffer[BUFFER_SIZE];

int main(void)
{
    CLOCK_EnableClock(kCLOCK_Uart0);

    CLOCK_SetClkDivider(kCLOCK_DivUsartClk, 1U);

    CLOCK_EnableClock(kCLOCK_Spi0);

    BOARD_InitBootPins();
    BOARD_InitBootClocks();
    BOARD_InitDebugConsole();

    SPIMasterInit();

    for (volatile int i = 0; i < 1000000; i++) {}

    activateISM330();

    for (volatile int i = 0; i < 10000; i++) {}
    MasterStartTransfer(0x0F);

    TransferDataCheck();

    while(1) {

    }

    SPI_Deinit(SPI_MASTER);
}



static void SPIMasterInit(void)
{
    spi_master_config_t userConfig = {0};
    uint32_t srcFreq               = 0U;

    SPI_MasterGetDefaultConfig(&userConfig);
    userConfig.baudRate_Bps   = SPI_MASTER_BAUDRATE;
    userConfig.sselNumber     = kSPI_Ssel0Assert;
    userConfig.clockPolarity  = kSPI_ClockPolarityActiveLow;
    userConfig.clockPhase     = kSPI_ClockPhaseFirstEdge;
    userConfig.direction      = kSPI_MsbFirst;
    userConfig.dataWidth      = kSPI_Data8Bits;
    userConfig.sselPolarity   = kSPI_SpolActiveAllLow;
    userConfig.enableLoopback = false;
    userConfig.delayConfig.postDelay     = 0x10;
    userConfig.delayConfig.preDelay      = 0x09;
    //userConfig.delayConfig.transferDelay = 0xFF;
    //PRINTF("CLK FREQ: %d\n\r", SPI_MASTER_CLK_FREQ);
    srcFreq = SPI_MASTER_CLK_FREQ;
    SPI_MasterInit(SPI_MASTER, &userConfig, srcFreq);
}

static void activateISM330(void)
{
	txBuffer[0] = 0x01; // 0000 0001 first bit = r/w
	txBuffer[1] = 0x00; // 1000 0000


	spi_transfer_t xfer = {0};

    xfer.txData      = txBuffer;
    xfer.rxData      = rxBuffer;
    xfer.dataSize    = sizeof(txBuffer);
    xfer.configFlags = kSPI_EndOfTransfer | kSPI_EndOfFrame;

    SPI_MasterTransferBlocking(SPI_MASTER, &xfer);
}

static void writeToISM330Registr(uint8_t reg, uint8_t data)
{
	spi_transfer_t xfer = {0};
	for(int i = 0; i < BUFFER_SIZE; i++) {
		rxBuffer[i] = 0;
		txBuffer[i] = 0;
	}

	txBuffer[0] = (0 << 7) | reg;
	txBuffer[1] = data;

	xfer.txData = txBuffer;
	xfer.rxData = rxBuffer;
	xfer.dataSize = sizeof(txBuffer);
	xfer.configFlags = kSPI_EndOfTransfer | kSPI_EndOfFrame;

	SPI_MasterTransferBlocking(SPI_MASTER, &xfer);
}

static void MasterStartTransfer(uint8_t reg)
{
    uint32_t i          = 0U;
    spi_transfer_t xfer = {0};

    for(int i = 0; i < BUFFER_SIZE; i++) {
    	rxBuffer[i] = 0;
    	txBuffer[i] = 0;
    }

    txBuffer[0] = (1 << 7) | reg;

    xfer.txData      = txBuffer;
    xfer.rxData      = rxBuffer;
    xfer.dataSize    = sizeof(txBuffer);
    xfer.configFlags = kSPI_EndOfTransfer | kSPI_EndOfFrame;
    SPI_MasterTransferBlocking(SPI_MASTER, &xfer);
}

static void TransferDataCheck(void)
{
    uint32_t i = 0U;
//    PRINTF("\n\rThe TX data are: ");
//    for(i = 0; i < BUFFER_SIZE; i++) {
//        PRINTF("0x%02X ", txBuffer[i]);
//    }

    PRINTF("\n\rThe RX data are: ");
    for(i = 0; i < BUFFER_SIZE; i++) {
    	PRINTF("0X%02X ", rxBuffer[i]);
    }

}
