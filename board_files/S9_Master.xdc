## S9_Master_xdc
## This file is a general constraint file for the Antminer S9
## To use it in a project:
# - uncomment the lines corresponding to used pins
#
# Be sure the signal names match those you use in your
#  Vivado block diagram.
#
# Tom Trebisky  11-28-2024

# The style of this file is careful to use one line per pin.
# -- and just so you know, this is Tcl
# Another style point.  I try to keep all signal names entirely in lower case.

# And now a discussion of voltages on the PL pins that we access via
# the nine 18 pin connectors..
# The Zynq puts these into two banks (34 and 35) and each bank can be configured
# to use a different IO voltage.  It could be one of 1.8, 2.5, or 3.3.
# It is important to know which and to get it right.
# Looking at the S9 schematic and using the package pin diagram to sort out some
# things, I am convinced that all the pins marked "VCCO_#" get 3.3 volts
# (The schematic shows VCC_34 and VCC_35 and both are connected to 3.3 volts)

# Some of the starter boards have jumpers to set IO voltages, but not the S9

# I have been careful and used reasonable care, but there could be typos or
# mistakes in what follows.  Please let me know if any are found.
#  tom@mmto.org  Tom Trebisky

## There are four ridiculously bright green LED on the board
##  that can only be controlled via the FPGA
## In order (on the board, left to right) they are D7, D8, D5, D6 -- don't blame me.
# So uncomment either one of the following 4 mappings:

# These are the LED in the order you see them on the board (left to right)
# with the names as per the silkscreen and schematic
#set_property -dict { PACKAGE_PIN F16 IOSTANDARD LVCMOS33 } [get_ports { d7_led }];
#set_property -dict { PACKAGE_PIN L19 IOSTANDARD LVCMOS33 } [get_ports { d8_led }];
#set_property -dict { PACKAGE_PIN M19 IOSTANDARD LVCMOS33 } [get_ports { d5_led }];
#set_property -dict { PACKAGE_PIN M17 IOSTANDARD LVCMOS33 } [get_ports { d6_led }];

# Here I retain the order but give them names that I like
#set_property -dict { PACKAGE_PIN F16 IOSTANDARD LVCMOS33 } [get_ports { led_A }];
#set_property -dict { PACKAGE_PIN L19 IOSTANDARD LVCMOS33 } [get_ports { led_B }];
#set_property -dict { PACKAGE_PIN M19 IOSTANDARD LVCMOS33 } [get_ports { led_C }];
#set_property -dict { PACKAGE_PIN M17 IOSTANDARD LVCMOS33 } [get_ports { led_D }];

# Here are the names Vivado generates for EMIO
set_property -dict { PACKAGE_PIN F16 IOSTANDARD LVCMOS33 } [get_ports { GPIO_0_tri_io[0] }];
set_property -dict { PACKAGE_PIN L19 IOSTANDARD LVCMOS33 } [get_ports { GPIO_0_tri_io[1] }];
set_property -dict { PACKAGE_PIN M19 IOSTANDARD LVCMOS33 } [get_ports { GPIO_0_tri_io[2] }];
set_property -dict { PACKAGE_PIN M17 IOSTANDARD LVCMOS33 } [get_ports { GPIO_0_tri_io[3] }];

# THE END

