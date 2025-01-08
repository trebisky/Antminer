# Makefile for tcl vivado project
# 1-7-2025
# Tom Trebisky

PROJ=emio
BPATH=$(PROJ)/$(PROJ).runs/impl_1

all:
	@echo "Sorry, be more specific"

project:
	vivado -mode batch -source mk_proj.tcl

build:
	vivado -mode batch -source build.tcl
	cp $(BPATH)/*.bit .

bit:
	ls -l $(BPATH)/*.bit
	cp $(BPATH)/*.bit .

clean:
	rm -f *.jou
	rm -f *.log
	rm -rf $(PROJ)
