################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/fsl_clock.c \
../drivers/fsl_common.c \
../drivers/fsl_common_arm.c \
../drivers/fsl_gpio.c \
../drivers/fsl_inputmux.c \
../drivers/fsl_power.c \
../drivers/fsl_reset.c \
../drivers/fsl_spi.c \
../drivers/fsl_swm.c \
../drivers/fsl_syscon.c \
../drivers/fsl_usart.c 

C_DEPS += \
./drivers/fsl_clock.d \
./drivers/fsl_common.d \
./drivers/fsl_common_arm.d \
./drivers/fsl_gpio.d \
./drivers/fsl_inputmux.d \
./drivers/fsl_power.d \
./drivers/fsl_reset.d \
./drivers/fsl_spi.d \
./drivers/fsl_swm.d \
./drivers/fsl_syscon.d \
./drivers/fsl_usart.d 

OBJS += \
./drivers/fsl_clock.o \
./drivers/fsl_common.o \
./drivers/fsl_common_arm.o \
./drivers/fsl_gpio.o \
./drivers/fsl_inputmux.o \
./drivers/fsl_power.o \
./drivers/fsl_reset.o \
./drivers/fsl_spi.o \
./drivers/fsl_swm.o \
./drivers/fsl_syscon.o \
./drivers/fsl_usart.o 


# Each subdirectory must supply rules for building sources it contributes
drivers/%.o: ../drivers/%.c drivers/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_LPC824 -DCPU_LPC824M201JHI33 -DMCUXPRESSO_SDK -DCPU_LPC824M201JHI33_cm0plus -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\source" -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\utilities" -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\drivers" -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\device" -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\component\uart" -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\CMSIS" -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\board" -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\lpcxpresso824max\driver_examples\spi\polling\master" -O0 -fno-common -g3 -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-drivers

clean-drivers:
	-$(RM) ./drivers/fsl_clock.d ./drivers/fsl_clock.o ./drivers/fsl_common.d ./drivers/fsl_common.o ./drivers/fsl_common_arm.d ./drivers/fsl_common_arm.o ./drivers/fsl_gpio.d ./drivers/fsl_gpio.o ./drivers/fsl_inputmux.d ./drivers/fsl_inputmux.o ./drivers/fsl_power.d ./drivers/fsl_power.o ./drivers/fsl_reset.d ./drivers/fsl_reset.o ./drivers/fsl_spi.d ./drivers/fsl_spi.o ./drivers/fsl_swm.d ./drivers/fsl_swm.o ./drivers/fsl_syscon.d ./drivers/fsl_syscon.o ./drivers/fsl_usart.d ./drivers/fsl_usart.o

.PHONY: clean-drivers

