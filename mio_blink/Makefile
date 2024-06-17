# makefile
#
# This is the old Orange Pi interrupts_kyu project
# hacked into shape for the EBAZ4205
#
# Tom Trebisky  1-13-2021

CROSS = arm-none-eabi-

CC = $(CROSS)gcc

ABI = -isystem /usr/lib/gcc/arm-none-eabi/$(GCCVERSION)/include
LIBS = -L /usr/lib/gcc/arm-none-eabi/$(GCCVERSION) -lgcc

#CFLAGS          := -g -Wall
CFLAGS          := -ffreestanding -fno-builtin
CFLAGS          += -march=armv7-a
CFLAGS          += -Wno-implicit-function-declaration
CFLAGS          += -I.
CFLAGS          += $(ABI)

CC = $(CROSS)gcc $(CFLAGS)
LD = $(CROSS)ld

GCCVERSION = `$(CROSS)gcc -dumpversion`

OBJS = start.o main.o

TARGET = interrupts.bin

%.bin: %.elf
	$(CROSS)objcopy -O binary $< $@

%.o: %.c
	$(CC) -c -nostdlib -c $<

.S.o:
	        $(CC) -o $@ -c $<

all: install

install: $(TARGET)
	cp $(TARGET) /var/lib/tftpboot/bitcoin.bin

DUMP = arm-linux-gnu-objdump -d

dump:       interrupts.elf
	$(DUMP) interrupts.elf >interrupts.dump

clean:
	rm -rf *.bin *.elf *.o *.dump

obj:
	$(CROSS)objdump -h main.o

version:
	$(CC) --version

LDFLAGS = -nostdlib -z noexecstack --no-warn-rwx-segments

interrupts.elf: $(OBJS)
	$(LD) -o $@ $(LDFLAGS) $(OBJS) -T basic.lds $(LIBS)

# THE END
