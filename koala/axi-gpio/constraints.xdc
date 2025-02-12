set_property IOSTANDARD LVCMOS33 [get_ports {leds_tri_o[*]}]
set_property SLEW SLOW [get_ports {leds_tri_o[*]}]
set_property DRIVE 8 [get_ports {leds_tri_o[*]}]

set_property PACKAGE_PIN F16 [get_ports {leds_tri_o[0]}]
set_property PACKAGE_PIN L19 [get_ports {leds_tri_o[1]}]
set_property PACKAGE_PIN M19 [get_ports {leds_tri_o[2]}]
set_property PACKAGE_PIN M17 [get_ports {leds_tri_o[3]}]
