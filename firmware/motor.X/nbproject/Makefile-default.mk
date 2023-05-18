#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/motor.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/motor.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../app/bldc/bldc.c ../app/driver/drv_timer.c ../app/driver/drv_adc.c ../app/driver/drv_pwm.c ../app/driver/drv_uart.c ../app/freertos/hook.c ../app/pcIntf/pc_interface.c ../app/utility/filter/util_filter.c ../app/utility/util_trace.c ../app/main.c ../third_party/FreeRTOS/portable/MemMang/heap_1.c ../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.c ../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S ../third_party/FreeRTOS/event_groups.c ../third_party/FreeRTOS/list.c ../third_party/FreeRTOS/queue.c ../third_party/FreeRTOS/stream_buffer.c ../third_party/FreeRTOS/tasks.c ../third_party/FreeRTOS/timers.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/566887654/bldc.o ${OBJECTDIR}/_ext/618841211/drv_timer.o ${OBJECTDIR}/_ext/618841211/drv_adc.o ${OBJECTDIR}/_ext/618841211/drv_pwm.o ${OBJECTDIR}/_ext/618841211/drv_uart.o ${OBJECTDIR}/_ext/1354880047/hook.o ${OBJECTDIR}/_ext/290104761/pc_interface.o ${OBJECTDIR}/_ext/998514728/util_filter.o ${OBJECTDIR}/_ext/255416751/util_trace.o ${OBJECTDIR}/_ext/1360919890/main.o ${OBJECTDIR}/_ext/1859827547/heap_1.o ${OBJECTDIR}/_ext/485308804/port.o ${OBJECTDIR}/_ext/485308804/portasm_dsPIC.o ${OBJECTDIR}/_ext/1051866110/event_groups.o ${OBJECTDIR}/_ext/1051866110/list.o ${OBJECTDIR}/_ext/1051866110/queue.o ${OBJECTDIR}/_ext/1051866110/stream_buffer.o ${OBJECTDIR}/_ext/1051866110/tasks.o ${OBJECTDIR}/_ext/1051866110/timers.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/566887654/bldc.o.d ${OBJECTDIR}/_ext/618841211/drv_timer.o.d ${OBJECTDIR}/_ext/618841211/drv_adc.o.d ${OBJECTDIR}/_ext/618841211/drv_pwm.o.d ${OBJECTDIR}/_ext/618841211/drv_uart.o.d ${OBJECTDIR}/_ext/1354880047/hook.o.d ${OBJECTDIR}/_ext/290104761/pc_interface.o.d ${OBJECTDIR}/_ext/998514728/util_filter.o.d ${OBJECTDIR}/_ext/255416751/util_trace.o.d ${OBJECTDIR}/_ext/1360919890/main.o.d ${OBJECTDIR}/_ext/1859827547/heap_1.o.d ${OBJECTDIR}/_ext/485308804/port.o.d ${OBJECTDIR}/_ext/485308804/portasm_dsPIC.o.d ${OBJECTDIR}/_ext/1051866110/event_groups.o.d ${OBJECTDIR}/_ext/1051866110/list.o.d ${OBJECTDIR}/_ext/1051866110/queue.o.d ${OBJECTDIR}/_ext/1051866110/stream_buffer.o.d ${OBJECTDIR}/_ext/1051866110/tasks.o.d ${OBJECTDIR}/_ext/1051866110/timers.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/566887654/bldc.o ${OBJECTDIR}/_ext/618841211/drv_timer.o ${OBJECTDIR}/_ext/618841211/drv_adc.o ${OBJECTDIR}/_ext/618841211/drv_pwm.o ${OBJECTDIR}/_ext/618841211/drv_uart.o ${OBJECTDIR}/_ext/1354880047/hook.o ${OBJECTDIR}/_ext/290104761/pc_interface.o ${OBJECTDIR}/_ext/998514728/util_filter.o ${OBJECTDIR}/_ext/255416751/util_trace.o ${OBJECTDIR}/_ext/1360919890/main.o ${OBJECTDIR}/_ext/1859827547/heap_1.o ${OBJECTDIR}/_ext/485308804/port.o ${OBJECTDIR}/_ext/485308804/portasm_dsPIC.o ${OBJECTDIR}/_ext/1051866110/event_groups.o ${OBJECTDIR}/_ext/1051866110/list.o ${OBJECTDIR}/_ext/1051866110/queue.o ${OBJECTDIR}/_ext/1051866110/stream_buffer.o ${OBJECTDIR}/_ext/1051866110/tasks.o ${OBJECTDIR}/_ext/1051866110/timers.o

