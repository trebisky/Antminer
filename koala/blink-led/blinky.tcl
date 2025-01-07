set bdname "blinky"
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


set binary_counter [
    create_bd_cell -type ip -vlnv xilinx.com:ip:c_counter_binary:12.0 c_counter_binary
]

set slice_counter [
    create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_counter
]

set_property -dict [list CONFIG.Output_Width {27}] $binary_counter

set_property -dict [list \
    CONFIG.DIN_TO {26} \
    CONFIG.DIN_FROM {26} \
    CONFIG.DIN_WIDTH {27} \
    CONFIG.DOUT_WIDTH {1}
] $slice_counter

create_bd_port -dir O led

connect_bd_net [get_bd_pins processing_system7/FCLK_CLK0] [get_bd_pins c_counter_binary/CLK]
connect_bd_net [get_bd_pins c_counter_binary/Q] [get_bd_pins xlslice_counter/Din]
connect_bd_net [get_bd_ports led] [get_bd_pins xlslice_counter/Dout]

regenerate_bd_layout
save_bd_design

set bdpath [file dirname [get_files [get_property FILE_NAME [current_bd_design]]]]

