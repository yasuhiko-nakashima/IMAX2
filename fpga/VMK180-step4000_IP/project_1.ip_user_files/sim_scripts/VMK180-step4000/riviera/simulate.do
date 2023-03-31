onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+fpga_bram64 -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.fpga_bram64 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {fpga_bram64.udo}

run -all

endsim

quit -force
