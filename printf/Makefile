# Makefile for EBAZ4205 bare metal project
# Tom Trebisky  11-8-2018
# tom@mmto.org

TARGET = printf
CROSS_COMPILE = arm-none-eabi-

# -------------------------------------

OBJS = start.o main.o uart.o prf.o

# CFLAGS		:=	-g -Wall -Wextra -ffreestanding -fno-builtin -mlittle-endian
#CFLAGS		:=	-g -Wall -ffreestanding -fno-builtin -mlittle-endian
#CFLAGS		:=	-g -Wall -ffreestanding -fno-builtin
# -Wall ends up being a pain in the ass

CFLAGS		:=	-g -ffreestanding -fno-builtin
CFLAGS		+= -march=armv7-a
CFLAGS		+= -I.

LDFLAGS		:=	-T spl.lds \
			-nostdlib \
			-z noexecstack --no-warn-rwx-segments

CC			=	$(CROSS_COMPILE)gcc $(CFLAGS)
#LD 			=	$(CROSS_COMPILE)gcc $(LDFLAGS)
LD 			=	$(CROSS_COMPILE)ld $(LDFLAGS)
OBJCOPY			=	$(CROSS_COMPILE)objcopy
DUMP			=	$(CROSS_COMPILE)objdump

# This gives us dependencies in .d files.
# CFLAGS		+= -MMD
# This gives us a map file.
# CFLAGS		+= -Wl,-Map=$(TARGET).map,--cref \

# We need -lgcc for these:
# undefined reference to `__aeabi_uidivmod'
# undefined reference to `__aeabi_uidiv'

GCCVERSION = `$(CROSS_COMPILE)gcc -dumpversion`
ABI = -isystem /usr/lib/gcc/arm-none-eabi/$(GCCVERSION)/include
LIBS = -L /usr/lib/gcc/arm-none-eabi/$(GCCVERSION) -lgcc

.c.o:
	$(CC) $< -c -o $@

.S.o:
	$(CC) $< -c -o $@

# -------------------------------------

all: install
#all: $(TARGET).bin

help:
	$(CC) --help

install: $(TARGET).bin
	cp $(TARGET).bin /var/lib/tftpboot/bitcoin.bin


$(TARGET).elf: $(OBJS)
	$(LD) -o $(TARGET).elf $(OBJS) $(LIBS)

$(TARGET).bin: $(TARGET).elf
	$(OBJCOPY) -O binary $(TARGET).elf $(TARGET).bin

dis: $(TARGET).elf
	$(DUMP) -d $(TARGET).elf -z >$(TARGET).dis

.PHONY: clean
clean:
	rm -f *.o
	rm -f *.img
	rm -f *.elf
	rm -f *.bin
	rm -f *.map
	rm -f *.dis
#	rm -f *.d

# THE END
