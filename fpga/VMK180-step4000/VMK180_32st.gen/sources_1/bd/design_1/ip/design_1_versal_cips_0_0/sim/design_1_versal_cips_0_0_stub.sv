// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


//------------------------------------------------------------------------------------
// Filename:    design_1_versal_cips_0_0_stub.sv
// Description: This HDL file is intended to be used with following simulators only:
//
//   Vivado Simulator (XSim)
//   Cadence Xcelium Simulator
//   Aldec Riviera-PRO Simulator
//
//------------------------------------------------------------------------------------
`timescale 1ps/1ps

`ifdef XILINX_SIMULATOR

`ifndef XILINX_SIMULATOR_BITASBOOL
`define XILINX_SIMULATOR_BITASBOOL
typedef bit bit_as_bool;
`endif

(* SC_MODULE_EXPORT *)
module design_1_versal_cips_0_0 (
  output bit_as_bool pl0_ref_clk,
  output bit_as_bool pmc_iro_clk,
  output bit_as_bool pl0_resetn,
  input bit_as_bool m_axi_fpd_aclk,
  output bit [15 : 0] M_AXI_FPD_awid,
  output bit [43 : 0] M_AXI_FPD_awaddr,
  output bit [7 : 0] M_AXI_FPD_awlen,
  output bit [2 : 0] M_AXI_FPD_awsize,
  output bit [1 : 0] M_AXI_FPD_awburst,
  output bit_as_bool M_AXI_FPD_awlock,
  output bit [3 : 0] M_AXI_FPD_awcache,
  output bit [2 : 0] M_AXI_FPD_awprot,
  output bit_as_bool M_AXI_FPD_awvalid,
  output bit [15 : 0] M_AXI_FPD_awuser,
  input bit_as_bool M_AXI_FPD_awready,
  output bit_as_bool M_AXI_FPD_wlast,
  output bit_as_bool M_AXI_FPD_wvalid,
  input bit_as_bool M_AXI_FPD_wready,
  input bit [15 : 0] M_AXI_FPD_bid,
  input bit [1 : 0] M_AXI_FPD_bresp,
  input bit_as_bool M_AXI_FPD_bvalid,
  output bit_as_bool M_AXI_FPD_bready,
  output bit [15 : 0] M_AXI_FPD_arid,
  output bit [43 : 0] M_AXI_FPD_araddr,
  output bit [7 : 0] M_AXI_FPD_arlen,
  output bit [2 : 0] M_AXI_FPD_arsize,
  output bit [1 : 0] M_AXI_FPD_arburst,
  output bit_as_bool M_AXI_FPD_arlock,
  output bit [3 : 0] M_AXI_FPD_arcache,
  output bit [2 : 0] M_AXI_FPD_arprot,
  output bit_as_bool M_AXI_FPD_arvalid,
  output bit [15 : 0] M_AXI_FPD_aruser,
  input bit_as_bool M_AXI_FPD_arready,
  input bit [15 : 0] M_AXI_FPD_rid,
  input bit [1 : 0] M_AXI_FPD_rresp,
  input bit_as_bool M_AXI_FPD_rlast,
  input bit_as_bool M_AXI_FPD_rvalid,
  output bit_as_bool M_AXI_FPD_rready,
  output bit [3 : 0] M_AXI_FPD_awqos,
  output bit [3 : 0] M_AXI_FPD_arqos,
  output bit [127 : 0] M_AXI_FPD_wdata,
  output bit [15 : 0] M_AXI_FPD_wstrb,
  input bit [127 : 0] M_AXI_FPD_rdata
);
endmodule
`endif

