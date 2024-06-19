# makefile
#
# This is the old Orange Pi interrupts_kyu project
# hacked into shape for the EBAZ4205
#
# Tom Trebisky  1-13-2021

CROSS = arm-none-eabi-

LD = $(CROSS)ld
DUMP = $(CROSS)objdump -d

GCCVERSION = `$(CROSS)gcc -dumpversion`

ABI = -isystem /usr/lib/gcc/arm-none-eabi/$(GCCVERSION)/include
LIBS = -L /usr/lib/gcc/arm-none-eabi/$(GCCVERSION) -lgcc

#CFLAGS          := -g -Wall
CFLAGS          := -ffreestanding -fno-builtin
CFLAGS          += -march=armv7-a
CFLAGS          += -Wno-implicit-function-declaration
CFLAGS          += -I.
CFLAGS          += $(ABI)

CC = $(CROSS)gcc $(CFLAGS)

OBJS = start.o main.o mio.o gpio.o ccnt.o uart.o prf.o

TARGET = mio.bin

%.bin: %.elf
	$(CROSS)objcopy -O binary $< $@

%.o: %.c
	$(CC) -c -nostdlib -c $<

.S.o:
	        $(CC) -o $@ -c $<

all: install

install: $(TARGET)
	cp $(TARGET) /var/lib/tftpboot/bitcoin.bin

dump:       mio.elf
	$(DUMP) mio.elf >mio.dump

clean:
	rm -rf *.bin *.elf *.o *.dump

obj:
	$(CROSS)objdump -h main.o

version:
	$(CC) --version

LDFLAGS = -nostdlib -z noexecstack --no-warn-rwx-segments

mio.elf: $(OBJS)
	$(LD) -o $@ $(LDFLAGS) $(OBJS) -T basic.lds $(LIBS)

# THE END
