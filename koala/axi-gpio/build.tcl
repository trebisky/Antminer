set projectname "axi-gpio"
set outputdir "./$projectname"

open_project ./$outputdir/$projectname

reset_run synth_1

#launch synthesis
launch_runs synth_1
wait_on_run synth_1

launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
puts "Implementation done!"