`ifdef XCELIUM
(* XMSC_MODULE_EXPORT *)
module design_1_versal_cips_0_0 (pl0_ref_clk,pmc_iro_clk,pl0_resetn,m_axi_fpd_aclk,M_AXI_FPD_awid,M_AXI_FPD_awaddr,M_AXI_FPD_awlen,M_AXI_FPD_awsize,M_AXI_FPD_awburst,M_AXI_FPD_awlock,M_AXI_FPD_awcache,M_AXI_FPD_awprot,M_AXI_FPD_awvalid,M_AXI_FPD_awuser,M_AXI_FPD_awready,M_AXI_FPD_wlast,M_AXI_FPD_wvalid,M_AXI_FPD_wready,M_AXI_FPD_bid,M_AXI_FPD_bresp,M_AXI_FPD_bvalid,M_AXI_FPD_bready,M_AXI_FPD_arid,M_AXI_FPD_araddr,M_AXI_FPD_arlen,M_AXI_FPD_arsize,M_AXI_FPD_arburst,M_AXI_FPD_arlock,M_AXI_FPD_arcache,M_AXI_FPD_arprot,M_AXI_FPD_arvalid,M_AXI_FPD_aruser,M_AXI_FPD_arready,M_AXI_FPD_rid,M_AXI_FPD_rresp,M_AXI_FPD_rlast,M_AXI_FPD_rvalid,M_AXI_FPD_rready,M_AXI_FPD_awqos,M_AXI_FPD_arqos,M_AXI_FPD_wdata,M_AXI_FPD_wstrb,M_AXI_FPD_rdata)
(* integer foreign = "SystemC";
*);
  output wire pl0_ref_clk;
  output wire pmc_iro_clk;
  output wire pl0_resetn;
  input bit m_axi_fpd_aclk;
  output wire [15 : 0] M_AXI_FPD_awid;
  output wire [43 : 0] M_AXI_FPD_awaddr;
  output wire [7 : 0] M_AXI_FPD_awlen;
  output wire [2 : 0] M_AXI_FPD_awsize;
  output wire [1 : 0] M_AXI_FPD_awburst;
  output wire M_AXI_FPD_awlock;
  output wire [3 : 0] M_AXI_FPD_awcache;
  output wire [2 : 0] M_AXI_FPD_awprot;
  output wire M_AXI_FPD_awvalid;
  output wire [15 : 0] M_AXI_FPD_awuser;
  input bit M_AXI_FPD_awready;
  output wire M_AXI_FPD_wlast;
  output wire M_AXI_FPD_wvalid;
  input bit M_AXI_FPD_wready;
  input bit [15 : 0] M_AXI_FPD_bid;
  input bit [1 : 0] M_AXI_FPD_bresp;
  input bit M_AXI_FPD_bvalid;
  output wire M_AXI_FPD_bready;
  output wire [15 : 0] M_AXI_FPD_arid;
  output wire [43 : 0] M_AXI_FPD_araddr;
  output wire [7 : 0] M_AXI_FPD_arlen;
  output wire [2 : 0] M_AXI_FPD_arsize;
  output wire [1 : 0] M_AXI_FPD_arburst;
  output wire M_AXI_FPD_arlock;
  output wire [3 : 0] M_AXI_FPD_arcache;
  output wire [2 : 0] M_AXI_FPD_arprot;
  output wire M_AXI_FPD_arvalid;
  output wire [15 : 0] M_AXI_FPD_aruser;
  input bit M_AXI_FPD_arready;
  input bit [15 : 0] M_AXI_FPD_rid;
  input bit [1 : 0] M_AXI_FPD_rresp;
  input bit M_AXI_FPD_rlast;
  input bit M_AXI_FPD_rvalid;
  output wire M_AXI_FPD_rready;
  output wire [3 : 0] M_AXI_FPD_awqos;
  output wire [3 : 0] M_AXI_FPD_arqos;
  output wire [127 : 0] M_AXI_FPD_wdata;
  output wire [15 : 0] M_AXI_FPD_wstrb;
  input bit [127 : 0] M_AXI_FPD_rdata;
endmodule
`endif

