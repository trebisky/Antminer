set projectname "blink-led"
set part xc7z010-1clg400
set outputdir "./$projectname"

file mkdir $outputdir
set files [glob -nocomplain "$outputdir/*"]
if {[llength $files] != 0} {
    puts "Deleting contents of $outputdir"
    file delete -force {*}[glob -directory $outputdir *];
} else {
    puts "$outputdir is empty"
}

create_project -part $part $projectname $outputdir

#source ./../src/bd/blinky.tcl
source blinky.tcl

make_wrapper -files [get_files $bdpath/$bdname.bd] -top
add_files -norecurse $bdpath/hdl/${bdname}_wrapper.v

#read_xdc ../src/xdc/constraints.xdc
read_xdc constraints.xdc

# THE END
