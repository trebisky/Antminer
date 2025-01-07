set bdname "blinky_rtl"
create_bd_design $bdname

set processing_system [
    create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7
]

apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {
    make_external "FIXED_IO, DDR"
    Master "Disable"
    Slave "Disable"
} $processing_system

set_property -dict [list \
    CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {125} \
    CONFIG.PCW_USE_M_AXI_GP0 {0}
] $processing_system


set module_blink [
    create_bd_cell -type module -reference blink blink_0
]

set reset_system [
    create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset
]

create_bd_port -dir O leds

connect_bd_net [get_bd_pins proc_sys_reset/slowest_sync_clk] [get_bd_pins processing_system7/FCLK_CLK0]
connect_bd_net [get_bd_pins proc_sys_reset/ext_reset_in] [get_bd_pins processing_system7/FCLK_RESET0_N]

connect_bd_net [get_bd_pins processing_system7/FCLK_CLK0] [get_bd_pins blink_0/clk]
connect_bd_net [get_bd_pins proc_sys_reset/peripheral_aresetn] [get_bd_pins blink_0/rstn]
connect_bd_net [get_bd_ports leds] [get_bd_pins blink_0/leds]

regenerate_bd_layout
save_bd_design

set bdpath [file dirname [get_files [get_property FILE_NAME [current_bd_design]]]]

