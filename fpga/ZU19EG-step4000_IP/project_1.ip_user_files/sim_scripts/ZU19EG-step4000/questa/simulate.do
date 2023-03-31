onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib fpga_bram64_opt

do {wave.do}

view wave
view structure
view signals

do {fpga_bram64.udo}

run -all

quit -force
