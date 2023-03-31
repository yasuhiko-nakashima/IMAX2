
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# C2C_MASTER_TOP, C2C_SLAVE_TOP, HEARTBEAT, RESET_CTRL, emax6

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvu440-flga2892-2-e
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set CLK_150M [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 CLK_150M ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {150000000} \
   ] $CLK_150M
  set CLK_78M [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 CLK_78M ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {78125000} \
   ] $CLK_78M
  set GT_DIFF_REFCLK0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 GT_DIFF_REFCLK0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $GT_DIFF_REFCLK0
  set GT_DIFF_REFCLK1 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 GT_DIFF_REFCLK1 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $GT_DIFF_REFCLK1
  set GT_SERIAL_RX0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_RX_rtl:1.0 GT_SERIAL_RX0 ]
  set GT_SERIAL_RX1 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_RX_rtl:1.0 GT_SERIAL_RX1 ]
  set GT_SERIAL_TX0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_TX_rtl:1.0 GT_SERIAL_TX0 ]
  set GT_SERIAL_TX1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_TX_rtl:1.0 GT_SERIAL_TX1 ]

  # Create ports
  set EXT_RESET [ create_bd_port -dir I -type rst EXT_RESET ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $EXT_RESET
  set HEART_BEAT [ create_bd_port -dir O HEART_BEAT ]
  set LINK_UP0 [ create_bd_port -dir O LINK_UP0 ]
  set LINK_UP1 [ create_bd_port -dir O LINK_UP1 ]
  set MAIN_RESET_N [ create_bd_port -dir I MAIN_RESET_N ]

  # Create instance: C2C_MASTER_TOP_0, and set properties
  set block_name C2C_MASTER_TOP
  set block_cell_name C2C_MASTER_TOP_0
  if { [catch {set C2C_MASTER_TOP_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $C2C_MASTER_TOP_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: C2C_SLAVE_TOP_0, and set properties
  set block_name C2C_SLAVE_TOP
  set block_cell_name C2C_SLAVE_TOP_0
  if { [catch {set C2C_SLAVE_TOP_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $C2C_SLAVE_TOP_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: HEARTBEAT_0, and set properties
  set block_name HEARTBEAT
  set block_cell_name HEARTBEAT_0
  if { [catch {set HEARTBEAT_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $HEARTBEAT_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: RESET_CTRL_0, and set properties
  set block_name RESET_CTRL
  set block_cell_name RESET_CTRL_0
  if { [catch {set RESET_CTRL_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $RESET_CTRL_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: aurora_64b66b_0, and set properties
  set aurora_64b66b_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_64b66b:11.2 aurora_64b66b_0 ]
  set_property -dict [ list \
   CONFIG.CHANNEL_ENABLE {X0Y0 X0Y1 X0Y2 X0Y3 X0Y4 X0Y5 X0Y6 X0Y7} \
   CONFIG.C_AURORA_LANES {8} \
   CONFIG.C_GT_LOC_5 {5} \
   CONFIG.C_GT_LOC_6 {6} \
   CONFIG.C_GT_LOC_7 {7} \
   CONFIG.C_GT_LOC_8 {8} \
   CONFIG.C_LINE_RATE {5} \
   CONFIG.C_USE_BYTESWAP {true} \
   CONFIG.C_active_transceiverquads {2} \
   CONFIG.SupportLevel {1} \
   CONFIG.drp_mode {Disabled} \
 ] $aurora_64b66b_0

  # Create instance: aurora_64b66b_1, and set properties
  set aurora_64b66b_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_64b66b:11.2 aurora_64b66b_1 ]
  set_property -dict [ list \
   CONFIG.CHANNEL_ENABLE {X0Y0 X0Y1 X0Y2 X0Y3 X0Y4 X0Y5 X0Y6 X0Y7} \
   CONFIG.C_AURORA_LANES {8} \
   CONFIG.C_GT_LOC_5 {5} \
   CONFIG.C_GT_LOC_6 {6} \
   CONFIG.C_GT_LOC_7 {7} \
   CONFIG.C_GT_LOC_8 {8} \
   CONFIG.C_LINE_RATE {5} \
   CONFIG.C_USE_BYTESWAP {true} \
   CONFIG.C_active_transceiverquads {2} \
   CONFIG.SupportLevel {1} \
   CONFIG.drp_mode {Disabled} \
 ] $aurora_64b66b_1

  # Create instance: clk_150m_buff, and set properties
  set clk_150m_buff [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 clk_150m_buff ]

  # Create instance: clk_78m_buff, and set properties
  set clk_78m_buff [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 clk_78m_buff ]

  # Create instance: emax6_0, and set properties
  set block_name emax6
  set block_cell_name emax6_0
  if { [catch {set emax6_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $emax6_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: system_ila_0, and set properties
  set system_ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 system_ila_0 ]
  set_property -dict [ list \
   CONFIG.C_BRAM_CNT {106} \
   CONFIG.C_DATA_DEPTH {8192} \
   CONFIG.C_MON_TYPE {MIX} \
   CONFIG.C_NUM_MONITOR_SLOTS {2} \
   CONFIG.C_NUM_OF_PROBES {57} \
   CONFIG.C_PROBE0_TYPE {0} \
   CONFIG.C_PROBE10_TYPE {0} \
   CONFIG.C_PROBE11_TYPE {0} \
   CONFIG.C_PROBE12_TYPE {0} \
   CONFIG.C_PROBE13_TYPE {0} \
   CONFIG.C_PROBE14_TYPE {0} \
   CONFIG.C_PROBE15_TYPE {0} \
   CONFIG.C_PROBE16_TYPE {0} \
   CONFIG.C_PROBE17_TYPE {0} \
   CONFIG.C_PROBE18_TYPE {0} \
   CONFIG.C_PROBE19_TYPE {0} \
   CONFIG.C_PROBE1_TYPE {0} \
   CONFIG.C_PROBE20_TYPE {0} \
   CONFIG.C_PROBE21_TYPE {0} \
   CONFIG.C_PROBE22_TYPE {0} \
   CONFIG.C_PROBE23_TYPE {0} \
   CONFIG.C_PROBE24_TYPE {0} \
   CONFIG.C_PROBE25_TYPE {0} \
   CONFIG.C_PROBE26_TYPE {0} \
   CONFIG.C_PROBE27_TYPE {0} \
   CONFIG.C_PROBE28_TYPE {0} \
   CONFIG.C_PROBE29_TYPE {0} \
   CONFIG.C_PROBE2_TYPE {0} \
   CONFIG.C_PROBE30_TYPE {0} \
   CONFIG.C_PROBE31_TYPE {0} \
   CONFIG.C_PROBE32_TYPE {0} \
   CONFIG.C_PROBE33_TYPE {0} \
   CONFIG.C_PROBE34_TYPE {0} \
   CONFIG.C_PROBE35_TYPE {0} \
   CONFIG.C_PROBE36_TYPE {0} \
   CONFIG.C_PROBE37_TYPE {0} \
   CONFIG.C_PROBE38_TYPE {0} \
   CONFIG.C_PROBE39_TYPE {0} \
   CONFIG.C_PROBE3_TYPE {0} \
   CONFIG.C_PROBE40_TYPE {0} \
   CONFIG.C_PROBE41_TYPE {0} \
   CONFIG.C_PROBE42_TYPE {0} \
   CONFIG.C_PROBE43_TYPE {0} \
   CONFIG.C_PROBE44_TYPE {0} \
   CONFIG.C_PROBE45_TYPE {0} \
   CONFIG.C_PROBE46_TYPE {0} \
   CONFIG.C_PROBE47_TYPE {0} \
   CONFIG.C_PROBE48_TYPE {0} \
   CONFIG.C_PROBE49_TYPE {0} \
   CONFIG.C_PROBE4_TYPE {0} \
   CONFIG.C_PROBE50_TYPE {0} \
   CONFIG.C_PROBE51_TYPE {0} \
   CONFIG.C_PROBE52_TYPE {0} \
   CONFIG.C_PROBE53_TYPE {0} \
   CONFIG.C_PROBE54_TYPE {0} \
   CONFIG.C_PROBE55_TYPE {0} \
   CONFIG.C_PROBE56_TYPE {0} \
   CONFIG.C_PROBE5_TYPE {0} \
   CONFIG.C_PROBE6_TYPE {0} \
   CONFIG.C_PROBE7_TYPE {0} \
   CONFIG.C_PROBE8_TYPE {0} \
   CONFIG.C_PROBE9_TYPE {0} \
   CONFIG.C_SLOT_0_APC_EN {0} \
   CONFIG.C_SLOT_0_AXI_AR_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_AR_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_AW_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_AW_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_B_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_B_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_R_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_R_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_W_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_W_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_INTF_TYPE {xilinx.com:interface:aximm_rtl:1.0} \
   CONFIG.C_SLOT_1_APC_EN {0} \
   CONFIG.C_SLOT_1_AXI_AR_SEL_DATA {1} \
   CONFIG.C_SLOT_1_AXI_AR_SEL_TRIG {1} \
   CONFIG.C_SLOT_1_AXI_AW_SEL_DATA {1} \
   CONFIG.C_SLOT_1_AXI_AW_SEL_TRIG {1} \
   CONFIG.C_SLOT_1_AXI_B_SEL_DATA {1} \
   CONFIG.C_SLOT_1_AXI_B_SEL_TRIG {1} \
   CONFIG.C_SLOT_1_AXI_R_SEL_DATA {1} \
   CONFIG.C_SLOT_1_AXI_R_SEL_TRIG {1} \
   CONFIG.C_SLOT_1_AXI_W_SEL_DATA {1} \
   CONFIG.C_SLOT_1_AXI_W_SEL_TRIG {1} \
   CONFIG.C_SLOT_1_INTF_TYPE {xilinx.com:interface:aximm_rtl:1.0} \
 ] $system_ila_0

  # Create instance: util_ds_buf_0, and set properties
  set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_0 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {BUFG} \
 ] $util_ds_buf_0

  # Create instance: util_ds_buf_1, and set properties
  set util_ds_buf_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_1 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {BUFG} \
 ] $util_ds_buf_1

  # Create instance: util_ds_buf_2, and set properties
  set util_ds_buf_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_2 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {BUFG} \
 ] $util_ds_buf_2

  # Create instance: util_ds_buf_3, and set properties
  set util_ds_buf_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_3 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {BUFG} \
 ] $util_ds_buf_3

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net C2C_MASTER_TOP_0_M_AXI [get_bd_intf_pins C2C_MASTER_TOP_0/M_AXI] [get_bd_intf_pins emax6_0/axi_s]
connect_bd_intf_net -intf_net [get_bd_intf_nets C2C_MASTER_TOP_0_M_AXI] [get_bd_intf_pins C2C_MASTER_TOP_0/M_AXI] [get_bd_intf_pins system_ila_0/SLOT_1_AXI]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_intf_nets C2C_MASTER_TOP_0_M_AXI]
  connect_bd_intf_net -intf_net C2C_MASTER_TOP_0_TX [get_bd_intf_pins C2C_MASTER_TOP_0/TX] [get_bd_intf_pins aurora_64b66b_1/USER_DATA_S_AXIS_TX]
  connect_bd_intf_net -intf_net C2C_SLAVE_TOP_0_TX [get_bd_intf_pins C2C_SLAVE_TOP_0/TX] [get_bd_intf_pins aurora_64b66b_0/USER_DATA_S_AXIS_TX]
  connect_bd_intf_net -intf_net CLK_150M_1 [get_bd_intf_ports CLK_150M] [get_bd_intf_pins clk_150m_buff/CLK_IN_D]
  connect_bd_intf_net -intf_net CLK_78M_1 [get_bd_intf_ports CLK_78M] [get_bd_intf_pins clk_78m_buff/CLK_IN_D]
  connect_bd_intf_net -intf_net GT_DIFF_REFCLK0_1 [get_bd_intf_ports GT_DIFF_REFCLK0] [get_bd_intf_pins aurora_64b66b_1/GT_DIFF_REFCLK1]
  connect_bd_intf_net -intf_net GT_DIFF_REFCLK1_1 [get_bd_intf_ports GT_DIFF_REFCLK1] [get_bd_intf_pins aurora_64b66b_0/GT_DIFF_REFCLK1]
  connect_bd_intf_net -intf_net GT_SERIAL_RX0_1 [get_bd_intf_ports GT_SERIAL_RX0] [get_bd_intf_pins aurora_64b66b_1/GT_SERIAL_RX]
  connect_bd_intf_net -intf_net GT_SERIAL_RX1_1 [get_bd_intf_ports GT_SERIAL_RX1] [get_bd_intf_pins aurora_64b66b_0/GT_SERIAL_RX]
  connect_bd_intf_net -intf_net aurora_64b66b_0_GT_SERIAL_TX [get_bd_intf_ports GT_SERIAL_TX1] [get_bd_intf_pins aurora_64b66b_0/GT_SERIAL_TX]
  connect_bd_intf_net -intf_net aurora_64b66b_0_USER_DATA_M_AXIS_RX [get_bd_intf_pins C2C_SLAVE_TOP_0/RX] [get_bd_intf_pins aurora_64b66b_0/USER_DATA_M_AXIS_RX]
  connect_bd_intf_net -intf_net aurora_64b66b_1_GT_SERIAL_TX [get_bd_intf_ports GT_SERIAL_TX0] [get_bd_intf_pins aurora_64b66b_1/GT_SERIAL_TX]
  connect_bd_intf_net -intf_net aurora_64b66b_1_USER_DATA_M_AXIS_RX [get_bd_intf_pins C2C_MASTER_TOP_0/RX] [get_bd_intf_pins aurora_64b66b_1/USER_DATA_M_AXIS_RX]
  connect_bd_intf_net -intf_net emax6_0_axi_m [get_bd_intf_pins C2C_SLAVE_TOP_0/S_AXI] [get_bd_intf_pins emax6_0/axi_m]
connect_bd_intf_net -intf_net [get_bd_intf_nets emax6_0_axi_m] [get_bd_intf_pins C2C_SLAVE_TOP_0/S_AXI] [get_bd_intf_pins system_ila_0/SLOT_0_AXI]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_intf_nets emax6_0_axi_m]

  # Create port connections
  connect_bd_net -net C2C_MASTER_TOP_0_LINK_UP [get_bd_ports LINK_UP0] [get_bd_pins C2C_MASTER_TOP_0/LINK_UP]
  connect_bd_net -net C2C_MASTER_TOP_0_LOOPBACK [get_bd_pins C2C_MASTER_TOP_0/LOOPBACK] [get_bd_pins aurora_64b66b_1/loopback]
  connect_bd_net -net C2C_MASTER_TOP_0_POWER_DOWN [get_bd_pins C2C_MASTER_TOP_0/POWER_DOWN] [get_bd_pins aurora_64b66b_1/gt_rxcdrovrden_in] [get_bd_pins aurora_64b66b_1/power_down]
  connect_bd_net -net C2C_SLAVE_TOP_0_LINK_UP [get_bd_ports LINK_UP1] [get_bd_pins C2C_SLAVE_TOP_0/LINK_UP] [get_bd_pins emax6_0/next_linkup]
  connect_bd_net -net C2C_SLAVE_TOP_0_LOOPBACK [get_bd_pins C2C_SLAVE_TOP_0/LOOPBACK] [get_bd_pins aurora_64b66b_0/loopback]
  connect_bd_net -net C2C_SLAVE_TOP_0_POWER_DOWN [get_bd_pins C2C_SLAVE_TOP_0/POWER_DOWN] [get_bd_pins aurora_64b66b_0/gt_rxcdrovrden_in] [get_bd_pins aurora_64b66b_0/power_down]
  connect_bd_net -net EXT_RESET_1 [get_bd_ports EXT_RESET] [get_bd_pins RESET_CTRL_0/EXT_RESET]
  connect_bd_net -net HEARTBEAT_0_HEART_BEAT [get_bd_ports HEART_BEAT] [get_bd_pins HEARTBEAT_0/HEART_BEAT]
  connect_bd_net -net MAIN_RESET_N_1 [get_bd_ports MAIN_RESET_N] [get_bd_pins RESET_CTRL_0/MAIN_RESET_N]
  connect_bd_net -net RESET_CTRL_0_PERI_RESET_N [get_bd_pins C2C_MASTER_TOP_0/AURORA_RESET_N] [get_bd_pins C2C_MASTER_TOP_0/M_AXI_RESET_N] [get_bd_pins C2C_SLAVE_TOP_0/AURORA_RESET_N] [get_bd_pins C2C_SLAVE_TOP_0/S_AXI_RESET_N] [get_bd_pins HEARTBEAT_0/RESET_N] [get_bd_pins RESET_CTRL_0/PERI_RESET_N] [get_bd_pins emax6_0/ARESETN] [get_bd_pins system_ila_0/resetn]
  connect_bd_net -net RESET_CTRL_0_PERI_RESET_P [get_bd_pins RESET_CTRL_0/PERI_RESET_P] [get_bd_pins aurora_64b66b_0/reset_pb] [get_bd_pins aurora_64b66b_1/reset_pb]
  connect_bd_net -net RESET_CTRL_0_USER_RESET_P [get_bd_pins RESET_CTRL_0/USER_RESET_P] [get_bd_pins aurora_64b66b_0/pma_init] [get_bd_pins aurora_64b66b_1/pma_init]
  connect_bd_net -net addr_bot_o_2 [get_bd_pins emax6_0/addr_bot_o_2] [get_bd_pins system_ila_0/probe35]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets addr_bot_o_2]
  connect_bd_net -net addr_bot_o_3 [get_bd_pins emax6_0/addr_bot_o_3] [get_bd_pins system_ila_0/probe21]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets addr_bot_o_3]
  connect_bd_net -net addr_bot_o_4 [get_bd_pins emax6_0/addr_bot_o_4] [get_bd_pins system_ila_0/probe26]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets addr_bot_o_4]
  connect_bd_net -net addr_bot_o_5 [get_bd_pins emax6_0/addr_bot_o_5] [get_bd_pins system_ila_0/probe14]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets addr_bot_o_5]
  connect_bd_net -net addr_top_o_2 [get_bd_pins emax6_0/addr_top_o_2] [get_bd_pins system_ila_0/probe52]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets addr_top_o_2]
  connect_bd_net -net addr_top_o_3 [get_bd_pins emax6_0/addr_top_o_3] [get_bd_pins system_ila_0/probe31]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets addr_top_o_3]
  connect_bd_net -net addr_top_o_4 [get_bd_pins emax6_0/addr_top_o_4] [get_bd_pins system_ila_0/probe41]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets addr_top_o_4]
  connect_bd_net -net addr_top_o_5 [get_bd_pins emax6_0/addr_top_o_5] [get_bd_pins system_ila_0/probe24]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets addr_top_o_5]
  connect_bd_net -net aurora_64b66b_0_channel_up [get_bd_pins C2C_SLAVE_TOP_0/CH_UP] [get_bd_pins aurora_64b66b_0/channel_up]
  connect_bd_net -net aurora_64b66b_0_hard_err [get_bd_pins C2C_SLAVE_TOP_0/HARD_ERR] [get_bd_pins aurora_64b66b_0/hard_err]
  connect_bd_net -net aurora_64b66b_0_lane_up [get_bd_pins C2C_SLAVE_TOP_0/LANE_UP] [get_bd_pins aurora_64b66b_0/lane_up]
  connect_bd_net -net aurora_64b66b_0_soft_err [get_bd_pins C2C_SLAVE_TOP_0/SOFT_ERR] [get_bd_pins aurora_64b66b_0/soft_err]
  connect_bd_net -net aurora_64b66b_0_user_clk_out [get_bd_pins aurora_64b66b_0/user_clk_out] [get_bd_pins util_ds_buf_2/BUFG_I]
  connect_bd_net -net aurora_64b66b_1_channel_up [get_bd_pins C2C_MASTER_TOP_0/CH_UP] [get_bd_pins aurora_64b66b_1/channel_up]
  connect_bd_net -net aurora_64b66b_1_hard_err [get_bd_pins C2C_MASTER_TOP_0/HARD_ERR] [get_bd_pins aurora_64b66b_1/hard_err]
  connect_bd_net -net aurora_64b66b_1_lane_up [get_bd_pins C2C_MASTER_TOP_0/LANE_UP] [get_bd_pins aurora_64b66b_1/lane_up]
  connect_bd_net -net aurora_64b66b_1_soft_err [get_bd_pins C2C_MASTER_TOP_0/SOFT_ERR] [get_bd_pins aurora_64b66b_1/soft_err]
  connect_bd_net -net aurora_64b66b_1_user_clk_out [get_bd_pins aurora_64b66b_1/user_clk_out] [get_bd_pins util_ds_buf_3/BUFG_I]
  connect_bd_net -net axiif_addr [get_bd_pins emax6_0/axiif_addr] [get_bd_pins system_ila_0/probe1]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_addr]
  connect_bd_net -net axiif_addr_d [get_bd_pins emax6_0/axiif_addr_d] [get_bd_pins system_ila_0/probe8]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_addr_d]
  connect_bd_net -net axiif_alen [get_bd_pins emax6_0/axiif_alen] [get_bd_pins system_ila_0/probe0]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_alen]
  connect_bd_net -net axiif_arsize [get_bd_pins emax6_0/axiif_arsize] [get_bd_pins system_ila_0/probe16]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_arsize]
  connect_bd_net -net axiif_awsize [get_bd_pins emax6_0/axiif_awsize] [get_bd_pins system_ila_0/probe22]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_awsize]
  connect_bd_net -net axiif_blen [get_bd_pins emax6_0/axiif_blen] [get_bd_pins system_ila_0/probe44]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_blen]
  connect_bd_net -net axiif_bufq [get_bd_pins emax6_0/axiif_bufq] [get_bd_pins system_ila_0/probe15]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_bufq]
  connect_bd_net -net axiif_dmrb_en1_d [get_bd_pins emax6_0/axiif_dmrb_en1_d] [get_bd_pins system_ila_0/probe4]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_dmrb_en1_d]
  connect_bd_net -net axiif_dmrp_len [get_bd_pins emax6_0/axiif_dmrp_len] [get_bd_pins system_ila_0/probe29]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_dmrp_len]
  connect_bd_net -net axiif_dmrp_stat [get_bd_pins emax6_0/axiif_dmrp_stat] [get_bd_pins system_ila_0/probe38]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_dmrp_stat]
  connect_bd_net -net axiif_dmrp_top [get_bd_pins emax6_0/axiif_dmrp_top] [get_bd_pins system_ila_0/probe48]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_dmrp_top]
  connect_bd_net -net axiif_id [get_bd_pins emax6_0/axiif_id] [get_bd_pins system_ila_0/probe11]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_id]
  connect_bd_net -net axiif_ilen [get_bd_pins emax6_0/axiif_ilen] [get_bd_pins system_ila_0/probe9]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_ilen]
  connect_bd_net -net axiif_keep_addr [get_bd_pins emax6_0/axiif_keep_addr] [get_bd_pins system_ila_0/probe13]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_keep_addr]
  connect_bd_net -net axiif_keep_busy [get_bd_pins emax6_0/axiif_keep_busy] [get_bd_pins system_ila_0/probe55]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_keep_busy]
  connect_bd_net -net axiif_keep_id [get_bd_pins emax6_0/axiif_keep_id] [get_bd_pins system_ila_0/probe25]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_keep_id]
  connect_bd_net -net axiif_keep_len [get_bd_pins emax6_0/axiif_keep_len] [get_bd_pins system_ila_0/probe5]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_keep_len]
  connect_bd_net -net axiif_keep_size [get_bd_pins emax6_0/axiif_keep_size] [get_bd_pins system_ila_0/probe19]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_keep_size]
  connect_bd_net -net axiif_keep_skp [get_bd_pins emax6_0/axiif_keep_skp] [get_bd_pins system_ila_0/probe18]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_keep_skp]
  connect_bd_net -net axiif_mbusy [get_bd_pins emax6_0/axiif_mbusy] [get_bd_pins system_ila_0/probe49]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_mbusy]
  connect_bd_net -net axiif_mlen [get_bd_pins emax6_0/axiif_mlen] [get_bd_pins system_ila_0/probe33]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_mlen]
  connect_bd_net -net axiif_olen [get_bd_pins emax6_0/axiif_olen] [get_bd_pins system_ila_0/probe42]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_olen]
  connect_bd_net -net axiif_plen [get_bd_pins emax6_0/axiif_plen] [get_bd_pins system_ila_0/probe54]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_plen]
  connect_bd_net -net axiif_sbusy [get_bd_pins emax6_0/axiif_sbusy] [get_bd_pins system_ila_0/probe37]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_sbusy]
  connect_bd_net -net axiif_skp [get_bd_pins emax6_0/axiif_skp] [get_bd_pins system_ila_0/probe45]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_skp]
  connect_bd_net -net axiif_srw [get_bd_pins emax6_0/axiif_srw] [get_bd_pins system_ila_0/probe28]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_srw]
  connect_bd_net -net axiif_wdata [get_bd_pins emax6_0/axiif_wdata] [get_bd_pins system_ila_0/probe53]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_wdata]
  connect_bd_net -net axiif_wstrb [get_bd_pins emax6_0/axiif_wstrb] [get_bd_pins system_ila_0/probe10]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_wstrb]
  connect_bd_net -net axiif_wterm [get_bd_pins emax6_0/axiif_wterm] [get_bd_pins system_ila_0/probe43]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets axiif_wterm]
  connect_bd_net -net clk_150m_buff_IBUF_OUT [get_bd_pins clk_150m_buff/IBUF_OUT] [get_bd_pins util_ds_buf_1/BUFG_I]
  connect_bd_net -net clk_78m_buff_IBUF_OUT [get_bd_pins clk_78m_buff/IBUF_OUT] [get_bd_pins util_ds_buf_0/BUFG_I]
  connect_bd_net -net lmranger_ok_2 [get_bd_pins emax6_0/lmranger_ok_2] [get_bd_pins system_ila_0/probe46]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets lmranger_ok_2]
  connect_bd_net -net lmranger_ok_3 [get_bd_pins emax6_0/lmranger_ok_3] [get_bd_pins system_ila_0/probe27]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets lmranger_ok_3]
  connect_bd_net -net lmranger_ok_4 [get_bd_pins emax6_0/lmranger_ok_4] [get_bd_pins system_ila_0/probe34]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets lmranger_ok_4]
  connect_bd_net -net lmranger_ok_5 [get_bd_pins emax6_0/lmranger_ok_5] [get_bd_pins system_ila_0/probe20]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets lmranger_ok_5]
  connect_bd_net -net lmrangew_ok_2 [get_bd_pins emax6_0/lmrangew_ok_2] [get_bd_pins system_ila_0/probe7]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets lmrangew_ok_2]
  connect_bd_net -net lmrangew_ok_3 [get_bd_pins emax6_0/lmrangew_ok_3] [get_bd_pins system_ila_0/probe40]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets lmrangew_ok_3]
  connect_bd_net -net lmrangew_ok_4 [get_bd_pins emax6_0/lmrangew_ok_4] [get_bd_pins system_ila_0/probe23]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets lmrangew_ok_4]
  connect_bd_net -net lmrangew_ok_5 [get_bd_pins emax6_0/lmrangew_ok_5] [get_bd_pins system_ila_0/probe32]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets lmrangew_ok_5]
  connect_bd_net -net lmring_b_2 [get_bd_pins emax6_0/lmring_b_2] [get_bd_pins system_ila_0/probe17]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets lmring_b_2]
  connect_bd_net -net lmring_b_3 [get_bd_pins emax6_0/lmring_b_3] [get_bd_pins system_ila_0/probe6]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets lmring_b_3]
  connect_bd_net -net lmring_b_4 [get_bd_pins emax6_0/lmring_b_4] [get_bd_pins system_ila_0/probe12]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets lmring_b_4]
  connect_bd_net -net lmring_b_5 [get_bd_pins emax6_0/lmring_b_5] [get_bd_pins system_ila_0/probe51]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets lmring_b_5]
  connect_bd_net -net next_linkup_r [get_bd_pins emax6_0/next_linkup_r] [get_bd_pins system_ila_0/probe56]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets next_linkup_r]
  connect_bd_net -net unit1_exec_o [get_bd_pins emax6_0/unit1_exec_o] [get_bd_pins system_ila_0/probe2]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets unit1_exec_o]
  connect_bd_net -net unit1_fold_o [get_bd_pins emax6_0/unit1_fold_o] [get_bd_pins system_ila_0/probe39]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets unit1_fold_o]
  connect_bd_net -net unit1_stop_o [get_bd_pins emax6_0/unit1_stop_o] [get_bd_pins system_ila_0/probe47]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets unit1_stop_o]
  connect_bd_net -net unit2_exec_o [get_bd_pins emax6_0/unit2_exec_o] [get_bd_pins system_ila_0/probe30]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets unit2_exec_o]
  connect_bd_net -net unit2_fold_o [get_bd_pins emax6_0/unit2_fold_o] [get_bd_pins system_ila_0/probe36]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets unit2_fold_o]
  connect_bd_net -net unit2_forstat_o [get_bd_pins emax6_0/unit2_forstat_o] [get_bd_pins system_ila_0/probe50]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets unit2_forstat_o]
  connect_bd_net -net unit2_stop_o [get_bd_pins emax6_0/unit2_stop_o] [get_bd_pins system_ila_0/probe3]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets unit2_stop_o]
  connect_bd_net -net util_ds_buf_0_BUFG_O [get_bd_pins HEARTBEAT_0/CLK] [get_bd_pins aurora_64b66b_0/init_clk] [get_bd_pins aurora_64b66b_1/init_clk] [get_bd_pins util_ds_buf_0/BUFG_O]
  connect_bd_net -net util_ds_buf_1_BUFG_O [get_bd_pins C2C_MASTER_TOP_0/M_AXI_CLK] [get_bd_pins C2C_SLAVE_TOP_0/S_AXI_CLK] [get_bd_pins RESET_CTRL_0/MAIN_CLK] [get_bd_pins emax6_0/ACLK] [get_bd_pins system_ila_0/clk] [get_bd_pins util_ds_buf_1/BUFG_O]
  connect_bd_net -net util_ds_buf_2_BUFG_O [get_bd_pins C2C_SLAVE_TOP_0/AURORA_CLK] [get_bd_pins util_ds_buf_2/BUFG_O]
  connect_bd_net -net util_ds_buf_3_BUFG_O [get_bd_pins C2C_MASTER_TOP_0/AURORA_CLK] [get_bd_pins util_ds_buf_3/BUFG_O]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins RESET_CTRL_0/DCM_LOCKED] [get_bd_pins xlconstant_0/dout]

  # Create address segments
  create_bd_addr_seg -range 0x010000000000 -offset 0x00000000 [get_bd_addr_spaces C2C_MASTER_TOP_0/M_AXI] [get_bd_addr_segs emax6_0/axi_s/reg0] SEG_emax6_0_reg0
  create_bd_addr_seg -range 0x010000000000 -offset 0x00000000 [get_bd_addr_spaces emax6_0/axi_m] [get_bd_addr_segs C2C_SLAVE_TOP_0/S_AXI/reg0] SEG_C2C_SLAVE_TOP_0_reg0


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


