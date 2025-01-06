# Makefile to install the Antminer S9 board files
# Tom Trebisky  11-28-2024
#  Happy Thanksgiving!
#
# Check and perhaps modify the path below, then
# just type "make" to install these board files


# path to Vivado board file collection
#/tools/Xilinx/Vivado/2022.2/data/boards/board_files/ebaz4205/1.0
#VPATH=/tools/Xilinx/Vivado/2022.2/data/boards/board_files
VPATH=/tools/Xilinx/Vivado/2024.2/data/boards/board_files

install:
		mkdir -p $(VPATH)/s9/1.0
		cp * $(VPATH)/s9/1.0
		rm $(VPATH)/s9/1.0/Makefile
		rm $(VPATH)/s9/1.0/README.md
		rm $(VPATH)/s9/1.0/S9_Master.xdc
		ls -l $(VPATH)/s9/1.0

# Do NOT repeat this or you overwrite the S9 files
##fetch:
##		#echo $(VPATH)
##		cp $(VPATH)/ebaz4205/1.0/* .

# This is a 1000 pixel square image
fetch_im:
		cp /u1/Camera/lightroom/2024/2024_misc/s9.jpg .

# This seemed useful once
ls-zed:
	ls -l $(VPATH)/zedboard/1.3

# THE END
