//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_70da.bd
//Design : bd_70da
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_70da,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_70da,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=Global}" *) (* HW_HANDOFF = "design_1_versal_cips_0_0.hwdef" *) 
module bd_70da
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
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI_FPD, ADDR_WIDTH 44, ARUSER_WIDTH 16, AWUSER_WIDTH 16, BUSER_WIDTH 0, CATEGORY pl, CLK_DOMAIN design_1_clk_wizard_0_0_clk_out1, DATA_WIDTH 128, FREQ_HZ 299996999, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 16, INSERT_VIP 0, MAX_BURST_LENGTH 256, MY_CATEGORY ps, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [43:0]M_AXI_FPD_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARBURST" *) output [1:0]M_AXI_FPD_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARCACHE" *) output [3:0]M_AXI_FPD_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARID" *) output [15:0]M_AXI_FPD_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARLEN" *) output [7:0]M_AXI_FPD_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARLOCK" *) output M_AXI_FPD_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARPROT" *) output [2:0]M_AXI_FPD_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARQOS" *) output [3:0]M_AXI_FPD_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARREADY" *) input M_AXI_FPD_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARSIZE" *) output [2:0]M_AXI_FPD_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARUSER" *) output [15:0]M_AXI_FPD_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD ARVALID" *) output M_AXI_FPD_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWADDR" *) output [43:0]M_AXI_FPD_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWBURST" *) output [1:0]M_AXI_FPD_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWCACHE" *) output [3:0]M_AXI_FPD_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWID" *) output [15:0]M_AXI_FPD_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWLEN" *) output [7:0]M_AXI_FPD_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWLOCK" *) output M_AXI_FPD_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWPROT" *) output [2:0]M_AXI_FPD_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWQOS" *) output [3:0]M_AXI_FPD_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWREADY" *) input M_AXI_FPD_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWSIZE" *) output [2:0]M_AXI_FPD_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWUSER" *) output [15:0]M_AXI_FPD_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD AWVALID" *) output M_AXI_FPD_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD BID" *) input [15:0]M_AXI_FPD_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD BREADY" *) output M_AXI_FPD_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD BRESP" *) input [1:0]M_AXI_FPD_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD BVALID" *) input M_AXI_FPD_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD RDATA" *) input [127:0]M_AXI_FPD_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD RID" *) input [15:0]M_AXI_FPD_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD RLAST" *) input M_AXI_FPD_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD RREADY" *) output M_AXI_FPD_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD RRESP" *) input [1:0]M_AXI_FPD_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD RVALID" *) input M_AXI_FPD_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD WDATA" *) output [127:0]M_AXI_FPD_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD WLAST" *) output M_AXI_FPD_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD WREADY" *) input M_AXI_FPD_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD WSTRB" *) output [15:0]M_AXI_FPD_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_FPD WVALID" *) output M_AXI_FPD_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.M_AXI_FPD_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.M_AXI_FPD_ACLK, ASSOCIATED_BUSIF M_AXI_FPD, CLK_DOMAIN design_1_clk_wizard_0_0_clk_out1, FREQ_HZ 299996999, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input m_axi_fpd_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.PL0_REF_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.PL0_REF_CLK, CLK_DOMAIN bd_70da_pspmc_0_0_pl0_ref_clk, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output pl0_ref_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.PL0_RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.PL0_RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) output pl0_resetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.PMC_IRO_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.PMC_IRO_CLK, CLK_DOMAIN bd_70da_pspmc_0_0_pmc_iro_clk, FREQ_HZ 400000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output pmc_iro_clk;

  wire m_axi_fpd_aclk_1;
  wire [43:0]pspmc_0_M_AXI_FPD_ARADDR;
  wire [1:0]pspmc_0_M_AXI_FPD_ARBURST;
  wire [3:0]pspmc_0_M_AXI_FPD_ARCACHE;
  wire [15:0]pspmc_0_M_AXI_FPD_ARID;
  wire [7:0]pspmc_0_M_AXI_FPD_ARLEN;
  wire pspmc_0_M_AXI_FPD_ARLOCK;
  wire [2:0]pspmc_0_M_AXI_FPD_ARPROT;
  wire [3:0]pspmc_0_M_AXI_FPD_ARQOS;
  wire pspmc_0_M_AXI_FPD_ARREADY;
  wire [2:0]pspmc_0_M_AXI_FPD_ARSIZE;
  wire [15:0]pspmc_0_M_AXI_FPD_ARUSER;
  wire pspmc_0_M_AXI_FPD_ARVALID;
  wire [43:0]pspmc_0_M_AXI_FPD_AWADDR;
  wire [1:0]pspmc_0_M_AXI_FPD_AWBURST;
  wire [3:0]pspmc_0_M_AXI_FPD_AWCACHE;
  wire [15:0]pspmc_0_M_AXI_FPD_AWID;
  wire [7:0]pspmc_0_M_AXI_FPD_AWLEN;
  wire pspmc_0_M_AXI_FPD_AWLOCK;
  wire [2:0]pspmc_0_M_AXI_FPD_AWPROT;
  wire [3:0]pspmc_0_M_AXI_FPD_AWQOS;
  wire pspmc_0_M_AXI_FPD_AWREADY;
  wire [2:0]pspmc_0_M_AXI_FPD_AWSIZE;
  wire [15:0]pspmc_0_M_AXI_FPD_AWUSER;
  wire pspmc_0_M_AXI_FPD_AWVALID;
  wire [15:0]pspmc_0_M_AXI_FPD_BID;
  wire pspmc_0_M_AXI_FPD_BREADY;
  wire [1:0]pspmc_0_M_AXI_FPD_BRESP;
  wire pspmc_0_M_AXI_FPD_BVALID;
  wire [127:0]pspmc_0_M_AXI_FPD_RDATA;
  wire [15:0]pspmc_0_M_AXI_FPD_RID;
  wire pspmc_0_M_AXI_FPD_RLAST;
  wire pspmc_0_M_AXI_FPD_RREADY;
  wire [1:0]pspmc_0_M_AXI_FPD_RRESP;
  wire pspmc_0_M_AXI_FPD_RVALID;
  wire [127:0]pspmc_0_M_AXI_FPD_WDATA;
  wire pspmc_0_M_AXI_FPD_WLAST;
  wire pspmc_0_M_AXI_FPD_WREADY;
  wire [15:0]pspmc_0_M_AXI_FPD_WSTRB;
  wire pspmc_0_M_AXI_FPD_WVALID;
  wire pspmc_0_pl0_ref_clk;
  wire pspmc_0_pl0_resetn;
  wire pspmc_0_pmc_iro_clk;

  assign M_AXI_FPD_araddr[43:0] = pspmc_0_M_AXI_FPD_ARADDR;
  assign M_AXI_FPD_arburst[1:0] = pspmc_0_M_AXI_FPD_ARBURST;
  assign M_AXI_FPD_arcache[3:0] = pspmc_0_M_AXI_FPD_ARCACHE;
  assign M_AXI_FPD_arid[15:0] = pspmc_0_M_AXI_FPD_ARID;
  assign M_AXI_FPD_arlen[7:0] = pspmc_0_M_AXI_FPD_ARLEN;
  assign M_AXI_FPD_arlock = pspmc_0_M_AXI_FPD_ARLOCK;
  assign M_AXI_FPD_arprot[2:0] = pspmc_0_M_AXI_FPD_ARPROT;
  assign M_AXI_FPD_arqos[3:0] = pspmc_0_M_AXI_FPD_ARQOS;
  assign M_AXI_FPD_arsize[2:0] = pspmc_0_M_AXI_FPD_ARSIZE;
  assign M_AXI_FPD_aruser[15:0] = pspmc_0_M_AXI_FPD_ARUSER;
  assign M_AXI_FPD_arvalid = pspmc_0_M_AXI_FPD_ARVALID;
  assign M_AXI_FPD_awaddr[43:0] = pspmc_0_M_AXI_FPD_AWADDR;
  assign M_AXI_FPD_awburst[1:0] = pspmc_0_M_AXI_FPD_AWBURST;
  assign M_AXI_FPD_awcache[3:0] = pspmc_0_M_AXI_FPD_AWCACHE;
  assign M_AXI_FPD_awid[15:0] = pspmc_0_M_AXI_FPD_AWID;
  assign M_AXI_FPD_awlen[7:0] = pspmc_0_M_AXI_FPD_AWLEN;
  assign M_AXI_FPD_awlock = pspmc_0_M_AXI_FPD_AWLOCK;
  assign M_AXI_FPD_awprot[2:0] = pspmc_0_M_AXI_FPD_AWPROT;
  assign M_AXI_FPD_awqos[3:0] = pspmc_0_M_AXI_FPD_AWQOS;
  assign M_AXI_FPD_awsize[2:0] = pspmc_0_M_AXI_FPD_AWSIZE;
  assign M_AXI_FPD_awuser[15:0] = pspmc_0_M_AXI_FPD_AWUSER;
  assign M_AXI_FPD_awvalid = pspmc_0_M_AXI_FPD_AWVALID;
  assign M_AXI_FPD_bready = pspmc_0_M_AXI_FPD_BREADY;
  assign M_AXI_FPD_rready = pspmc_0_M_AXI_FPD_RREADY;
  assign M_AXI_FPD_wdata[127:0] = pspmc_0_M_AXI_FPD_WDATA;
  assign M_AXI_FPD_wlast = pspmc_0_M_AXI_FPD_WLAST;
  assign M_AXI_FPD_wstrb[15:0] = pspmc_0_M_AXI_FPD_WSTRB;
  assign M_AXI_FPD_wvalid = pspmc_0_M_AXI_FPD_WVALID;
  assign m_axi_fpd_aclk_1 = m_axi_fpd_aclk;
  assign pl0_ref_clk = pspmc_0_pl0_ref_clk;
  assign pl0_resetn = pspmc_0_pl0_resetn;
  assign pmc_iro_clk = pspmc_0_pmc_iro_clk;
  assign pspmc_0_M_AXI_FPD_ARREADY = M_AXI_FPD_arready;
  assign pspmc_0_M_AXI_FPD_AWREADY = M_AXI_FPD_awready;
  assign pspmc_0_M_AXI_FPD_BID = M_AXI_FPD_bid[15:0];
  assign pspmc_0_M_AXI_FPD_BRESP = M_AXI_FPD_bresp[1:0];
  assign pspmc_0_M_AXI_FPD_BVALID = M_AXI_FPD_bvalid;
  assign pspmc_0_M_AXI_FPD_RDATA = M_AXI_FPD_rdata[127:0];
  assign pspmc_0_M_AXI_FPD_RID = M_AXI_FPD_rid[15:0];
  assign pspmc_0_M_AXI_FPD_RLAST = M_AXI_FPD_rlast;
  assign pspmc_0_M_AXI_FPD_RRESP = M_AXI_FPD_rresp[1:0];
  assign pspmc_0_M_AXI_FPD_RVALID = M_AXI_FPD_rvalid;
  assign pspmc_0_M_AXI_FPD_WREADY = M_AXI_FPD_wready;
  bd_70da_pspmc_0_0 pspmc_0
       (.cpmps_corr_irq(1'b0),
        .cpmps_misc_irq(1'b0),
        .cpmps_uncorr_irq(1'b0),
        .hsdp_gt_rxoutclk(1'b0),
        .hsdp_xpipe0_rx_datavalid(1'b0),
        .hsdp_xpipe0_rx_header({1'b0,1'b0}),
        .hsdp_xpipe0_rx_headervalid(1'b0),
        .hsdp_xpipe0_rx_resetdone(1'b0),
        .hsdp_xpipe0_tx_resetdone(1'b0),
        .hsdp_xpipe1_rx_datavalid(1'b0),
        .hsdp_xpipe1_rx_header({1'b0,1'b0}),
        .hsdp_xpipe1_rx_headervalid(1'b0),
        .hsdp_xpipe1_rx_resetdone(1'b0),
        .hsdp_xpipe1_tx_resetdone(1'b0),
        .hsdp_xpipe2_rx_datavalid(1'b0),
        .hsdp_xpipe2_rx_header({1'b0,1'b0}),
        .hsdp_xpipe2_rx_headervalid(1'b0),
        .hsdp_xpipe2_rx_resetdone(1'b0),
        .hsdp_xpipe2_tx_resetdone(1'b0),
        .link0_xpipe_bufgtce(1'b0),
        .link0_xpipe_bufgtcemask({1'b0,1'b0,1'b0,1'b0}),
        .link0_xpipe_bufgtdiv({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .link0_xpipe_bufgtrst(1'b0),
        .link0_xpipe_bufgtrstmask({1'b0,1'b0,1'b0,1'b0}),
        .link0_xpipe_gtoutclk(1'b0),
        .link0_xpipe_phyready(1'b0),
        .link1_xpipe_bufgtce(1'b0),
        .link1_xpipe_bufgtcemask({1'b0,1'b0,1'b0,1'b0}),
        .link1_xpipe_bufgtdiv({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .link1_xpipe_bufgtrst(1'b0),
        .link1_xpipe_bufgtrstmask({1'b0,1'b0,1'b0,1'b0}),
        .link1_xpipe_gtoutclk(1'b0),
        .link1_xpipe_phyready(1'b0),
        .m_axi0_ps_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_arburst({1'b0,1'b0}),
        .m_axi0_ps_arcache({1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_arid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_arlock(1'b0),
        .m_axi0_ps_arprot({1'b0,1'b0,1'b0}),
        .m_axi0_ps_arqos({1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_arregion({1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_arsize({1'b0,1'b0,1'b0}),
        .m_axi0_ps_aruser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_arvalid(1'b0),
        .m_axi0_ps_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_awburst({1'b0,1'b0}),
        .m_axi0_ps_awcache({1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_awid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_awlock(1'b0),
        .m_axi0_ps_awprot({1'b0,1'b0,1'b0}),
        .m_axi0_ps_awqos({1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_awregion({1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_awsize({1'b0,1'b0,1'b0}),
        .m_axi0_ps_awuser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_awvalid(1'b0),
        .m_axi0_ps_bready(1'b0),
        .m_axi0_ps_rready(1'b0),
        .m_axi0_ps_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_wid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_wlast(1'b0),
        .m_axi0_ps_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_wuser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi0_ps_wvalid(1'b0),
        .m_axi1_ps_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_arburst({1'b0,1'b0}),
        .m_axi1_ps_arcache({1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_arid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_arlock(1'b0),
        .m_axi1_ps_arprot({1'b0,1'b0,1'b0}),
        .m_axi1_ps_arqos({1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_arregion({1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_arsize({1'b0,1'b0,1'b0}),
        .m_axi1_ps_aruser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_arvalid(1'b0),
        .m_axi1_ps_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_awburst({1'b0,1'b0}),
        .m_axi1_ps_awcache({1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_awid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_awlock(1'b0),
        .m_axi1_ps_awprot({1'b0,1'b0,1'b0}),
        .m_axi1_ps_awqos({1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_awregion({1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_awsize({1'b0,1'b0,1'b0}),
        .m_axi1_ps_awuser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_awvalid(1'b0),
        .m_axi1_ps_bready(1'b0),
        .m_axi1_ps_rready(1'b0),
        .m_axi1_ps_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_wid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_wlast(1'b0),
        .m_axi1_ps_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_wuser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi1_ps_wvalid(1'b0),
        .m_axi_fpd_aclk(m_axi_fpd_aclk_1),
        .m_axi_fpd_araddr(pspmc_0_M_AXI_FPD_ARADDR),
        .m_axi_fpd_arburst(pspmc_0_M_AXI_FPD_ARBURST),
        .m_axi_fpd_arcache(pspmc_0_M_AXI_FPD_ARCACHE),
        .m_axi_fpd_arid(pspmc_0_M_AXI_FPD_ARID),
        .m_axi_fpd_arlen(pspmc_0_M_AXI_FPD_ARLEN),
        .m_axi_fpd_arlock(pspmc_0_M_AXI_FPD_ARLOCK),
        .m_axi_fpd_arprot(pspmc_0_M_AXI_FPD_ARPROT),
        .m_axi_fpd_arqos(pspmc_0_M_AXI_FPD_ARQOS),
        .m_axi_fpd_arready(pspmc_0_M_AXI_FPD_ARREADY),
        .m_axi_fpd_arsize(pspmc_0_M_AXI_FPD_ARSIZE),
        .m_axi_fpd_aruser(pspmc_0_M_AXI_FPD_ARUSER),
        .m_axi_fpd_arvalid(pspmc_0_M_AXI_FPD_ARVALID),
        .m_axi_fpd_awaddr(pspmc_0_M_AXI_FPD_AWADDR),
        .m_axi_fpd_awburst(pspmc_0_M_AXI_FPD_AWBURST),
        .m_axi_fpd_awcache(pspmc_0_M_AXI_FPD_AWCACHE),
        .m_axi_fpd_awid(pspmc_0_M_AXI_FPD_AWID),
        .m_axi_fpd_awlen(pspmc_0_M_AXI_FPD_AWLEN),
        .m_axi_fpd_awlock(pspmc_0_M_AXI_FPD_AWLOCK),
        .m_axi_fpd_awprot(pspmc_0_M_AXI_FPD_AWPROT),
        .m_axi_fpd_awqos(pspmc_0_M_AXI_FPD_AWQOS),
        .m_axi_fpd_awready(pspmc_0_M_AXI_FPD_AWREADY),
        .m_axi_fpd_awsize(pspmc_0_M_AXI_FPD_AWSIZE),
        .m_axi_fpd_awuser(pspmc_0_M_AXI_FPD_AWUSER),
        .m_axi_fpd_awvalid(pspmc_0_M_AXI_FPD_AWVALID),
        .m_axi_fpd_bid(pspmc_0_M_AXI_FPD_BID),
        .m_axi_fpd_bready(pspmc_0_M_AXI_FPD_BREADY),
        .m_axi_fpd_bresp(pspmc_0_M_AXI_FPD_BRESP),
        .m_axi_fpd_bvalid(pspmc_0_M_AXI_FPD_BVALID),
        .m_axi_fpd_rdata(pspmc_0_M_AXI_FPD_RDATA),
        .m_axi_fpd_rid(pspmc_0_M_AXI_FPD_RID),
        .m_axi_fpd_rlast(pspmc_0_M_AXI_FPD_RLAST),
        .m_axi_fpd_rready(pspmc_0_M_AXI_FPD_RREADY),
        .m_axi_fpd_rresp(pspmc_0_M_AXI_FPD_RRESP),
        .m_axi_fpd_rvalid(pspmc_0_M_AXI_FPD_RVALID),
        .m_axi_fpd_wdata(pspmc_0_M_AXI_FPD_WDATA),
        .m_axi_fpd_wlast(pspmc_0_M_AXI_FPD_WLAST),
        .m_axi_fpd_wready(pspmc_0_M_AXI_FPD_WREADY),
        .m_axi_fpd_wstrb(pspmc_0_M_AXI_FPD_WSTRB),
        .m_axi_fpd_wvalid(pspmc_0_M_AXI_FPD_WVALID),
        .phy_ready_tobot(1'b0),
        .pl0_ref_clk(pspmc_0_pl0_ref_clk),
        .pl0_resetn(pspmc_0_pl0_resetn),
        .pmc_iro_clk(pspmc_0_pmc_iro_clk),
        .s_axi_cfg_arready(1'b0),
        .s_axi_cfg_awready(1'b0),
        .s_axi_cfg_bid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_cfg_bresp({1'b0,1'b0}),
        .s_axi_cfg_buser(1'b0),
        .s_axi_cfg_bvalid(1'b0),
        .s_axi_cfg_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_cfg_rid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_cfg_rlast(1'b0),
        .s_axi_cfg_rresp({1'b0,1'b0}),
        .s_axi_cfg_ruser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_cfg_rvalid(1'b0),
        .s_axi_cfg_wready(1'b0),
        .s_axi_pcie_arready(1'b0),
        .s_axi_pcie_awready(1'b0),
        .s_axi_pcie_bid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_pcie_bresp({1'b0,1'b0}),
        .s_axi_pcie_buser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_pcie_bvalid(1'b0),
        .s_axi_pcie_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_pcie_rid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_pcie_rlast(1'b0),
        .s_axi_pcie_rresp({1'b0,1'b0}),
        .s_axi_pcie_ruser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_pcie_rvalid(1'b0),
        .s_axi_pcie_wready(1'b0),
        .xpipe0_rx_charisk({1'b0,1'b0}),
        .xpipe0_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe0_rx_datavalid(1'b0),
        .xpipe0_rx_elecidle(1'b0),
        .xpipe0_rx_startblock(1'b0),
        .xpipe0_rx_status({1'b0,1'b0,1'b0}),
        .xpipe0_rx_syncheader({1'b0,1'b0}),
        .xpipe0_rx_valid(1'b0),
        .xpipe10_phystatus(1'b0),
        .xpipe10_rx_charisk({1'b0,1'b0}),
        .xpipe10_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe10_rx_datavalid(1'b0),
        .xpipe10_rx_elecidle(1'b0),
        .xpipe10_rx_startblock(1'b0),
        .xpipe10_rx_status({1'b0,1'b0,1'b0}),
        .xpipe10_rx_syncheader({1'b0,1'b0}),
        .xpipe10_rx_valid(1'b0),
        .xpipe11_phystatus(1'b0),
        .xpipe11_rx_charisk({1'b0,1'b0}),
        .xpipe11_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe11_rx_datavalid(1'b0),
        .xpipe11_rx_elecidle(1'b0),
        .xpipe11_rx_startblock(1'b0),
        .xpipe11_rx_status({1'b0,1'b0,1'b0}),
        .xpipe11_rx_syncheader({1'b0,1'b0}),
        .xpipe11_rx_valid(1'b0),
        .xpipe12_phystatus(1'b0),
        .xpipe12_rx_charisk({1'b0,1'b0}),
        .xpipe12_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe12_rx_datavalid(1'b0),
        .xpipe12_rx_elecidle(1'b0),
        .xpipe12_rx_startblock(1'b0),
        .xpipe12_rx_status({1'b0,1'b0,1'b0}),
        .xpipe12_rx_syncheader({1'b0,1'b0}),
        .xpipe12_rx_valid(1'b0),
        .xpipe13_phystatus(1'b0),
        .xpipe13_rx_charisk({1'b0,1'b0}),
        .xpipe13_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe13_rx_datavalid(1'b0),
        .xpipe13_rx_elecidle(1'b0),
        .xpipe13_rx_startblock(1'b0),
        .xpipe13_rx_status({1'b0,1'b0,1'b0}),
        .xpipe13_rx_syncheader({1'b0,1'b0}),
        .xpipe13_rx_valid(1'b0),
        .xpipe14_phystatus(1'b0),
        .xpipe14_rx_charisk({1'b0,1'b0}),
        .xpipe14_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe14_rx_datavalid(1'b0),
        .xpipe14_rx_elecidle(1'b0),
        .xpipe14_rx_startblock(1'b0),
        .xpipe14_rx_status({1'b0,1'b0,1'b0}),
        .xpipe14_rx_syncheader({1'b0,1'b0}),
        .xpipe14_rx_valid(1'b0),
        .xpipe15_phystatus(1'b0),
        .xpipe15_rx_charisk({1'b0,1'b0}),
        .xpipe15_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe15_rx_datavalid(1'b0),
        .xpipe15_rx_elecidle(1'b0),
        .xpipe15_rx_startblock(1'b0),
        .xpipe15_rx_status({1'b0,1'b0,1'b0}),
        .xpipe15_rx_syncheader({1'b0,1'b0}),
        .xpipe15_rx_valid(1'b0),
        .xpipe1_phystatus(1'b0),
        .xpipe1_rx_charisk({1'b0,1'b0}),
        .xpipe1_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe1_rx_datavalid(1'b0),
        .xpipe1_rx_elecidle(1'b0),
        .xpipe1_rx_startblock(1'b0),
        .xpipe1_rx_status({1'b0,1'b0,1'b0}),
        .xpipe1_rx_syncheader({1'b0,1'b0}),
        .xpipe1_rx_valid(1'b0),
        .xpipe2_phystatus(1'b0),
        .xpipe2_rx_charisk({1'b0,1'b0}),
        .xpipe2_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe2_rx_datavalid(1'b0),
        .xpipe2_rx_elecidle(1'b0),
        .xpipe2_rx_startblock(1'b0),
        .xpipe2_rx_status({1'b0,1'b0,1'b0}),
        .xpipe2_rx_syncheader({1'b0,1'b0}),
        .xpipe2_rx_valid(1'b0),
        .xpipe3_phystatus(1'b0),
        .xpipe3_rx_charisk({1'b0,1'b0}),
        .xpipe3_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe3_rx_datavalid(1'b0),
        .xpipe3_rx_elecidle(1'b0),
        .xpipe3_rx_startblock(1'b0),
        .xpipe3_rx_status({1'b0,1'b0,1'b0}),
        .xpipe3_rx_syncheader({1'b0,1'b0}),
        .xpipe3_rx_valid(1'b0),
        .xpipe4_phystatus(1'b0),
        .xpipe4_rx_charisk({1'b0,1'b0}),
        .xpipe4_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe4_rx_datavalid(1'b0),
        .xpipe4_rx_elecidle(1'b0),
        .xpipe4_rx_startblock(1'b0),
        .xpipe4_rx_status({1'b0,1'b0,1'b0}),
        .xpipe4_rx_syncheader({1'b0,1'b0}),
        .xpipe4_rx_valid(1'b0),
        .xpipe5_phystatus(1'b0),
        .xpipe5_rx_charisk({1'b0,1'b0}),
        .xpipe5_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe5_rx_datavalid(1'b0),
        .xpipe5_rx_elecidle(1'b0),
        .xpipe5_rx_startblock(1'b0),
        .xpipe5_rx_status({1'b0,1'b0,1'b0}),
        .xpipe5_rx_syncheader({1'b0,1'b0}),
        .xpipe5_rx_valid(1'b0),
        .xpipe6_phystatus(1'b0),
        .xpipe6_rx_charisk({1'b0,1'b0}),
        .xpipe6_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe6_rx_datavalid(1'b0),
        .xpipe6_rx_elecidle(1'b0),
        .xpipe6_rx_startblock(1'b0),
        .xpipe6_rx_status({1'b0,1'b0,1'b0}),
        .xpipe6_rx_syncheader({1'b0,1'b0}),
        .xpipe6_rx_valid(1'b0),
        .xpipe7_phystatus(1'b0),
        .xpipe7_rx_charisk({1'b0,1'b0}),
        .xpipe7_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe7_rx_datavalid(1'b0),
        .xpipe7_rx_elecidle(1'b0),
        .xpipe7_rx_startblock(1'b0),
        .xpipe7_rx_status({1'b0,1'b0,1'b0}),
        .xpipe7_rx_syncheader({1'b0,1'b0}),
        .xpipe7_rx_valid(1'b0),
        .xpipe8_phystatus(1'b0),
        .xpipe8_rx_charisk({1'b0,1'b0}),
        .xpipe8_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe8_rx_datavalid(1'b0),
        .xpipe8_rx_elecidle(1'b0),
        .xpipe8_rx_startblock(1'b0),
        .xpipe8_rx_status({1'b0,1'b0,1'b0}),
        .xpipe8_rx_syncheader({1'b0,1'b0}),
        .xpipe8_rx_valid(1'b0),
        .xpipe9_phystatus(1'b0),
        .xpipe9_rx_charisk({1'b0,1'b0}),
        .xpipe9_rx_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe9_rx_datavalid(1'b0),
        .xpipe9_rx_elecidle(1'b0),
        .xpipe9_rx_startblock(1'b0),
        .xpipe9_rx_status({1'b0,1'b0,1'b0}),
        .xpipe9_rx_syncheader({1'b0,1'b0}),
        .xpipe9_rx_valid(1'b0),
        .xpipe_q0_rxmargin_req_ack(1'b0),
        .xpipe_q0_rxmargin_res_cmd({1'b0,1'b0,1'b0,1'b0}),
        .xpipe_q0_rxmargin_res_lanenum({1'b0,1'b0}),
        .xpipe_q0_rxmargin_res_payload({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe_q0_rxmargin_res_req(1'b0),
        .xpipe_q1_rxmargin_req_ack(1'b0),
        .xpipe_q1_rxmargin_res_cmd({1'b0,1'b0,1'b0,1'b0}),
        .xpipe_q1_rxmargin_res_lanenum({1'b0,1'b0}),
        .xpipe_q1_rxmargin_res_payload({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe_q1_rxmargin_res_req(1'b0),
        .xpipe_q2_rxmargin_req_ack(1'b0),
        .xpipe_q2_rxmargin_res_cmd({1'b0,1'b0,1'b0,1'b0}),
        .xpipe_q2_rxmargin_res_lanenum({1'b0,1'b0}),
        .xpipe_q2_rxmargin_res_payload({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe_q2_rxmargin_res_req(1'b0),
        .xpipe_q3_rxmargin_req_ack(1'b0),
        .xpipe_q3_rxmargin_res_cmd({1'b0,1'b0,1'b0,1'b0}),
        .xpipe_q3_rxmargin_res_lanenum({1'b0,1'b0}),
        .xpipe_q3_rxmargin_res_payload({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .xpipe_q3_rxmargin_res_req(1'b0));
endmodule
