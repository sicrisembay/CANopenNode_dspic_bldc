PHONY := menuconfig defconfig saveconfig

ROOT_KCONFIG := $(CURDIR)/Kconfig
KCONFIG_CONFIG := $(CURDIR)/config/.config
DEFCONFIG_FILE := dspic_defconfig

export ROOT_KCONFIG KCONFIG_CONFIG DEFCONFIG_FILE

menuconfig:
	cd config && make menuconfig

defconfig:
	cd config && make defconfig

saveconfig:
	cd config && make saveconfig