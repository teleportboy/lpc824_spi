################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../source/semihost_hardfault.c \
../source/spi_polling_master.c 

C_DEPS += \
./source/semihost_hardfault.d \
./source/spi_polling_master.d 

OBJS += \
./source/semihost_hardfault.o \
./source/spi_polling_master.o 


# Each subdirectory must supply rules for building sources it contributes
source/%.o: ../source/%.c source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_LPC824 -DCPU_LPC824M201JHI33 -DMCUXPRESSO_SDK -DCPU_LPC824M201JHI33_cm0plus -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\source" -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\utilities" -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\drivers" -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\device" -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\component\uart" -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\CMSIS" -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\board" -I"C:\Users\user\Documents\MCUXpressoIDE_11.8.0_1165\uart\spi_polling_master\lpcxpresso824max\driver_examples\spi\polling\master" -O0 -fno-common -g3 -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-source

clean-source:
	-$(RM) ./source/semihost_hardfault.d ./source/semihost_hardfault.o ./source/spi_polling_master.d ./source/spi_polling_master.o

.PHONY: clean-source

