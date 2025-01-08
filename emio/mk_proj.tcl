set projectname "emio"
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

#add_files -norecurse blink.v

source emio.tcl

make_wrapper -files [get_files $bdpath/$bdname.bd] -top
add_files -norecurse $bdpath/hdl/${bdname}_wrapper.v

read_xdc constraints.xdc
