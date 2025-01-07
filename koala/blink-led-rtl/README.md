This is the third (and last) "tcl" vivado project

blink-led-tcl

It blinks all four onboard LED on the Antminer S9.
This is more or less the same as the first project, except:

1. It controls all four LED
2. It uses custom Verilog in an RTL block

To build the bitstream, do:

1.  make clean
1.  make project
1.  make build
