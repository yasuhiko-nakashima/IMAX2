#! /bin/bash
bootgen -w -image $1.bif -arch zynqmp -process_bitstream bin
mv -f $1.bit.bin $1.bin
