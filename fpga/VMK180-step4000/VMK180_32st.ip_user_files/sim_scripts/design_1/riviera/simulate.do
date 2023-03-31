onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+design_1 -L xilinx_vip -L xpm -L emb_mem_gen_v1_0_5 -L xil_defaultlib -L smartconnect_v1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_25 -L axi_vip_v1_1_11 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L xlconstant_v1_1_7 -L versal_cips_ps_vip_v1_0_3 -L cpm4_v1_0_5 -L cpm5_v1_0_5 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.design_1 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {design_1.udo}

run -all

endsim

quit -force
