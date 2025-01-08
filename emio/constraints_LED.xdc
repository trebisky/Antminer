# We don't use this in this project, but this would be
# the constraint file for the four on-board LEDs

set_property IOSTANDARD LVCMOS33 [get_ports {leds[*]}]
set_property SLEW SLOW [get_ports {leds[*]}]
set_property DRIVE 8 [get_ports {leds[*]}]

set_property PACKAGE_PIN F16 [get_ports {leds[0]}]
set_property PACKAGE_PIN L19 [get_ports {leds[1]}]
set_property PACKAGE_PIN M19 [get_ports {leds[2]}]
set_property PACKAGE_PIN M17 [get_ports {leds[3]}]

