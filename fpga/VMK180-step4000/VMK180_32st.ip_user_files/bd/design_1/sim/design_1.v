//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
//Date        : Thu Mar 30 09:44:46 2023
//Host        : cad105.naist.jp running 64-bit CentOS Linux release 7.9.2009 (Core)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=6,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   ();

  wire clk_wizard_0_clk_out1;
  wire clk_wizard_0_clk_out2;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  wire [0:0]proc_sys_reset_1_interconnect_aresetn;
  wire [39:0]smartconnect_0_M00_AXI_ARADDR;
  wire [1:0]smartconnect_0_M00_AXI_ARBURST;
  wire [3:0]smartconnect_0_M00_AXI_ARCACHE;
  wire [7:0]smartconnect_0_M00_AXI_ARLEN;
  wire [2:0]smartconnect_0_M00_AXI_ARPROT;
  wire smartconnect_0_M00_AXI_ARREADY;
  wire [2:0]smartconnect_0_M00_AXI_ARSIZE;
  wire smartconnect_0_M00_AXI_ARVALID;
  wire [39:0]smartconnect_0_M00_AXI_AWADDR;
  wire [1:0]smartconnect_0_M00_AXI_AWBURST;
  wire [3:0]smartconnect_0_M00_AXI_AWCACHE;
  wire [7:0]smartconnect_0_M00_AXI_AWLEN;
  wire [2:0]smartconnect_0_M00_AXI_AWPROT;
  wire smartconnect_0_M00_AXI_AWREADY;
  wire [2:0]smartconnect_0_M00_AXI_AWSIZE;
  wire smartconnect_0_M00_AXI_AWVALID;
  wire smartconnect_0_M00_AXI_BREADY;
  wire [1:0]smartconnect_0_M00_AXI_BRESP;
  wire smartconnect_0_M00_AXI_BVALID;
  wire [255:0]smartconnect_0_M00_AXI_RDATA;
  wire smartconnect_0_M00_AXI_RLAST;
  wire smartconnect_0_M00_AXI_RREADY;
  wire [1:0]smartconnect_0_M00_AXI_RRESP;
  wire smartconnect_0_M00_AXI_RVALID;
  wire [255:0]smartconnect_0_M00_AXI_WDATA;
  wire smartconnect_0_M00_AXI_WLAST;
  wire smartconnect_0_M00_AXI_WREADY;
  wire [31:0]smartconnect_0_M00_AXI_WSTRB;
  wire smartconnect_0_M00_AXI_WVALID;
  wire [43:0]versal_cips_0_M_AXI_FPD_ARADDR;
  wire [1:0]versal_cips_0_M_AXI_FPD_ARBURST;
  wire [3:0]versal_cips_0_M_AXI_FPD_ARCACHE;
  wire [15:0]versal_cips_0_M_AXI_FPD_ARID;
  wire [7:0]versal_cips_0_M_AXI_FPD_ARLEN;
  wire versal_cips_0_M_AXI_FPD_ARLOCK;
  wire [2:0]versal_cips_0_M_AXI_FPD_ARPROT;
  wire [3:0]versal_cips_0_M_AXI_FPD_ARQOS;
  wire versal_cips_0_M_AXI_FPD_ARREADY;
  wire [2:0]versal_cips_0_M_AXI_FPD_ARSIZE;
  wire [15:0]versal_cips_0_M_AXI_FPD_ARUSER;
  wire versal_cips_0_M_AXI_FPD_ARVALID;
  wire [43:0]versal_cips_0_M_AXI_FPD_AWADDR;
  wire [1:0]versal_cips_0_M_AXI_FPD_AWBURST;
  wire [3:0]versal_cips_0_M_AXI_FPD_AWCACHE;
  wire [15:0]versal_cips_0_M_AXI_FPD_AWID;
  wire [7:0]versal_cips_0_M_AXI_FPD_AWLEN;
  wire versal_cips_0_M_AXI_FPD_AWLOCK;
  wire [2:0]versal_cips_0_M_AXI_FPD_AWPROT;
  wire [3:0]versal_cips_0_M_AXI_FPD_AWQOS;
  wire versal_cips_0_M_AXI_FPD_AWREADY;
  wire [2:0]versal_cips_0_M_AXI_FPD_AWSIZE;
  wire [15:0]versal_cips_0_M_AXI_FPD_AWUSER;
  wire versal_cips_0_M_AXI_FPD_AWVALID;
  wire [15:0]versal_cips_0_M_AXI_FPD_BID;
  wire versal_cips_0_M_AXI_FPD_BREADY;
  wire [1:0]versal_cips_0_M_AXI_FPD_BRESP;
  wire versal_cips_0_M_AXI_FPD_BVALID;
  wire [127:0]versal_cips_0_M_AXI_FPD_RDATA;
  wire [15:0]versal_cips_0_M_AXI_FPD_RID;
  wire versal_cips_0_M_AXI_FPD_RLAST;
  wire versal_cips_0_M_AXI_FPD_RREADY;
  wire [1:0]versal_cips_0_M_AXI_FPD_RRESP;
  wire versal_cips_0_M_AXI_FPD_RVALID;
  wire [127:0]versal_cips_0_M_AXI_FPD_WDATA;
  wire versal_cips_0_M_AXI_FPD_WLAST;
  wire versal_cips_0_M_AXI_FPD_WREADY;
  wire [15:0]versal_cips_0_M_AXI_FPD_WSTRB;
  wire versal_cips_0_M_AXI_FPD_WVALID;
  wire versal_cips_0_pl0_ref_clk;
  wire versal_cips_0_pl0_resetn;

  design_1_clk_wizard_0_0 clk_wizard_0
       (.clk_in1(versal_cips_0_pl0_ref_clk),
        .clk_out1(clk_wizard_0_clk_out1),
        .clk_out2(clk_wizard_0_clk_out2));
  design_1_emax6_0_0 emax6_0
       (.ACLK(clk_wizard_0_clk_out2),
        .ARESETN(proc_sys_reset_0_peripheral_aresetn),
        .axi_s_araddr(smartconnect_0_M00_AXI_ARADDR),
        .axi_s_arburst(smartconnect_0_M00_AXI_ARBURST),
        .axi_s_arcache(smartconnect_0_M00_AXI_ARCACHE),
        .axi_s_arid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_s_arlen(smartconnect_0_M00_AXI_ARLEN),
        .axi_s_arprot(smartconnect_0_M00_AXI_ARPROT),
        .axi_s_arready(smartconnect_0_M00_AXI_ARREADY),
        .axi_s_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .axi_s_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .axi_s_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .axi_s_awburst(smartconnect_0_M00_AXI_AWBURST),
        .axi_s_awcache(smartconnect_0_M00_AXI_AWCACHE),
        .axi_s_awid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_s_awlen(smartconnect_0_M00_AXI_AWLEN),
        .axi_s_awprot(smartconnect_0_M00_AXI_AWPROT),
        .axi_s_awready(smartconnect_0_M00_AXI_AWREADY),
        .axi_s_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .axi_s_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .axi_s_bready(smartconnect_0_M00_AXI_BREADY),
        .axi_s_bresp(smartconnect_0_M00_AXI_BRESP),
        .axi_s_bvalid(smartconnect_0_M00_AXI_BVALID),
        .axi_s_rdata(smartconnect_0_M00_AXI_RDATA),
        .axi_s_rlast(smartconnect_0_M00_AXI_RLAST),
        .axi_s_rready(smartconnect_0_M00_AXI_RREADY),
        .axi_s_rresp(smartconnect_0_M00_AXI_RRESP),
        .axi_s_rvalid(smartconnect_0_M00_AXI_RVALID),
        .axi_s_wdata(smartconnect_0_M00_AXI_WDATA),
        .axi_s_wlast(smartconnect_0_M00_AXI_WLAST),
        .axi_s_wready(smartconnect_0_M00_AXI_WREADY),
        .axi_s_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .axi_s_wvalid(smartconnect_0_M00_AXI_WVALID));
  design_1_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(versal_cips_0_pl0_resetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .slowest_sync_clk(clk_wizard_0_clk_out2));
  design_1_proc_sys_reset_1_0 proc_sys_reset_1
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(versal_cips_0_pl0_resetn),
        .interconnect_aresetn(proc_sys_reset_1_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .slowest_sync_clk(versal_cips_0_pl0_ref_clk));
  design_1_smartconnect_0_0 smartconnect_0
       (.M00_AXI_araddr(smartconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_0_M00_AXI_ARBURST),
        .M00_AXI_arcache(smartconnect_0_M00_AXI_ARCACHE),
        .M00_AXI_arlen(smartconnect_0_M00_AXI_ARLEN),
        .M00_AXI_arprot(smartconnect_0_M00_AXI_ARPROT),
        .M00_AXI_arready(smartconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(smartconnect_0_M00_AXI_AWBURST),
        .M00_AXI_awcache(smartconnect_0_M00_AXI_AWCACHE),
        .M00_AXI_awlen(smartconnect_0_M00_AXI_AWLEN),
        .M00_AXI_awprot(smartconnect_0_M00_AXI_AWPROT),
        .M00_AXI_awready(smartconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(smartconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_0_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_0_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_0_M00_AXI_WDATA),
        .M00_AXI_wlast(smartconnect_0_M00_AXI_WLAST),
        .M00_AXI_wready(smartconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_0_M00_AXI_WVALID),
        .S00_AXI_araddr(versal_cips_0_M_AXI_FPD_ARADDR),
        .S00_AXI_arburst(versal_cips_0_M_AXI_FPD_ARBURST),
        .S00_AXI_arcache(versal_cips_0_M_AXI_FPD_ARCACHE),
        .S00_AXI_arid(versal_cips_0_M_AXI_FPD_ARID),
        .S00_AXI_arlen(versal_cips_0_M_AXI_FPD_ARLEN),
        .S00_AXI_arlock(versal_cips_0_M_AXI_FPD_ARLOCK),
        .S00_AXI_arprot(versal_cips_0_M_AXI_FPD_ARPROT),
        .S00_AXI_arqos(versal_cips_0_M_AXI_FPD_ARQOS),
        .S00_AXI_arready(versal_cips_0_M_AXI_FPD_ARREADY),
        .S00_AXI_arsize(versal_cips_0_M_AXI_FPD_ARSIZE),
        .S00_AXI_aruser(versal_cips_0_M_AXI_FPD_ARUSER),
        .S00_AXI_arvalid(versal_cips_0_M_AXI_FPD_ARVALID),
        .S00_AXI_awaddr(versal_cips_0_M_AXI_FPD_AWADDR),
        .S00_AXI_awburst(versal_cips_0_M_AXI_FPD_AWBURST),
        .S00_AXI_awcache(versal_cips_0_M_AXI_FPD_AWCACHE),
        .S00_AXI_awid(versal_cips_0_M_AXI_FPD_AWID),
        .S00_AXI_awlen(versal_cips_0_M_AXI_FPD_AWLEN),
        .S00_AXI_awlock(versal_cips_0_M_AXI_FPD_AWLOCK),
        .S00_AXI_awprot(versal_cips_0_M_AXI_FPD_AWPROT),
        .S00_AXI_awqos(versal_cips_0_M_AXI_FPD_AWQOS),
        .S00_AXI_awready(versal_cips_0_M_AXI_FPD_AWREADY),
        .S00_AXI_awsize(versal_cips_0_M_AXI_FPD_AWSIZE),
        .S00_AXI_awuser(versal_cips_0_M_AXI_FPD_AWUSER),
        .S00_AXI_awvalid(versal_cips_0_M_AXI_FPD_AWVALID),
        .S00_AXI_bid(versal_cips_0_M_AXI_FPD_BID),
        .S00_AXI_bready(versal_cips_0_M_AXI_FPD_BREADY),
        .S00_AXI_bresp(versal_cips_0_M_AXI_FPD_BRESP),
        .S00_AXI_bvalid(versal_cips_0_M_AXI_FPD_BVALID),
        .S00_AXI_rdata(versal_cips_0_M_AXI_FPD_RDATA),
        .S00_AXI_rid(versal_cips_0_M_AXI_FPD_RID),
        .S00_AXI_rlast(versal_cips_0_M_AXI_FPD_RLAST),
        .S00_AXI_rready(versal_cips_0_M_AXI_FPD_RREADY),
        .S00_AXI_rresp(versal_cips_0_M_AXI_FPD_RRESP),
        .S00_AXI_rvalid(versal_cips_0_M_AXI_FPD_RVALID),
        .S00_AXI_wdata(versal_cips_0_M_AXI_FPD_WDATA),
        .S00_AXI_wlast(versal_cips_0_M_AXI_FPD_WLAST),
        .S00_AXI_wready(versal_cips_0_M_AXI_FPD_WREADY),
        .S00_AXI_wstrb(versal_cips_0_M_AXI_FPD_WSTRB),
        .S00_AXI_wvalid(versal_cips_0_M_AXI_FPD_WVALID),
        .aclk(clk_wizard_0_clk_out1),
        .aclk1(clk_wizard_0_clk_out2),
        .aresetn(proc_sys_reset_1_interconnect_aresetn));
  design_1_versal_cips_0_0 versal_cips_0
       (.M_AXI_FPD_araddr(versal_cips_0_M_AXI_FPD_ARADDR),
        .M_AXI_FPD_arburst(versal_cips_0_M_AXI_FPD_ARBURST),
        .M_AXI_FPD_arcache(versal_cips_0_M_AXI_FPD_ARCACHE),
        .M_AXI_FPD_arid(versal_cips_0_M_AXI_FPD_ARID),
        .M_AXI_FPD_arlen(versal_cips_0_M_AXI_FPD_ARLEN),
        .M_AXI_FPD_arlock(versal_cips_0_M_AXI_FPD_ARLOCK),
        .M_AXI_FPD_arprot(versal_cips_0_M_AXI_FPD_ARPROT),
        .M_AXI_FPD_arqos(versal_cips_0_M_AXI_FPD_ARQOS),
        .M_AXI_FPD_arready(versal_cips_0_M_AXI_FPD_ARREADY),
        .M_AXI_FPD_arsize(versal_cips_0_M_AXI_FPD_ARSIZE),
        .M_AXI_FPD_aruser(versal_cips_0_M_AXI_FPD_ARUSER),
        .M_AXI_FPD_arvalid(versal_cips_0_M_AXI_FPD_ARVALID),
        .M_AXI_FPD_awaddr(versal_cips_0_M_AXI_FPD_AWADDR),
        .M_AXI_FPD_awburst(versal_cips_0_M_AXI_FPD_AWBURST),
        .M_AXI_FPD_awcache(versal_cips_0_M_AXI_FPD_AWCACHE),
        .M_AXI_FPD_awid(versal_cips_0_M_AXI_FPD_AWID),
        .M_AXI_FPD_awlen(versal_cips_0_M_AXI_FPD_AWLEN),
        .M_AXI_FPD_awlock(versal_cips_0_M_AXI_FPD_AWLOCK),
        .M_AXI_FPD_awprot(versal_cips_0_M_AXI_FPD_AWPROT),
        .M_AXI_FPD_awqos(versal_cips_0_M_AXI_FPD_AWQOS),
        .M_AXI_FPD_awready(versal_cips_0_M_AXI_FPD_AWREADY),
        .M_AXI_FPD_awsize(versal_cips_0_M_AXI_FPD_AWSIZE),
        .M_AXI_FPD_awuser(versal_cips_0_M_AXI_FPD_AWUSER),
        .M_AXI_FPD_awvalid(versal_cips_0_M_AXI_FPD_AWVALID),
        .M_AXI_FPD_bid(versal_cips_0_M_AXI_FPD_BID),
        .M_AXI_FPD_bready(versal_cips_0_M_AXI_FPD_BREADY),
        .M_AXI_FPD_bresp(versal_cips_0_M_AXI_FPD_BRESP),
        .M_AXI_FPD_bvalid(versal_cips_0_M_AXI_FPD_BVALID),
        .M_AXI_FPD_rdata(versal_cips_0_M_AXI_FPD_RDATA),
        .M_AXI_FPD_rid(versal_cips_0_M_AXI_FPD_RID),
        .M_AXI_FPD_rlast(versal_cips_0_M_AXI_FPD_RLAST),
        .M_AXI_FPD_rready(versal_cips_0_M_AXI_FPD_RREADY),
        .M_AXI_FPD_rresp(versal_cips_0_M_AXI_FPD_RRESP),
        .M_AXI_FPD_rvalid(versal_cips_0_M_AXI_FPD_RVALID),
        .M_AXI_FPD_wdata(versal_cips_0_M_AXI_FPD_WDATA),
        .M_AXI_FPD_wlast(versal_cips_0_M_AXI_FPD_WLAST),
        .M_AXI_FPD_wready(versal_cips_0_M_AXI_FPD_WREADY),
        .M_AXI_FPD_wstrb(versal_cips_0_M_AXI_FPD_WSTRB),
        .M_AXI_FPD_wvalid(versal_cips_0_M_AXI_FPD_WVALID),
        .m_axi_fpd_aclk(clk_wizard_0_clk_out1),
        .pl0_ref_clk(versal_cips_0_pl0_ref_clk),
        .pl0_resetn(versal_cips_0_pl0_resetn));
endmodule
