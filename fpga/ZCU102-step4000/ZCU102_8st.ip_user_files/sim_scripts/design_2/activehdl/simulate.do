onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+design_2 -L xilinx_vip -L xil_defaultlib -L xpm -L xlconstant_v1_1_5 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L smartconnect_v1_0 -L blk_mem_gen_v8_4_2 -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_4 -L zynq_ultra_ps_e_vip_v1_0_4 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.design_2 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {design_2.udo}

run -all

endsim

quit -force
