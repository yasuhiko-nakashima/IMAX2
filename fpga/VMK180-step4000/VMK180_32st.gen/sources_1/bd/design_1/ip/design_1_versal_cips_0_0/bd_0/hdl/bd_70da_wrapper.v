//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_70da_wrapper.bd
//Design : bd_70da_wrapper
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_70da_wrapper
   (M_AXI_FPD_araddr,
    M_AXI_FPD_arburst,
    M_AXI_FPD_arcache,
    M_AXI_FPD_arid,
    M_AXI_FPD_arlen,
    M_AXI_FPD_arlock,
    M_AXI_FPD_arprot,
    M_AXI_FPD_arqos,
    M_AXI_FPD_arready,
    M_AXI_FPD_arsize,
    M_AXI_FPD_aruser,
    M_AXI_FPD_arvalid,
    M_AXI_FPD_awaddr,
    M_AXI_FPD_awburst,
    M_AXI_FPD_awcache,
    M_AXI_FPD_awid,
    M_AXI_FPD_awlen,
    M_AXI_FPD_awlock,
    M_AXI_FPD_awprot,
    M_AXI_FPD_awqos,
    M_AXI_FPD_awready,
    M_AXI_FPD_awsize,
    M_AXI_FPD_awuser,
    M_AXI_FPD_awvalid,
    M_AXI_FPD_bid,
    M_AXI_FPD_bready,
    M_AXI_FPD_bresp,
    M_AXI_FPD_bvalid,
    M_AXI_FPD_rdata,
    M_AXI_FPD_rid,
    M_AXI_FPD_rlast,
    M_AXI_FPD_rready,
    M_AXI_FPD_rresp,
    M_AXI_FPD_rvalid,
    M_AXI_FPD_wdata,
    M_AXI_FPD_wlast,
    M_AXI_FPD_wready,
    M_AXI_FPD_wstrb,
    M_AXI_FPD_wvalid,
    m_axi_fpd_aclk,
    pl0_ref_clk,
    pl0_resetn,
    pmc_iro_clk);
  output [43:0]M_AXI_FPD_araddr;
  output [1:0]M_AXI_FPD_arburst;
  output [3:0]M_AXI_FPD_arcache;
  output [15:0]M_AXI_FPD_arid;
  output [7:0]M_AXI_FPD_arlen;
  output M_AXI_FPD_arlock;
  output [2:0]M_AXI_FPD_arprot;
  output [3:0]M_AXI_FPD_arqos;
  input M_AXI_FPD_arready;
  output [2:0]M_AXI_FPD_arsize;
  output [15:0]M_AXI_FPD_aruser;
  output M_AXI_FPD_arvalid;
  output [43:0]M_AXI_FPD_awaddr;
  output [1:0]M_AXI_FPD_awburst;
  output [3:0]M_AXI_FPD_awcache;
  output [15:0]M_AXI_FPD_awid;
  output [7:0]M_AXI_FPD_awlen;
  output M_AXI_FPD_awlock;
  output [2:0]M_AXI_FPD_awprot;
  output [3:0]M_AXI_FPD_awqos;
  input M_AXI_FPD_awready;
  output [2:0]M_AXI_FPD_awsize;
  output [15:0]M_AXI_FPD_awuser;
  output M_AXI_FPD_awvalid;
  input [15:0]M_AXI_FPD_bid;
  output M_AXI_FPD_bready;
  input [1:0]M_AXI_FPD_bresp;
  input M_AXI_FPD_bvalid;
  input [127:0]M_AXI_FPD_rdata;
  input [15:0]M_AXI_FPD_rid;
  input M_AXI_FPD_rlast;
  output M_AXI_FPD_rready;
  input [1:0]M_AXI_FPD_rresp;
  input M_AXI_FPD_rvalid;
  output [127:0]M_AXI_FPD_wdata;
  output M_AXI_FPD_wlast;
  input M_AXI_FPD_wready;
  output [15:0]M_AXI_FPD_wstrb;
  output M_AXI_FPD_wvalid;
  input m_axi_fpd_aclk;
  output pl0_ref_clk;
  output pl0_resetn;
  output pmc_iro_clk;

  wire [43:0]M_AXI_FPD_araddr;
  wire [1:0]M_AXI_FPD_arburst;
  wire [3:0]M_AXI_FPD_arcache;
  wire [15:0]M_AXI_FPD_arid;
  wire [7:0]M_AXI_FPD_arlen;
  wire M_AXI_FPD_arlock;
  wire [2:0]M_AXI_FPD_arprot;
  wire [3:0]M_AXI_FPD_arqos;
  wire M_AXI_FPD_arready;
  wire [2:0]M_AXI_FPD_arsize;
  wire [15:0]M_AXI_FPD_aruser;
  wire M_AXI_FPD_arvalid;
  wire [43:0]M_AXI_FPD_awaddr;
  wire [1:0]M_AXI_FPD_awburst;
  wire [3:0]M_AXI_FPD_awcache;
  wire [15:0]M_AXI_FPD_awid;
  wire [7:0]M_AXI_FPD_awlen;
  wire M_AXI_FPD_awlock;
  wire [2:0]M_AXI_FPD_awprot;
  wire [3:0]M_AXI_FPD_awqos;
  wire M_AXI_FPD_awready;
  wire [2:0]M_AXI_FPD_awsize;
  wire [15:0]M_AXI_FPD_awuser;
  wire M_AXI_FPD_awvalid;
  wire [15:0]M_AXI_FPD_bid;
  wire M_AXI_FPD_bready;
  wire [1:0]M_AXI_FPD_bresp;
  wire M_AXI_FPD_bvalid;
  wire [127:0]M_AXI_FPD_rdata;
  wire [15:0]M_AXI_FPD_rid;
  wire M_AXI_FPD_rlast;
  wire M_AXI_FPD_rready;
  wire [1:0]M_AXI_FPD_rresp;
  wire M_AXI_FPD_rvalid;
  wire [127:0]M_AXI_FPD_wdata;
  wire M_AXI_FPD_wlast;
  wire M_AXI_FPD_wready;
  wire [15:0]M_AXI_FPD_wstrb;
  wire M_AXI_FPD_wvalid;
  wire m_axi_fpd_aclk;
  wire pl0_ref_clk;
  wire pl0_resetn;
  wire pmc_iro_clk;

  bd_70da bd_70da_i
       (.M_AXI_FPD_araddr(M_AXI_FPD_araddr),
        .M_AXI_FPD_arburst(M_AXI_FPD_arburst),
        .M_AXI_FPD_arcache(M_AXI_FPD_arcache),
        .M_AXI_FPD_arid(M_AXI_FPD_arid),
        .M_AXI_FPD_arlen(M_AXI_FPD_arlen),
        .M_AXI_FPD_arlock(M_AXI_FPD_arlock),
        .M_AXI_FPD_arprot(M_AXI_FPD_arprot),
        .M_AXI_FPD_arqos(M_AXI_FPD_arqos),
        .M_AXI_FPD_arready(M_AXI_FPD_arready),
        .M_AXI_FPD_arsize(M_AXI_FPD_arsize),
        .M_AXI_FPD_aruser(M_AXI_FPD_aruser),
        .M_AXI_FPD_arvalid(M_AXI_FPD_arvalid),
        .M_AXI_FPD_awaddr(M_AXI_FPD_awaddr),
        .M_AXI_FPD_awburst(M_AXI_FPD_awburst),
        .M_AXI_FPD_awcache(M_AXI_FPD_awcache),
        .M_AXI_FPD_awid(M_AXI_FPD_awid),
        .M_AXI_FPD_awlen(M_AXI_FPD_awlen),
        .M_AXI_FPD_awlock(M_AXI_FPD_awlock),
        .M_AXI_FPD_awprot(M_AXI_FPD_awprot),
        .M_AXI_FPD_awqos(M_AXI_FPD_awqos),
        .M_AXI_FPD_awready(M_AXI_FPD_awready),
        .M_AXI_FPD_awsize(M_AXI_FPD_awsize),
        .M_AXI_FPD_awuser(M_AXI_FPD_awuser),
        .M_AXI_FPD_awvalid(M_AXI_FPD_awvalid),
        .M_AXI_FPD_bid(M_AXI_FPD_bid),
        .M_AXI_FPD_bready(M_AXI_FPD_bready),
        .M_AXI_FPD_bresp(M_AXI_FPD_bresp),
        .M_AXI_FPD_bvalid(M_AXI_FPD_bvalid),
        .M_AXI_FPD_rdata(M_AXI_FPD_rdata),
        .M_AXI_FPD_rid(M_AXI_FPD_rid),
        .M_AXI_FPD_rlast(M_AXI_FPD_rlast),
        .M_AXI_FPD_rready(M_AXI_FPD_rready),
        .M_AXI_FPD_rresp(M_AXI_FPD_rresp),
        .M_AXI_FPD_rvalid(M_AXI_FPD_rvalid),
        .M_AXI_FPD_wdata(M_AXI_FPD_wdata),
        .M_AXI_FPD_wlast(M_AXI_FPD_wlast),
        .M_AXI_FPD_wready(M_AXI_FPD_wready),
        .M_AXI_FPD_wstrb(M_AXI_FPD_wstrb),
        .M_AXI_FPD_wvalid(M_AXI_FPD_wvalid),
        .m_axi_fpd_aclk(m_axi_fpd_aclk),
        .pl0_ref_clk(pl0_ref_clk),
        .pl0_resetn(pl0_resetn),
        .pmc_iro_clk(pmc_iro_clk));
endmodule