`ifdef RIVIERA
(* SC_MODULE_EXPORT *)
module design_1_versal_cips_0_0 (pl0_ref_clk,pmc_iro_clk,pl0_resetn,m_axi_fpd_aclk,M_AXI_FPD_awid,M_AXI_FPD_awaddr,M_AXI_FPD_awlen,M_AXI_FPD_awsize,M_AXI_FPD_awburst,M_AXI_FPD_awlock,M_AXI_FPD_awcache,M_AXI_FPD_awprot,M_AXI_FPD_awvalid,M_AXI_FPD_awuser,M_AXI_FPD_awready,M_AXI_FPD_wlast,M_AXI_FPD_wvalid,M_AXI_FPD_wready,M_AXI_FPD_bid,M_AXI_FPD_bresp,M_AXI_FPD_bvalid,M_AXI_FPD_bready,M_AXI_FPD_arid,M_AXI_FPD_araddr,M_AXI_FPD_arlen,M_AXI_FPD_arsize,M_AXI_FPD_arburst,M_AXI_FPD_arlock,M_AXI_FPD_arcache,M_AXI_FPD_arprot,M_AXI_FPD_arvalid,M_AXI_FPD_aruser,M_AXI_FPD_arready,M_AXI_FPD_rid,M_AXI_FPD_rresp,M_AXI_FPD_rlast,M_AXI_FPD_rvalid,M_AXI_FPD_rready,M_AXI_FPD_awqos,M_AXI_FPD_arqos,M_AXI_FPD_wdata,M_AXI_FPD_wstrb,M_AXI_FPD_rdata)
  output wire pl0_ref_clk;
  output wire pmc_iro_clk;
  output wire pl0_resetn;
  input bit m_axi_fpd_aclk;
  output wire [15 : 0] M_AXI_FPD_awid;
  output wire [43 : 0] M_AXI_FPD_awaddr;
  output wire [7 : 0] M_AXI_FPD_awlen;
  output wire [2 : 0] M_AXI_FPD_awsize;
  output wire [1 : 0] M_AXI_FPD_awburst;
  output wire M_AXI_FPD_awlock;
  output wire [3 : 0] M_AXI_FPD_awcache;
  output wire [2 : 0] M_AXI_FPD_awprot;
  output wire M_AXI_FPD_awvalid;
  output wire [15 : 0] M_AXI_FPD_awuser;
  input bit M_AXI_FPD_awready;
  output wire M_AXI_FPD_wlast;
  output wire M_AXI_FPD_wvalid;
  input bit M_AXI_FPD_wready;
  input bit [15 : 0] M_AXI_FPD_bid;
  input bit [1 : 0] M_AXI_FPD_bresp;
  input bit M_AXI_FPD_bvalid;
  output wire M_AXI_FPD_bready;
  output wire [15 : 0] M_AXI_FPD_arid;
  output wire [43 : 0] M_AXI_FPD_araddr;
  output wire [7 : 0] M_AXI_FPD_arlen;
  output wire [2 : 0] M_AXI_FPD_arsize;
  output wire [1 : 0] M_AXI_FPD_arburst;
  output wire M_AXI_FPD_arlock;
  output wire [3 : 0] M_AXI_FPD_arcache;
  output wire [2 : 0] M_AXI_FPD_arprot;
  output wire M_AXI_FPD_arvalid;
  output wire [15 : 0] M_AXI_FPD_aruser;
  input bit M_AXI_FPD_arready;
  input bit [15 : 0] M_AXI_FPD_rid;
  input bit [1 : 0] M_AXI_FPD_rresp;
  input bit M_AXI_FPD_rlast;
  input bit M_AXI_FPD_rvalid;
  output wire M_AXI_FPD_rready;
  output wire [3 : 0] M_AXI_FPD_awqos;
  output wire [3 : 0] M_AXI_FPD_arqos;
  output wire [127 : 0] M_AXI_FPD_wdata;
  output wire [15 : 0] M_AXI_FPD_wstrb;
  input bit [127 : 0] M_AXI_FPD_rdata;
endmodule
`endif
