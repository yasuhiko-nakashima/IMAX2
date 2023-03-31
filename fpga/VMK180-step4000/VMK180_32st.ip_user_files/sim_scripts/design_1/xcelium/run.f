-makelib xcelium_lib/xilinx_vip -sv \
  "/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/opt/xilinx/Vivado/2021.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "/opt/xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/opt/xilinx/Vivado/2021.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/opt/xilinx/Vivado/2021.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/opt/xilinx/Vivado/2021.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/emb_mem_gen_v1_0_5 -sv \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ip/design_1_emax6_0_0/ipshared/f963/hdl/emb_mem_gen_v1_0_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_1/ip/design_1_emax6_0_0/src/fpga_bram64/sim/fpga_bram64.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
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
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ea34/hdl/sc_mmu_v1_0_vl_rfs.sv" \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/4fd2/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/8047/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/66be/hdl/sc_node_v1_0_vl_rfs.sv" \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/93a6/hdl/sc_exit_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_25 \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/e1e6/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_11 -sv \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/63b7/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xlconstant_v1_1_7 \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/versal_cips_ps_vip_v1_0_3 -sv \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/2b35/hdl/versal_cips_ps_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_1/ip/design_1_versal_cips_0_0/bd_0/ip/ip_0/ip_0/sim/versal_cips_ps_vip_0.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_versal_cips_0_0/bd_0/ip/ip_0/hdl/pspmc_v1_1_0_sim.v" \
  "../../../bd/design_1/ip/design_1_versal_cips_0_0/bd_0/ip/ip_0/sim/bd_70da_pspmc_0_0.v" \
  "../../../bd/design_1/ip/design_1_versal_cips_0_0/bd_0/sim/bd_70da.v" \
-endlib
-makelib xcelium_lib/cpm4_v1_0_5 -sv \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/3cf9/hdl/cpm4_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/cpm5_v1_0_5 -sv \
  "../../../../VMK180_32st.gen/sources_1/bd/design_1/ipshared/90ec/hdl/cpm5_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_1/ip/design_1_versal_cips_0_0/sim/design_1_versal_cips_0_0.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \
  "../../../bd/design_1/ip/design_1_proc_sys_reset_1_0/sim/design_1_proc_sys_reset_1_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_clk_wizard_0_0/design_1_clk_wizard_0_0_clocking_structure.v" \
  "../../../bd/design_1/ip/design_1_clk_wizard_0_0/design_1_clk_wizard_0_0_clocking_MBUFGCE_CE_DLY.v" \
  "../../../bd/design_1/ip/design_1_clk_wizard_0_0/design_1_clk_wizard_0_0_clk_wiz_top.v" \
  "../../../bd/design_1/ip/design_1_clk_wizard_0_0/sim/design_1_clk_wizard_0_0.v" \
  "../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/sim/bd_48ac.v" \
  "../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_48ac_one_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_48ac_psr0_0.vhd" \
  "../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_48ac_psr_aclk_0.vhd" \
  "../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_48ac_psr_aclk1_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
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
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_smartconnect_0_0/sim/design_1_smartconnect_0_0.v" \
  "../../../bd/design_1/sim/design_1.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

