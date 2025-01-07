This is the third (and last) "tcl" vivado project

blink-led-tcl

It blinks all four onboard LED on the Antminer S9.
This is more or less the same as the first project, except:

1. It controls all four LED
2. It uses custom Verilog in an RTL block
3. There is a bug in my Verilog

I never did sort out the bug -- that main point for me was to learn how
to do this using Tcl, not working on my Verilog skills.

To build the bitstream, do:

1.  make clean
1.  make project
1.  make build
