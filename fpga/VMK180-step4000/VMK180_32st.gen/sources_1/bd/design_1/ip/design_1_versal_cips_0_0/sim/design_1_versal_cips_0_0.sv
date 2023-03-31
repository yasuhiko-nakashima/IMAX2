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


// IP VLNV: xilinx.com:ip:versal_cips:3.1
// IP Revision: 0

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
(* DONT_TOUCH = "true" *)
module design_1_versal_cips_0_0 (
  pl0_ref_clk,
  pmc_iro_clk,
  pl0_resetn,
  m_axi_fpd_aclk,
  M_AXI_FPD_awid,
  M_AXI_FPD_awaddr,
  M_AXI_FPD_awlen,
  M_AXI_FPD_awsize,
  M_AXI_FPD_awburst,
  M_AXI_FPD_awlock,
  M_AXI_FPD_awcache,
  M_AXI_FPD_awprot,
  M_AXI_FPD_awvalid,
  M_AXI_FPD_awuser,
  M_AXI_FPD_awready,
  M_AXI_FPD_wlast,
  M_AXI_FPD_wvalid,
  M_AXI_FPD_wready,
  M_AXI_FPD_bid,
  M_AXI_FPD_bresp,
  M_AXI_FPD_bvalid,
  M_AXI_FPD_bready,
  M_AXI_FPD_arid,
  M_AXI_FPD_araddr,
  M_AXI_FPD_arlen,
  M_AXI_FPD_arsize,
  M_AXI_FPD_arburst,
  M_AXI_FPD_arlock,
  M_AXI_FPD_arcache,
  M_AXI_FPD_arprot,
  M_AXI_FPD_arvalid,
  M_AXI_FPD_aruser,
  M_AXI_FPD_arready,
  M_AXI_FPD_rid,
  M_AXI_FPD_rresp,
  M_AXI_FPD_rlast,
  M_AXI_FPD_rvalid,
  M_AXI_FPD_rready,
  M_AXI_FPD_awqos,
  M_AXI_FPD_arqos,
  M_AXI_FPD_wdata,
  M_AXI_FPD_wstrb,
  M_AXI_FPD_rdata
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.pl0_ref_clk, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_70da_pspmc_0_0_pl0_ref_clk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.pl0_ref_clk CLK" *)
output wire pl0_ref_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.pmc_iro_clk, FREQ_HZ 400000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_70da_pspmc_0_0_pmc_iro_clk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.pmc_iro_clk CLK" *)
output wire pmc_iro_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.pl0_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.pl0_resetn RST" *)
output wire pl0_resetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.m_axi_fpd_aclk, FREQ_HZ 299996999, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_wizard_0_0_clk_out1, ASSOCIATED_BUSIF M_AXI_FPD, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.m_axi_fpd_aclk CLK" *)
input wire m_axi_fpd_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWID" *)
output wire [15 : 0] M_AXI_FPD_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWADDR" *)
output wire [43 : 0] M_AXI_FPD_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWLEN" *)
output wire [7 : 0] M_AXI_FPD_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWSIZE" *)
output wire [2 : 0] M_AXI_FPD_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWBURST" *)
output wire [1 : 0] M_AXI_FPD_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWLOCK" *)
output wire M_AXI_FPD_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWCACHE" *)
output wire [3 : 0] M_AXI_FPD_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWPROT" *)
output wire [2 : 0] M_AXI_FPD_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWVALID" *)
output wire M_AXI_FPD_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWUSER" *)
output wire [15 : 0] M_AXI_FPD_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWREADY" *)
input wire M_AXI_FPD_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD WLAST" *)
output wire M_AXI_FPD_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD WVALID" *)
output wire M_AXI_FPD_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD WREADY" *)
input wire M_AXI_FPD_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD BID" *)
input wire [15 : 0] M_AXI_FPD_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD BRESP" *)
input wire [1 : 0] M_AXI_FPD_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD BVALID" *)
input wire M_AXI_FPD_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD BREADY" *)
output wire M_AXI_FPD_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARID" *)
output wire [15 : 0] M_AXI_FPD_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARADDR" *)
output wire [43 : 0] M_AXI_FPD_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARLEN" *)
output wire [7 : 0] M_AXI_FPD_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARSIZE" *)
output wire [2 : 0] M_AXI_FPD_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARBURST" *)
output wire [1 : 0] M_AXI_FPD_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARLOCK" *)
output wire M_AXI_FPD_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARCACHE" *)
output wire [3 : 0] M_AXI_FPD_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARPROT" *)
output wire [2 : 0] M_AXI_FPD_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARVALID" *)
output wire M_AXI_FPD_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARUSER" *)
output wire [15 : 0] M_AXI_FPD_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARREADY" *)
input wire M_AXI_FPD_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD RID" *)
input wire [15 : 0] M_AXI_FPD_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD RRESP" *)
input wire [1 : 0] M_AXI_FPD_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD RLAST" *)
input wire M_AXI_FPD_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD RVALID" *)
input wire M_AXI_FPD_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD RREADY" *)
output wire M_AXI_FPD_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWQOS" *)
output wire [3 : 0] M_AXI_FPD_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARQOS" *)
output wire [3 : 0] M_AXI_FPD_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD WDATA" *)
output wire [127 : 0] M_AXI_FPD_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD WSTRB" *)
output wire [15 : 0] M_AXI_FPD_wstrb;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI_FPD, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 299996999, ID_WIDTH 16, ADDR_WIDTH 44, AWUSER_WIDTH 16, ARUSER_WIDTH 16, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN design_1_clk_wizard_0_0_clk_out1, NUM_READ_THREADS 1, \
NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY pl, MY_CATEGORY ps" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD RDATA" *)
input wire [127 : 0] M_AXI_FPD_rdata;

  bd_70da inst (
    .pl0_ref_clk(pl0_ref_clk),
    .pmc_iro_clk(pmc_iro_clk),
    .pl0_resetn(pl0_resetn),
    .m_axi_fpd_aclk(m_axi_fpd_aclk),
    .M_AXI_FPD_awid(M_AXI_FPD_awid),
    .M_AXI_FPD_awaddr(M_AXI_FPD_awaddr),
    .M_AXI_FPD_awlen(M_AXI_FPD_awlen),
    .M_AXI_FPD_awsize(M_AXI_FPD_awsize),
    .M_AXI_FPD_awburst(M_AXI_FPD_awburst),
    .M_AXI_FPD_awlock(M_AXI_FPD_awlock),
    .M_AXI_FPD_awcache(M_AXI_FPD_awcache),
    .M_AXI_FPD_awprot(M_AXI_FPD_awprot),
    .M_AXI_FPD_awvalid(M_AXI_FPD_awvalid),
    .M_AXI_FPD_awuser(M_AXI_FPD_awuser),
    .M_AXI_FPD_awready(M_AXI_FPD_awready),
    .M_AXI_FPD_wlast(M_AXI_FPD_wlast),
    .M_AXI_FPD_wvalid(M_AXI_FPD_wvalid),
    .M_AXI_FPD_wready(M_AXI_FPD_wready),
    .M_AXI_FPD_bid(M_AXI_FPD_bid),
    .M_AXI_FPD_bresp(M_AXI_FPD_bresp),
    .M_AXI_FPD_bvalid(M_AXI_FPD_bvalid),
    .M_AXI_FPD_bready(M_AXI_FPD_bready),
    .M_AXI_FPD_arid(M_AXI_FPD_arid),
    .M_AXI_FPD_araddr(M_AXI_FPD_araddr),
    .M_AXI_FPD_arlen(M_AXI_FPD_arlen),
    .M_AXI_FPD_arsize(M_AXI_FPD_arsize),
    .M_AXI_FPD_arburst(M_AXI_FPD_arburst),
    .M_AXI_FPD_arlock(M_AXI_FPD_arlock),
    .M_AXI_FPD_arcache(M_AXI_FPD_arcache),
    .M_AXI_FPD_arprot(M_AXI_FPD_arprot),
    .M_AXI_FPD_arvalid(M_AXI_FPD_arvalid),
    .M_AXI_FPD_aruser(M_AXI_FPD_aruser),
    .M_AXI_FPD_arready(M_AXI_FPD_arready),
    .M_AXI_FPD_rid(M_AXI_FPD_rid),
    .M_AXI_FPD_rresp(M_AXI_FPD_rresp),
    .M_AXI_FPD_rlast(M_AXI_FPD_rlast),
    .M_AXI_FPD_rvalid(M_AXI_FPD_rvalid),
    .M_AXI_FPD_rready(M_AXI_FPD_rready),
    .M_AXI_FPD_awqos(M_AXI_FPD_awqos),
    .M_AXI_FPD_arqos(M_AXI_FPD_arqos),
    .M_AXI_FPD_wdata(M_AXI_FPD_wdata),
    .M_AXI_FPD_wstrb(M_AXI_FPD_wstrb),
    .M_AXI_FPD_rdata(M_AXI_FPD_rdata)
  );
endmodule
