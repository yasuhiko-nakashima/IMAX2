onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+fpga_bram -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.fpga_bram xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {fpga_bram.udo}

run -all

endsim

quit -force