# Source Files
SOURCEFILES=../app/bldc/bldc.c ../app/driver/drv_timer.c ../app/driver/drv_adc.c ../app/driver/drv_pwm.c ../app/driver/drv_uart.c ../app/freertos/hook.c ../app/pcIntf/pc_interface.c ../app/utility/filter/util_filter.c ../app/utility/util_trace.c ../app/main.c ../third_party/FreeRTOS/portable/MemMang/heap_1.c ../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.c ../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S ../third_party/FreeRTOS/event_groups.c ../third_party/FreeRTOS/list.c ../third_party/FreeRTOS/queue.c ../third_party/FreeRTOS/stream_buffer.c ../third_party/FreeRTOS/tasks.c ../third_party/FreeRTOS/timers.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/motor.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ128MC706A
MP_LINKER_FILE_OPTION=,--script=p33FJ128MC706A.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/566887654/bldc.o: ../app/bldc/bldc.c  .generated_files/flags/default/fff78ca249be770cb71a72a7774f3307b100c563 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/566887654" 
	@${RM} ${OBJECTDIR}/_ext/566887654/bldc.o.d 
	@${RM} ${OBJECTDIR}/_ext/566887654/bldc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/bldc/bldc.c  -o ${OBJECTDIR}/_ext/566887654/bldc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/566887654/bldc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/618841211/drv_timer.o: ../app/driver/drv_timer.c  .generated_files/flags/default/14ac0b8ef79e9e2adb9dbe0c3ea596e030f49bd4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/618841211" 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/driver/drv_timer.c  -o ${OBJECTDIR}/_ext/618841211/drv_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/618841211/drv_timer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/618841211/drv_adc.o: ../app/driver/drv_adc.c  .generated_files/flags/default/60ced9ca2f3afe520f8dc90e93dedd01002ec9f6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/618841211" 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/driver/drv_adc.c  -o ${OBJECTDIR}/_ext/618841211/drv_adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/618841211/drv_adc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/618841211/drv_pwm.o: ../app/driver/drv_pwm.c  .generated_files/flags/default/53041b0739ef1c0cca4227b3e8087194e2a5a5db .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/618841211" 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/driver/drv_pwm.c  -o ${OBJECTDIR}/_ext/618841211/drv_pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/618841211/drv_pwm.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/618841211/drv_uart.o: ../app/driver/drv_uart.c  .generated_files/flags/default/456fb0b19362a3a73e83168a90ebb909855ec711 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/618841211" 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/driver/drv_uart.c  -o ${OBJECTDIR}/_ext/618841211/drv_uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/618841211/drv_uart.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1354880047/hook.o: ../app/freertos/hook.c  .generated_files/flags/default/9df5fd3dda32d295b4d9364f32bcc9712d4cbf71 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1354880047" 
	@${RM} ${OBJECTDIR}/_ext/1354880047/hook.o.d 
	@${RM} ${OBJECTDIR}/_ext/1354880047/hook.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/freertos/hook.c  -o ${OBJECTDIR}/_ext/1354880047/hook.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1354880047/hook.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/290104761/pc_interface.o: ../app/pcIntf/pc_interface.c  .generated_files/flags/default/1dd99029be529d3d93669c0619a95c169df83a7c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/290104761" 
	@${RM} ${OBJECTDIR}/_ext/290104761/pc_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/290104761/pc_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/pcIntf/pc_interface.c  -o ${OBJECTDIR}/_ext/290104761/pc_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/290104761/pc_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/998514728/util_filter.o: ../app/utility/filter/util_filter.c  .generated_files/flags/default/1c7b62d6e6940a66cd1a7bd9f70d06de9253f8e6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/998514728" 
	@${RM} ${OBJECTDIR}/_ext/998514728/util_filter.o.d 
	@${RM} ${OBJECTDIR}/_ext/998514728/util_filter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/utility/filter/util_filter.c  -o ${OBJECTDIR}/_ext/998514728/util_filter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/998514728/util_filter.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/255416751/util_trace.o: ../app/utility/util_trace.c  .generated_files/flags/default/3c3557b5f7c298d02a4f98b696b54ca09fa0cce5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/255416751" 
	@${RM} ${OBJECTDIR}/_ext/255416751/util_trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/255416751/util_trace.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/utility/util_trace.c  -o ${OBJECTDIR}/_ext/255416751/util_trace.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/255416751/util_trace.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1360919890/main.o: ../app/main.c  .generated_files/flags/default/88e06b9edd7d416a00a79138c204c2c7be956412 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360919890" 
	@${RM} ${OBJECTDIR}/_ext/1360919890/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360919890/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/main.c  -o ${OBJECTDIR}/_ext/1360919890/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1360919890/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1859827547/heap_1.o: ../third_party/FreeRTOS/portable/MemMang/heap_1.c  .generated_files/flags/default/f34b731547c854895eb3b1212e19f53b67183754 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1859827547" 
	@${RM} ${OBJECTDIR}/_ext/1859827547/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1859827547/heap_1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/portable/MemMang/heap_1.c  -o ${OBJECTDIR}/_ext/1859827547/heap_1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1859827547/heap_1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/485308804/port.o: ../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.c  .generated_files/flags/default/d625f24a45099bceba5145a7f3e4cbdb752eb271 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/485308804" 
	@${RM} ${OBJECTDIR}/_ext/485308804/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/485308804/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.c  -o ${OBJECTDIR}/_ext/485308804/port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/485308804/port.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1051866110/event_groups.o: ../third_party/FreeRTOS/event_groups.c  .generated_files/flags/default/82a16ab914dcd2033bf805373a949e281f215c1a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1051866110" 
	@${RM} ${OBJECTDIR}/_ext/1051866110/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/1051866110/event_groups.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/event_groups.c  -o ${OBJECTDIR}/_ext/1051866110/event_groups.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1051866110/event_groups.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1051866110/list.o: ../third_party/FreeRTOS/list.c  .generated_files/flags/default/644d30643cbedada72cf9cbac6a5bb3a1c847df8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1051866110" 
	@${RM} ${OBJECTDIR}/_ext/1051866110/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1051866110/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/list.c  -o ${OBJECTDIR}/_ext/1051866110/list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1051866110/list.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1051866110/queue.o: ../third_party/FreeRTOS/queue.c  .generated_files/flags/default/d4c763e6d862a4a127908ab091b7cc21d82443c0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1051866110" 
	@${RM} ${OBJECTDIR}/_ext/1051866110/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1051866110/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/queue.c  -o ${OBJECTDIR}/_ext/1051866110/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1051866110/queue.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1051866110/stream_buffer.o: ../third_party/FreeRTOS/stream_buffer.c  .generated_files/flags/default/1f4d2785a731d78d62ad4f5e83ed3c0a01a48430 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1051866110" 
	@${RM} ${OBJECTDIR}/_ext/1051866110/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1051866110/stream_buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/stream_buffer.c  -o ${OBJECTDIR}/_ext/1051866110/stream_buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1051866110/stream_buffer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1051866110/tasks.o: ../third_party/FreeRTOS/tasks.c  .generated_files/flags/default/1d2e6613508bc8372b52f0871aab4d8d006b982 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1051866110" 
	@${RM} ${OBJECTDIR}/_ext/1051866110/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1051866110/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/tasks.c  -o ${OBJECTDIR}/_ext/1051866110/tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1051866110/tasks.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1051866110/timers.o: ../third_party/FreeRTOS/timers.c  .generated_files/flags/default/d4a42a84d1e6a96d46dcbd6006ade65e380e709e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1051866110" 
	@${RM} ${OBJECTDIR}/_ext/1051866110/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1051866110/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/timers.c  -o ${OBJECTDIR}/_ext/1051866110/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1051866110/timers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/566887654/bldc.o: ../app/bldc/bldc.c  .generated_files/flags/default/96fa756502a6a897e4d78edb3be18097cf8f15ea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/566887654" 
	@${RM} ${OBJECTDIR}/_ext/566887654/bldc.o.d 
	@${RM} ${OBJECTDIR}/_ext/566887654/bldc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/bldc/bldc.c  -o ${OBJECTDIR}/_ext/566887654/bldc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/566887654/bldc.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/618841211/drv_timer.o: ../app/driver/drv_timer.c  .generated_files/flags/default/506305f65624e43b5f80f2aff85f6a0a606fbf11 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/618841211" 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/driver/drv_timer.c  -o ${OBJECTDIR}/_ext/618841211/drv_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/618841211/drv_timer.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/618841211/drv_adc.o: ../app/driver/drv_adc.c  .generated_files/flags/default/466f24fcc905464cf1495475ab35b4f2850a277 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/618841211" 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/driver/drv_adc.c  -o ${OBJECTDIR}/_ext/618841211/drv_adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/618841211/drv_adc.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/618841211/drv_pwm.o: ../app/driver/drv_pwm.c  .generated_files/flags/default/c37397a2a6016529a139accabfc56818bead6beb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/618841211" 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/driver/drv_pwm.c  -o ${OBJECTDIR}/_ext/618841211/drv_pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/618841211/drv_pwm.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/618841211/drv_uart.o: ../app/driver/drv_uart.c  .generated_files/flags/default/18c5b90b21f6aa057f80eb53fa38dbe967e15975 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/618841211" 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/618841211/drv_uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/driver/drv_uart.c  -o ${OBJECTDIR}/_ext/618841211/drv_uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/618841211/drv_uart.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1354880047/hook.o: ../app/freertos/hook.c  .generated_files/flags/default/5cc10ff383140341207f7d40cb66579c8e9c9183 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1354880047" 
	@${RM} ${OBJECTDIR}/_ext/1354880047/hook.o.d 
	@${RM} ${OBJECTDIR}/_ext/1354880047/hook.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/freertos/hook.c  -o ${OBJECTDIR}/_ext/1354880047/hook.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1354880047/hook.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/290104761/pc_interface.o: ../app/pcIntf/pc_interface.c  .generated_files/flags/default/69808f0ce636b53b74261dc99f65378a1f825369 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/290104761" 
	@${RM} ${OBJECTDIR}/_ext/290104761/pc_interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/290104761/pc_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/pcIntf/pc_interface.c  -o ${OBJECTDIR}/_ext/290104761/pc_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/290104761/pc_interface.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/998514728/util_filter.o: ../app/utility/filter/util_filter.c  .generated_files/flags/default/4a8caaa77db2b0c856543a52719e652b5e0d889 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/998514728" 
	@${RM} ${OBJECTDIR}/_ext/998514728/util_filter.o.d 
	@${RM} ${OBJECTDIR}/_ext/998514728/util_filter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/utility/filter/util_filter.c  -o ${OBJECTDIR}/_ext/998514728/util_filter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/998514728/util_filter.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/255416751/util_trace.o: ../app/utility/util_trace.c  .generated_files/flags/default/a3cdeb9e7d6b5b64e7203957b3c52ab75331bfed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/255416751" 
	@${RM} ${OBJECTDIR}/_ext/255416751/util_trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/255416751/util_trace.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/utility/util_trace.c  -o ${OBJECTDIR}/_ext/255416751/util_trace.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/255416751/util_trace.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1360919890/main.o: ../app/main.c  .generated_files/flags/default/b5758daefb50aca855fa9fe2ebab8e052911fa5f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360919890" 
	@${RM} ${OBJECTDIR}/_ext/1360919890/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360919890/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../app/main.c  -o ${OBJECTDIR}/_ext/1360919890/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1360919890/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1859827547/heap_1.o: ../third_party/FreeRTOS/portable/MemMang/heap_1.c  .generated_files/flags/default/abef696dc23d76bf06b974476664bcb771fda820 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1859827547" 
	@${RM} ${OBJECTDIR}/_ext/1859827547/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1859827547/heap_1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/portable/MemMang/heap_1.c  -o ${OBJECTDIR}/_ext/1859827547/heap_1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1859827547/heap_1.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/485308804/port.o: ../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.c  .generated_files/flags/default/849df3f966780c4aa3954a2d7c535cfa19c86013 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/485308804" 
	@${RM} ${OBJECTDIR}/_ext/485308804/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/485308804/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.c  -o ${OBJECTDIR}/_ext/485308804/port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/485308804/port.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1051866110/event_groups.o: ../third_party/FreeRTOS/event_groups.c  .generated_files/flags/default/6532fca5508715eb29ec59f9480ec83d12d4019 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1051866110" 
	@${RM} ${OBJECTDIR}/_ext/1051866110/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/1051866110/event_groups.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/event_groups.c  -o ${OBJECTDIR}/_ext/1051866110/event_groups.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1051866110/event_groups.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1051866110/list.o: ../third_party/FreeRTOS/list.c  .generated_files/flags/default/51e7870e659d301b22ff276e5eefebf4bbbf1857 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1051866110" 
	@${RM} ${OBJECTDIR}/_ext/1051866110/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1051866110/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/list.c  -o ${OBJECTDIR}/_ext/1051866110/list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1051866110/list.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1051866110/queue.o: ../third_party/FreeRTOS/queue.c  .generated_files/flags/default/649121b6a3be126c566c937994bd7ea3a31c8082 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1051866110" 
	@${RM} ${OBJECTDIR}/_ext/1051866110/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1051866110/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/queue.c  -o ${OBJECTDIR}/_ext/1051866110/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1051866110/queue.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1051866110/stream_buffer.o: ../third_party/FreeRTOS/stream_buffer.c  .generated_files/flags/default/69735034039d57c0c0cf53c130556b02821f9ca9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1051866110" 
	@${RM} ${OBJECTDIR}/_ext/1051866110/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1051866110/stream_buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/stream_buffer.c  -o ${OBJECTDIR}/_ext/1051866110/stream_buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1051866110/stream_buffer.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1051866110/tasks.o: ../third_party/FreeRTOS/tasks.c  .generated_files/flags/default/6bc1e9e95959a5dde2ed122bdc91638168d3dd95 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1051866110" 
	@${RM} ${OBJECTDIR}/_ext/1051866110/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1051866110/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/tasks.c  -o ${OBJECTDIR}/_ext/1051866110/tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1051866110/tasks.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1051866110/timers.o: ../third_party/FreeRTOS/timers.c  .generated_files/flags/default/385cda4415396c0d0e141cb82776a28cb19cdbea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1051866110" 
	@${RM} ${OBJECTDIR}/_ext/1051866110/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1051866110/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../third_party/FreeRTOS/timers.c  -o ${OBJECTDIR}/_ext/1051866110/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1051866110/timers.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../app/bldc" -I"../app/driver" -I"../app/pcIntf" -I"../app/utility" -I"../app/utility/filter" -I"../config" -I"../third_party/FreeRTOS/include" -I"../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/485308804/portasm_dsPIC.o: ../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  .generated_files/flags/default/e6cabe14899b0b752cf7da00f7e8ff09d286d392 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/485308804" 
	@${RM} ${OBJECTDIR}/_ext/485308804/portasm_dsPIC.o.d 
	@${RM} ${OBJECTDIR}/_ext/485308804/portasm_dsPIC.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  -o ${OBJECTDIR}/_ext/485308804/portasm_dsPIC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/485308804/portasm_dsPIC.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/_ext/485308804/portasm_dsPIC.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/485308804/portasm_dsPIC.o: ../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  .generated_files/flags/default/4b98ecd012ff62ca82a33e4a4decf4f32c7d0d6c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/485308804" 
	@${RM} ${OBJECTDIR}/_ext/485308804/portasm_dsPIC.o.d 
	@${RM} ${OBJECTDIR}/_ext/485308804/portasm_dsPIC.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../third_party/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  -o ${OBJECTDIR}/_ext/485308804/portasm_dsPIC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/485308804/portasm_dsPIC.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/_ext/485308804/portasm_dsPIC.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/motor.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  C:/Program\ Files/Microchip/xc16/v2.10/lib/libq-dsp-elf.a  
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/motor.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    "C:\Program Files\Microchip\xc16\v2.10\lib\libq-dsp-elf.a"  -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml,-lq$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/motor.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  C:/Program\ Files/Microchip/xc16/v2.10/lib/libq-dsp-elf.a 
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/motor.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    "C:\Program Files\Microchip\xc16\v2.10\lib\libq-dsp-elf.a"  -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml,-lq$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/motor.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
