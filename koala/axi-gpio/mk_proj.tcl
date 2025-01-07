set projectname "axi-gpio"
set part xc7z010-1clg400
set outputdir "./$projectname"

# Create output directory and clear contents
file mkdir $outputdir
set files [glob -nocomplain "$outputdir/*"]
if {[llength $files] != 0} {
    puts "Deleting contents of $outputdir"
    file delete -force {*}[glob -directory $outputdir *]; # clear folder contents
} else {
    puts "$outputdir is empty"
}

# Create project
create_project -part $part $projectname $outputdir

#source ./../src/bd/axi_gpio.tcl
source axi_gpio.tcl

make_wrapper -files [get_files $bdpath/$bdname.bd] -top
add_files -norecurse $bdpath/hdl/${bdname}_wrapper.v

#read_xdc ../src/xdc/constraints.xdc
read_xdc constraints.xdc

