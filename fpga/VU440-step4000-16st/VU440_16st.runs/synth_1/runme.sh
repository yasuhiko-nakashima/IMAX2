#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/opt/xilinx/SDK/2018.3/bin:/opt/xilinx/Vivado/2018.3/ids_lite/ISE/bin/lin64:/opt/xilinx/Vivado/2018.3/bin
else
  PATH=/opt/xilinx/SDK/2018.3/bin:/opt/xilinx/Vivado/2018.3/ids_lite/ISE/bin/lin64:/opt/xilinx/Vivado/2018.3/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/opt/xilinx/Vivado/2018.3/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/opt/xilinx/Vivado/2018.3/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/nakashim/proj-arm64/fpga/VU440-step4000-16st/VU440_16st.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log VU440_TOP.vds -m64 -stack 10000  -product Vivado -mode batch -messageDb vivado.pb -notrace -source VU440_TOP.tcl
