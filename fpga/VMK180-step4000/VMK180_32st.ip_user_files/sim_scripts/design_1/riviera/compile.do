vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/emb_mem_gen_v1_0_5
vlib riviera/xil_defaultlib
vlib riviera/smartconnect_v1_0
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_register_slice_v2_1_25
vlib riviera/axi_vip_v1_1_11
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/xlconstant_v1_1_7
vlib riviera/versal_cips_ps_vip_v1_0_3
vlib riviera/cpm4_v1_0_5
vlib riviera/cpm5_v1_0_5

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap emb_mem_gen_v1_0_5 riviera/emb_mem_gen_v1_0_5
vmap xil_defaultlib riviera/xil_defaultlib
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_25 riviera/axi_register_slice_v2_1_25
vmap axi_vip_v1_1_11 riviera/axi_vip_v1_1_11
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap xlconstant_v1_1_7 riviera/xlconstant_v1_1_7
vmap versal_cips_ps_vip_v1_0_3 riviera/versal_cips_ps_vip_v1_0_3
vmap cpm4_v1_0_5 riviera/cpm4_v1_0_5
vmap cpm5_v1_0_5 riviera/cpm5_v1_0_5

vlog -work xilinx_vip  -sv2k12 "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"/opt/xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/xilinx/Vivado/2021.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/xilinx/Vivado/2021.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/xilinx/Vivado/2021.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work emb_mem_gen_v1_0_5  -sv2k12 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ip/design_1_emax6_0_0/ipshared/f963/hdl/emb_mem_gen_v1_0_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_emax6_0_0/src/fpga_bram64/sim/fpga_bram64.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../bd/design_1/ipshared/9de5/src/bit24_booth_wallace.v" \
"../../../bd/design_1/ipshared/9de5/src/fsm.v" \
"../../../bd/design_1/ipshared/9de5/src/lmring.v" \
"../../../bd/design_1/ipshared/9de5/src/nbit_csa.v" \
"../../../bd/design_1/ipshared/9de5/src/nbit_ndepth_queue.v" \
"../../../bd/design_1/ipshared/9de5/src/nbit_register.v" \
"../../../bd/design_1/ipshared/9de5/src/stage1.v" \
"../../../bd/design_1/ipshared/9de5/src/stage2.v" \
"../../../bd/design_1/ipshared/9de5/src/stage3.v" \
"../../../bd/design_1/ipshared/9de5/src/stage4.v" \
"../../../bd/design_1/ipshared/9de5/src/stage5.v" \
"../../../bd/design_1/ipshared/9de5/src/unit.v" \
"../../../bd/design_1/ipshared/9de5/src/emax6.v" \
"../../../bd/design_1/ip/design_1_emax6_0_0/sim/design_1_emax6_0_0.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ea34/hdl/sc_mmu_v1_0_vl_rfs.sv" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/4fd2/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/8047/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/sc_node_v1_0_vl_rfs.sv" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/93a6/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_25  -v2k5 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/e1e6/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_11  -sv2k12 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/63b7/hdl/axi_vip_v1_1_vl_rfs.sv" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vlog -work xlconstant_v1_1_7  -v2k5 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work versal_cips_ps_vip_v1_0_3  -sv2k12 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl/versal_cips_ps_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_versal_cips_0_0/bd_0/ip/ip_0/ip_0/sim/versal_cips_ps_vip_0.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_versal_cips_0_0/bd_0/ip/ip_0/hdl/pspmc_v1_1_0_sim.v" \
"../../../bd/design_1/ip/design_1_versal_cips_0_0/bd_0/ip/ip_0/sim/bd_70da_pspmc_0_0.v" \
"../../../bd/design_1/ip/design_1_versal_cips_0_0/bd_0/sim/bd_70da.v" \

vlog -work cpm4_v1_0_5  -sv2k12 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/cpm4_v1_0_vl_rfs.sv" \

vlog -work cpm5_v1_0_5  -sv2k12 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/cpm5_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_versal_cips_0_0/sim/design_1_versal_cips_0_0.sv" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \
"../../../bd/design_1/ip/design_1_proc_sys_reset_1_0/sim/design_1_proc_sys_reset_1_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_clk_wizard_0_0/design_1_clk_wizard_0_0_clocking_structure.v" \
"../../../bd/design_1/ip/design_1_clk_wizard_0_0/design_1_clk_wizard_0_0_clocking_MBUFGCE_CE_DLY.v" \
"../../../bd/design_1/ip/design_1_clk_wizard_0_0/design_1_clk_wizard_0_0_clk_wiz_top.v" \
"../../../bd/design_1/ip/design_1_clk_wizard_0_0/sim/design_1_clk_wizard_0_0.v" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/sim/bd_48ac.v" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_48ac_one_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_48ac_psr0_0.vhd" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_48ac_psr_aclk_0.vhd" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_48ac_psr_aclk1_0.vhd" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_48ac_s00mmu_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_48ac_s00tr_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_48ac_s00sic_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_48ac_s00a2s_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_48ac_sarn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_48ac_srn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_48ac_sawn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_48ac_swn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_48ac_sbn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_48ac_m00s2a_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_48ac_m00e_0.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ipshared/9de5/src" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f9b8/ttcl" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/verilog" "+incdir+../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/9de5/src" "+incdir+/opt/xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/sim/design_1_smartconnect_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

