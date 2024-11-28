Antminer S9 -- board files for Vivado

If you want to use Vivado to develop for the FPGA in the Zynq, you will
need these.  I began with the board files for the EBAZ-4205 and trimmed
stuff that was specific to the EBAZ.

Note that there is a Makefile here.
I use it to install the board files by typing "make install", you will
want to check the Vivado path therein, as it almost certainly won't
match the install or version on your system.

I also include a constraint file here.
The usual thing with constraint files seems to be to have everything
possible in it, but commented out -- then you uncomment whatever is
needed for a specific project.

