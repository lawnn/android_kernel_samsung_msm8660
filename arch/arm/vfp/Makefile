#
# linux/arch/arm/vfp/Makefile
#
# Copyright (C) 2001 ARM Limited
#

# ccflags-y := -DDEBUG
# asflags-y := -DDEBUG
ifeq ($(USE_CFLAGS_OPTION),y)
KBUILD_AFLAGS  :=$(KBUILD_AFLAGS:-msoft-float=-Wa,-mfpu=neon-vfpv4 -mfloat-abi=soft)
else
KBUILD_AFLAGS	:=$(KBUILD_AFLAGS:-msoft-float=-Wa,-mfpu=softvfp+vfp)
endif
LDFLAGS		+=--no-warn-mismatch

obj-y			+= vfp.o

vfp-$(CONFIG_VFP)	+= vfpmodule.o entry.o vfphw.o vfpsingle.o vfpdouble.o
