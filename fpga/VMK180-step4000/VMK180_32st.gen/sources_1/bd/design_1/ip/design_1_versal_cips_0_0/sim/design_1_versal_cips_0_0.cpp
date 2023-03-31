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


#include "design_1_versal_cips_0_0_sc.h"

#include "design_1_versal_cips_0_0.h"

#include "versal_cips_v3_1_0_tlm.h"

#include <map>
#include <string>





#ifdef XILINX_SIMULATOR
design_1_versal_cips_0_0::design_1_versal_cips_0_0(const sc_core::sc_module_name& nm) : design_1_versal_cips_0_0_sc(nm), pl0_ref_clk("pl0_ref_clk"), pmc_iro_clk("pmc_iro_clk"), pl0_resetn("pl0_resetn"), m_axi_fpd_aclk("m_axi_fpd_aclk"), M_AXI_FPD_awid("M_AXI_FPD_awid"), M_AXI_FPD_awaddr("M_AXI_FPD_awaddr"), M_AXI_FPD_awlen("M_AXI_FPD_awlen"), M_AXI_FPD_awsize("M_AXI_FPD_awsize"), M_AXI_FPD_awburst("M_AXI_FPD_awburst"), M_AXI_FPD_awlock("M_AXI_FPD_awlock"), M_AXI_FPD_awcache("M_AXI_FPD_awcache"), M_AXI_FPD_awprot("M_AXI_FPD_awprot"), M_AXI_FPD_awvalid("M_AXI_FPD_awvalid"), M_AXI_FPD_awuser("M_AXI_FPD_awuser"), M_AXI_FPD_awready("M_AXI_FPD_awready"), M_AXI_FPD_wlast("M_AXI_FPD_wlast"), M_AXI_FPD_wvalid("M_AXI_FPD_wvalid"), M_AXI_FPD_wready("M_AXI_FPD_wready"), M_AXI_FPD_bid("M_AXI_FPD_bid"), M_AXI_FPD_bresp("M_AXI_FPD_bresp"), M_AXI_FPD_bvalid("M_AXI_FPD_bvalid"), M_AXI_FPD_bready("M_AXI_FPD_bready"), M_AXI_FPD_arid("M_AXI_FPD_arid"), M_AXI_FPD_araddr("M_AXI_FPD_araddr"), M_AXI_FPD_arlen("M_AXI_FPD_arlen"), M_AXI_FPD_arsize("M_AXI_FPD_arsize"), M_AXI_FPD_arburst("M_AXI_FPD_arburst"), M_AXI_FPD_arlock("M_AXI_FPD_arlock"), M_AXI_FPD_arcache("M_AXI_FPD_arcache"), M_AXI_FPD_arprot("M_AXI_FPD_arprot"), M_AXI_FPD_arvalid("M_AXI_FPD_arvalid"), M_AXI_FPD_aruser("M_AXI_FPD_aruser"), M_AXI_FPD_arready("M_AXI_FPD_arready"), M_AXI_FPD_rid("M_AXI_FPD_rid"), M_AXI_FPD_rresp("M_AXI_FPD_rresp"), M_AXI_FPD_rlast("M_AXI_FPD_rlast"), M_AXI_FPD_rvalid("M_AXI_FPD_rvalid"), M_AXI_FPD_rready("M_AXI_FPD_rready"), M_AXI_FPD_awqos("M_AXI_FPD_awqos"), M_AXI_FPD_arqos("M_AXI_FPD_arqos"), M_AXI_FPD_wdata("M_AXI_FPD_wdata"), M_AXI_FPD_wstrb("M_AXI_FPD_wstrb"), M_AXI_FPD_rdata("M_AXI_FPD_rdata")
{

  // initialize pins
  mp_impl->pl0_ref_clk(pl0_ref_clk);
  mp_impl->pmc_iro_clk(pmc_iro_clk);
  mp_impl->pl0_resetn(pl0_resetn);
  mp_impl->m_axi_fpd_aclk(m_axi_fpd_aclk);

  // initialize transactors
  mp_M_AXI_FPD_transactor = NULL;

  // initialize socket stubs

}

void design_1_versal_cips_0_0::before_end_of_elaboration()
{
  // configure 'M_AXI_FPD' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("design_1_versal_cips_0_0", "M_AXI_FPD_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M_AXI_FPD' transactor parameters
    xsc::common_cpp::properties M_AXI_FPD_transactor_param_props;
    M_AXI_FPD_transactor_param_props.addLong("DATA_WIDTH", "128");
    M_AXI_FPD_transactor_param_props.addLong("FREQ_HZ", "299996999");
    M_AXI_FPD_transactor_param_props.addLong("ID_WIDTH", "16");
    M_AXI_FPD_transactor_param_props.addLong("ADDR_WIDTH", "44");
    M_AXI_FPD_transactor_param_props.addLong("AWUSER_WIDTH", "16");
    M_AXI_FPD_transactor_param_props.addLong("ARUSER_WIDTH", "16");
    M_AXI_FPD_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M_AXI_FPD_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M_AXI_FPD_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M_AXI_FPD_transactor_param_props.addLong("HAS_BURST", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_LOCK", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_PROT", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_CACHE", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_QOS", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_REGION", "0");
    M_AXI_FPD_transactor_param_props.addLong("HAS_WSTRB", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_BRESP", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_RRESP", "1");
    M_AXI_FPD_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    M_AXI_FPD_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    M_AXI_FPD_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    M_AXI_FPD_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    M_AXI_FPD_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M_AXI_FPD_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M_AXI_FPD_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M_AXI_FPD_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M_AXI_FPD_transactor_param_props.addLong("HAS_SIZE", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_RESET", "1");
    M_AXI_FPD_transactor_param_props.addFloat("PHASE", "0.0");
    M_AXI_FPD_transactor_param_props.addString("PROTOCOL", "AXI4");
    M_AXI_FPD_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M_AXI_FPD_transactor_param_props.addString("CLK_DOMAIN", "design_1_clk_wizard_0_0_clk_out1");
    M_AXI_FPD_transactor_param_props.addString("CATEGORY", "pl");
    M_AXI_FPD_transactor_param_props.addString("MY_CATEGORY", "ps");

    mp_M_AXI_FPD_transactor = new xtlm::xaximm_xtlm2pin_t<128,44,16,16,1,1,16,1>("M_AXI_FPD_transactor", M_AXI_FPD_transactor_param_props);

    // M_AXI_FPD' transactor ports

    mp_M_AXI_FPD_transactor->AWID(M_AXI_FPD_awid);
    mp_M_AXI_FPD_transactor->AWADDR(M_AXI_FPD_awaddr);
    mp_M_AXI_FPD_transactor->AWLEN(M_AXI_FPD_awlen);
    mp_M_AXI_FPD_transactor->AWSIZE(M_AXI_FPD_awsize);
    mp_M_AXI_FPD_transactor->AWBURST(M_AXI_FPD_awburst);
    mp_M_AXI_FPD_transactor->AWLOCK(M_AXI_FPD_awlock);
    mp_M_AXI_FPD_transactor->AWCACHE(M_AXI_FPD_awcache);
    mp_M_AXI_FPD_transactor->AWPROT(M_AXI_FPD_awprot);
    mp_M_AXI_FPD_transactor->AWVALID(M_AXI_FPD_awvalid);
    mp_M_AXI_FPD_transactor->AWUSER(M_AXI_FPD_awuser);
    mp_M_AXI_FPD_transactor->AWREADY(M_AXI_FPD_awready);
    mp_M_AXI_FPD_transactor->WLAST(M_AXI_FPD_wlast);
    mp_M_AXI_FPD_transactor->WVALID(M_AXI_FPD_wvalid);
    mp_M_AXI_FPD_transactor->WREADY(M_AXI_FPD_wready);
    mp_M_AXI_FPD_transactor->BID(M_AXI_FPD_bid);
    mp_M_AXI_FPD_transactor->BRESP(M_AXI_FPD_bresp);
    mp_M_AXI_FPD_transactor->BVALID(M_AXI_FPD_bvalid);
    mp_M_AXI_FPD_transactor->BREADY(M_AXI_FPD_bready);
    mp_M_AXI_FPD_transactor->ARID(M_AXI_FPD_arid);
    mp_M_AXI_FPD_transactor->ARADDR(M_AXI_FPD_araddr);
    mp_M_AXI_FPD_transactor->ARLEN(M_AXI_FPD_arlen);
    mp_M_AXI_FPD_transactor->ARSIZE(M_AXI_FPD_arsize);
    mp_M_AXI_FPD_transactor->ARBURST(M_AXI_FPD_arburst);
    mp_M_AXI_FPD_transactor->ARLOCK(M_AXI_FPD_arlock);
    mp_M_AXI_FPD_transactor->ARCACHE(M_AXI_FPD_arcache);
    mp_M_AXI_FPD_transactor->ARPROT(M_AXI_FPD_arprot);
    mp_M_AXI_FPD_transactor->ARVALID(M_AXI_FPD_arvalid);
    mp_M_AXI_FPD_transactor->ARUSER(M_AXI_FPD_aruser);
    mp_M_AXI_FPD_transactor->ARREADY(M_AXI_FPD_arready);
    mp_M_AXI_FPD_transactor->RID(M_AXI_FPD_rid);
    mp_M_AXI_FPD_transactor->RRESP(M_AXI_FPD_rresp);
    mp_M_AXI_FPD_transactor->RLAST(M_AXI_FPD_rlast);
    mp_M_AXI_FPD_transactor->RVALID(M_AXI_FPD_rvalid);
    mp_M_AXI_FPD_transactor->RREADY(M_AXI_FPD_rready);
    mp_M_AXI_FPD_transactor->AWQOS(M_AXI_FPD_awqos);
    mp_M_AXI_FPD_transactor->ARQOS(M_AXI_FPD_arqos);
    mp_M_AXI_FPD_transactor->WDATA(M_AXI_FPD_wdata);
    mp_M_AXI_FPD_transactor->WSTRB(M_AXI_FPD_wstrb);
    mp_M_AXI_FPD_transactor->RDATA(M_AXI_FPD_rdata);
    mp_M_AXI_FPD_transactor->CLK(m_axi_fpd_aclk);
    mp_M_AXI_FPD_transactor->RST(pl0_resetn);

    // M_AXI_FPD' transactor sockets

    mp_impl->M_AXI_FPD_tlm_aximm_read_socket->bind(*(mp_M_AXI_FPD_transactor->rd_socket));
    mp_impl->M_AXI_FPD_tlm_aximm_write_socket->bind(*(mp_M_AXI_FPD_transactor->wr_socket));
  }
  else
  {
  }

}

#endif // XILINX_SIMULATOR




#ifdef XM_SYSTEMC
design_1_versal_cips_0_0::design_1_versal_cips_0_0(const sc_core::sc_module_name& nm) : design_1_versal_cips_0_0_sc(nm), pl0_ref_clk("pl0_ref_clk"), pmc_iro_clk("pmc_iro_clk"), pl0_resetn("pl0_resetn"), m_axi_fpd_aclk("m_axi_fpd_aclk"), M_AXI_FPD_awid("M_AXI_FPD_awid"), M_AXI_FPD_awaddr("M_AXI_FPD_awaddr"), M_AXI_FPD_awlen("M_AXI_FPD_awlen"), M_AXI_FPD_awsize("M_AXI_FPD_awsize"), M_AXI_FPD_awburst("M_AXI_FPD_awburst"), M_AXI_FPD_awlock("M_AXI_FPD_awlock"), M_AXI_FPD_awcache("M_AXI_FPD_awcache"), M_AXI_FPD_awprot("M_AXI_FPD_awprot"), M_AXI_FPD_awvalid("M_AXI_FPD_awvalid"), M_AXI_FPD_awuser("M_AXI_FPD_awuser"), M_AXI_FPD_awready("M_AXI_FPD_awready"), M_AXI_FPD_wlast("M_AXI_FPD_wlast"), M_AXI_FPD_wvalid("M_AXI_FPD_wvalid"), M_AXI_FPD_wready("M_AXI_FPD_wready"), M_AXI_FPD_bid("M_AXI_FPD_bid"), M_AXI_FPD_bresp("M_AXI_FPD_bresp"), M_AXI_FPD_bvalid("M_AXI_FPD_bvalid"), M_AXI_FPD_bready("M_AXI_FPD_bready"), M_AXI_FPD_arid("M_AXI_FPD_arid"), M_AXI_FPD_araddr("M_AXI_FPD_araddr"), M_AXI_FPD_arlen("M_AXI_FPD_arlen"), M_AXI_FPD_arsize("M_AXI_FPD_arsize"), M_AXI_FPD_arburst("M_AXI_FPD_arburst"), M_AXI_FPD_arlock("M_AXI_FPD_arlock"), M_AXI_FPD_arcache("M_AXI_FPD_arcache"), M_AXI_FPD_arprot("M_AXI_FPD_arprot"), M_AXI_FPD_arvalid("M_AXI_FPD_arvalid"), M_AXI_FPD_aruser("M_AXI_FPD_aruser"), M_AXI_FPD_arready("M_AXI_FPD_arready"), M_AXI_FPD_rid("M_AXI_FPD_rid"), M_AXI_FPD_rresp("M_AXI_FPD_rresp"), M_AXI_FPD_rlast("M_AXI_FPD_rlast"), M_AXI_FPD_rvalid("M_AXI_FPD_rvalid"), M_AXI_FPD_rready("M_AXI_FPD_rready"), M_AXI_FPD_awqos("M_AXI_FPD_awqos"), M_AXI_FPD_arqos("M_AXI_FPD_arqos"), M_AXI_FPD_wdata("M_AXI_FPD_wdata"), M_AXI_FPD_wstrb("M_AXI_FPD_wstrb"), M_AXI_FPD_rdata("M_AXI_FPD_rdata")
{

  // initialize pins
  mp_impl->pl0_ref_clk(pl0_ref_clk);
  mp_impl->pmc_iro_clk(pmc_iro_clk);
  mp_impl->pl0_resetn(pl0_resetn);
  mp_impl->m_axi_fpd_aclk(m_axi_fpd_aclk);

  // initialize transactors
  mp_M_AXI_FPD_transactor = NULL;

  // initialize socket stubs

}

void design_1_versal_cips_0_0::before_end_of_elaboration()
{
  // configure 'M_AXI_FPD' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("design_1_versal_cips_0_0", "M_AXI_FPD_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M_AXI_FPD' transactor parameters
    xsc::common_cpp::properties M_AXI_FPD_transactor_param_props;
    M_AXI_FPD_transactor_param_props.addLong("DATA_WIDTH", "128");
    M_AXI_FPD_transactor_param_props.addLong("FREQ_HZ", "299996999");
    M_AXI_FPD_transactor_param_props.addLong("ID_WIDTH", "16");
    M_AXI_FPD_transactor_param_props.addLong("ADDR_WIDTH", "44");
    M_AXI_FPD_transactor_param_props.addLong("AWUSER_WIDTH", "16");
    M_AXI_FPD_transactor_param_props.addLong("ARUSER_WIDTH", "16");
    M_AXI_FPD_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M_AXI_FPD_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M_AXI_FPD_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M_AXI_FPD_transactor_param_props.addLong("HAS_BURST", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_LOCK", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_PROT", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_CACHE", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_QOS", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_REGION", "0");
    M_AXI_FPD_transactor_param_props.addLong("HAS_WSTRB", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_BRESP", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_RRESP", "1");
    M_AXI_FPD_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    M_AXI_FPD_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    M_AXI_FPD_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    M_AXI_FPD_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    M_AXI_FPD_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M_AXI_FPD_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M_AXI_FPD_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M_AXI_FPD_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M_AXI_FPD_transactor_param_props.addLong("HAS_SIZE", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_RESET", "1");
    M_AXI_FPD_transactor_param_props.addFloat("PHASE", "0.0");
    M_AXI_FPD_transactor_param_props.addString("PROTOCOL", "AXI4");
    M_AXI_FPD_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M_AXI_FPD_transactor_param_props.addString("CLK_DOMAIN", "design_1_clk_wizard_0_0_clk_out1");
    M_AXI_FPD_transactor_param_props.addString("CATEGORY", "pl");
    M_AXI_FPD_transactor_param_props.addString("MY_CATEGORY", "ps");

    mp_M_AXI_FPD_transactor = new xtlm::xaximm_xtlm2pin_t<128,44,16,16,1,1,16,1>("M_AXI_FPD_transactor", M_AXI_FPD_transactor_param_props);

    // M_AXI_FPD' transactor ports

    mp_M_AXI_FPD_transactor->AWID(M_AXI_FPD_awid);
    mp_M_AXI_FPD_transactor->AWADDR(M_AXI_FPD_awaddr);
    mp_M_AXI_FPD_transactor->AWLEN(M_AXI_FPD_awlen);
    mp_M_AXI_FPD_transactor->AWSIZE(M_AXI_FPD_awsize);
    mp_M_AXI_FPD_transactor->AWBURST(M_AXI_FPD_awburst);
    mp_M_AXI_FPD_transactor->AWLOCK(M_AXI_FPD_awlock);
    mp_M_AXI_FPD_transactor->AWCACHE(M_AXI_FPD_awcache);
    mp_M_AXI_FPD_transactor->AWPROT(M_AXI_FPD_awprot);
    mp_M_AXI_FPD_transactor->AWVALID(M_AXI_FPD_awvalid);
    mp_M_AXI_FPD_transactor->AWUSER(M_AXI_FPD_awuser);
    mp_M_AXI_FPD_transactor->AWREADY(M_AXI_FPD_awready);
    mp_M_AXI_FPD_transactor->WLAST(M_AXI_FPD_wlast);
    mp_M_AXI_FPD_transactor->WVALID(M_AXI_FPD_wvalid);
    mp_M_AXI_FPD_transactor->WREADY(M_AXI_FPD_wready);
    mp_M_AXI_FPD_transactor->BID(M_AXI_FPD_bid);
    mp_M_AXI_FPD_transactor->BRESP(M_AXI_FPD_bresp);
    mp_M_AXI_FPD_transactor->BVALID(M_AXI_FPD_bvalid);
    mp_M_AXI_FPD_transactor->BREADY(M_AXI_FPD_bready);
    mp_M_AXI_FPD_transactor->ARID(M_AXI_FPD_arid);
    mp_M_AXI_FPD_transactor->ARADDR(M_AXI_FPD_araddr);
    mp_M_AXI_FPD_transactor->ARLEN(M_AXI_FPD_arlen);
    mp_M_AXI_FPD_transactor->ARSIZE(M_AXI_FPD_arsize);
    mp_M_AXI_FPD_transactor->ARBURST(M_AXI_FPD_arburst);
    mp_M_AXI_FPD_transactor->ARLOCK(M_AXI_FPD_arlock);
    mp_M_AXI_FPD_transactor->ARCACHE(M_AXI_FPD_arcache);
    mp_M_AXI_FPD_transactor->ARPROT(M_AXI_FPD_arprot);
    mp_M_AXI_FPD_transactor->ARVALID(M_AXI_FPD_arvalid);
    mp_M_AXI_FPD_transactor->ARUSER(M_AXI_FPD_aruser);
    mp_M_AXI_FPD_transactor->ARREADY(M_AXI_FPD_arready);
    mp_M_AXI_FPD_transactor->RID(M_AXI_FPD_rid);
    mp_M_AXI_FPD_transactor->RRESP(M_AXI_FPD_rresp);
    mp_M_AXI_FPD_transactor->RLAST(M_AXI_FPD_rlast);
    mp_M_AXI_FPD_transactor->RVALID(M_AXI_FPD_rvalid);
    mp_M_AXI_FPD_transactor->RREADY(M_AXI_FPD_rready);
    mp_M_AXI_FPD_transactor->AWQOS(M_AXI_FPD_awqos);
    mp_M_AXI_FPD_transactor->ARQOS(M_AXI_FPD_arqos);
    mp_M_AXI_FPD_transactor->WDATA(M_AXI_FPD_wdata);
    mp_M_AXI_FPD_transactor->WSTRB(M_AXI_FPD_wstrb);
    mp_M_AXI_FPD_transactor->RDATA(M_AXI_FPD_rdata);
    mp_M_AXI_FPD_transactor->CLK(m_axi_fpd_aclk);
    mp_M_AXI_FPD_transactor->RST(pl0_resetn);

    // M_AXI_FPD' transactor sockets

    mp_impl->M_AXI_FPD_tlm_aximm_read_socket->bind(*(mp_M_AXI_FPD_transactor->rd_socket));
    mp_impl->M_AXI_FPD_tlm_aximm_write_socket->bind(*(mp_M_AXI_FPD_transactor->wr_socket));
  }
  else
  {
  }

}

#endif // XM_SYSTEMC




#ifdef RIVIERA
design_1_versal_cips_0_0::design_1_versal_cips_0_0(const sc_core::sc_module_name& nm) : design_1_versal_cips_0_0_sc(nm), pl0_ref_clk("pl0_ref_clk"), pmc_iro_clk("pmc_iro_clk"), pl0_resetn("pl0_resetn"), m_axi_fpd_aclk("m_axi_fpd_aclk"), M_AXI_FPD_awid("M_AXI_FPD_awid"), M_AXI_FPD_awaddr("M_AXI_FPD_awaddr"), M_AXI_FPD_awlen("M_AXI_FPD_awlen"), M_AXI_FPD_awsize("M_AXI_FPD_awsize"), M_AXI_FPD_awburst("M_AXI_FPD_awburst"), M_AXI_FPD_awlock("M_AXI_FPD_awlock"), M_AXI_FPD_awcache("M_AXI_FPD_awcache"), M_AXI_FPD_awprot("M_AXI_FPD_awprot"), M_AXI_FPD_awvalid("M_AXI_FPD_awvalid"), M_AXI_FPD_awuser("M_AXI_FPD_awuser"), M_AXI_FPD_awready("M_AXI_FPD_awready"), M_AXI_FPD_wlast("M_AXI_FPD_wlast"), M_AXI_FPD_wvalid("M_AXI_FPD_wvalid"), M_AXI_FPD_wready("M_AXI_FPD_wready"), M_AXI_FPD_bid("M_AXI_FPD_bid"), M_AXI_FPD_bresp("M_AXI_FPD_bresp"), M_AXI_FPD_bvalid("M_AXI_FPD_bvalid"), M_AXI_FPD_bready("M_AXI_FPD_bready"), M_AXI_FPD_arid("M_AXI_FPD_arid"), M_AXI_FPD_araddr("M_AXI_FPD_araddr"), M_AXI_FPD_arlen("M_AXI_FPD_arlen"), M_AXI_FPD_arsize("M_AXI_FPD_arsize"), M_AXI_FPD_arburst("M_AXI_FPD_arburst"), M_AXI_FPD_arlock("M_AXI_FPD_arlock"), M_AXI_FPD_arcache("M_AXI_FPD_arcache"), M_AXI_FPD_arprot("M_AXI_FPD_arprot"), M_AXI_FPD_arvalid("M_AXI_FPD_arvalid"), M_AXI_FPD_aruser("M_AXI_FPD_aruser"), M_AXI_FPD_arready("M_AXI_FPD_arready"), M_AXI_FPD_rid("M_AXI_FPD_rid"), M_AXI_FPD_rresp("M_AXI_FPD_rresp"), M_AXI_FPD_rlast("M_AXI_FPD_rlast"), M_AXI_FPD_rvalid("M_AXI_FPD_rvalid"), M_AXI_FPD_rready("M_AXI_FPD_rready"), M_AXI_FPD_awqos("M_AXI_FPD_awqos"), M_AXI_FPD_arqos("M_AXI_FPD_arqos"), M_AXI_FPD_wdata("M_AXI_FPD_wdata"), M_AXI_FPD_wstrb("M_AXI_FPD_wstrb"), M_AXI_FPD_rdata("M_AXI_FPD_rdata")
{

  // initialize pins
  mp_impl->pl0_ref_clk(pl0_ref_clk);
  mp_impl->pmc_iro_clk(pmc_iro_clk);
  mp_impl->pl0_resetn(pl0_resetn);
  mp_impl->m_axi_fpd_aclk(m_axi_fpd_aclk);

  // initialize transactors
  mp_M_AXI_FPD_transactor = NULL;

  // initialize socket stubs

}

void design_1_versal_cips_0_0::before_end_of_elaboration()
{
  // configure 'M_AXI_FPD' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("design_1_versal_cips_0_0", "M_AXI_FPD_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M_AXI_FPD' transactor parameters
    xsc::common_cpp::properties M_AXI_FPD_transactor_param_props;
    M_AXI_FPD_transactor_param_props.addLong("DATA_WIDTH", "128");
    M_AXI_FPD_transactor_param_props.addLong("FREQ_HZ", "299996999");
    M_AXI_FPD_transactor_param_props.addLong("ID_WIDTH", "16");
    M_AXI_FPD_transactor_param_props.addLong("ADDR_WIDTH", "44");
    M_AXI_FPD_transactor_param_props.addLong("AWUSER_WIDTH", "16");
    M_AXI_FPD_transactor_param_props.addLong("ARUSER_WIDTH", "16");
    M_AXI_FPD_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M_AXI_FPD_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M_AXI_FPD_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M_AXI_FPD_transactor_param_props.addLong("HAS_BURST", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_LOCK", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_PROT", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_CACHE", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_QOS", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_REGION", "0");
    M_AXI_FPD_transactor_param_props.addLong("HAS_WSTRB", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_BRESP", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_RRESP", "1");
    M_AXI_FPD_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    M_AXI_FPD_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    M_AXI_FPD_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    M_AXI_FPD_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    M_AXI_FPD_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M_AXI_FPD_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M_AXI_FPD_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M_AXI_FPD_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M_AXI_FPD_transactor_param_props.addLong("HAS_SIZE", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_RESET", "1");
    M_AXI_FPD_transactor_param_props.addFloat("PHASE", "0.0");
    M_AXI_FPD_transactor_param_props.addString("PROTOCOL", "AXI4");
    M_AXI_FPD_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M_AXI_FPD_transactor_param_props.addString("CLK_DOMAIN", "design_1_clk_wizard_0_0_clk_out1");
    M_AXI_FPD_transactor_param_props.addString("CATEGORY", "pl");
    M_AXI_FPD_transactor_param_props.addString("MY_CATEGORY", "ps");

    mp_M_AXI_FPD_transactor = new xtlm::xaximm_xtlm2pin_t<128,44,16,16,1,1,16,1>("M_AXI_FPD_transactor", M_AXI_FPD_transactor_param_props);

    // M_AXI_FPD' transactor ports

    mp_M_AXI_FPD_transactor->AWID(M_AXI_FPD_awid);
    mp_M_AXI_FPD_transactor->AWADDR(M_AXI_FPD_awaddr);
    mp_M_AXI_FPD_transactor->AWLEN(M_AXI_FPD_awlen);
    mp_M_AXI_FPD_transactor->AWSIZE(M_AXI_FPD_awsize);
    mp_M_AXI_FPD_transactor->AWBURST(M_AXI_FPD_awburst);
    mp_M_AXI_FPD_transactor->AWLOCK(M_AXI_FPD_awlock);
    mp_M_AXI_FPD_transactor->AWCACHE(M_AXI_FPD_awcache);
    mp_M_AXI_FPD_transactor->AWPROT(M_AXI_FPD_awprot);
    mp_M_AXI_FPD_transactor->AWVALID(M_AXI_FPD_awvalid);
    mp_M_AXI_FPD_transactor->AWUSER(M_AXI_FPD_awuser);
    mp_M_AXI_FPD_transactor->AWREADY(M_AXI_FPD_awready);
    mp_M_AXI_FPD_transactor->WLAST(M_AXI_FPD_wlast);
    mp_M_AXI_FPD_transactor->WVALID(M_AXI_FPD_wvalid);
    mp_M_AXI_FPD_transactor->WREADY(M_AXI_FPD_wready);
    mp_M_AXI_FPD_transactor->BID(M_AXI_FPD_bid);
    mp_M_AXI_FPD_transactor->BRESP(M_AXI_FPD_bresp);
    mp_M_AXI_FPD_transactor->BVALID(M_AXI_FPD_bvalid);
    mp_M_AXI_FPD_transactor->BREADY(M_AXI_FPD_bready);
    mp_M_AXI_FPD_transactor->ARID(M_AXI_FPD_arid);
    mp_M_AXI_FPD_transactor->ARADDR(M_AXI_FPD_araddr);
    mp_M_AXI_FPD_transactor->ARLEN(M_AXI_FPD_arlen);
    mp_M_AXI_FPD_transactor->ARSIZE(M_AXI_FPD_arsize);
    mp_M_AXI_FPD_transactor->ARBURST(M_AXI_FPD_arburst);
    mp_M_AXI_FPD_transactor->ARLOCK(M_AXI_FPD_arlock);
    mp_M_AXI_FPD_transactor->ARCACHE(M_AXI_FPD_arcache);
    mp_M_AXI_FPD_transactor->ARPROT(M_AXI_FPD_arprot);
    mp_M_AXI_FPD_transactor->ARVALID(M_AXI_FPD_arvalid);
    mp_M_AXI_FPD_transactor->ARUSER(M_AXI_FPD_aruser);
    mp_M_AXI_FPD_transactor->ARREADY(M_AXI_FPD_arready);
    mp_M_AXI_FPD_transactor->RID(M_AXI_FPD_rid);
    mp_M_AXI_FPD_transactor->RRESP(M_AXI_FPD_rresp);
    mp_M_AXI_FPD_transactor->RLAST(M_AXI_FPD_rlast);
    mp_M_AXI_FPD_transactor->RVALID(M_AXI_FPD_rvalid);
    mp_M_AXI_FPD_transactor->RREADY(M_AXI_FPD_rready);
    mp_M_AXI_FPD_transactor->AWQOS(M_AXI_FPD_awqos);
    mp_M_AXI_FPD_transactor->ARQOS(M_AXI_FPD_arqos);
    mp_M_AXI_FPD_transactor->WDATA(M_AXI_FPD_wdata);
    mp_M_AXI_FPD_transactor->WSTRB(M_AXI_FPD_wstrb);
    mp_M_AXI_FPD_transactor->RDATA(M_AXI_FPD_rdata);
    mp_M_AXI_FPD_transactor->CLK(m_axi_fpd_aclk);
    mp_M_AXI_FPD_transactor->RST(pl0_resetn);

    // M_AXI_FPD' transactor sockets

    mp_impl->M_AXI_FPD_tlm_aximm_read_socket->bind(*(mp_M_AXI_FPD_transactor->rd_socket));
    mp_impl->M_AXI_FPD_tlm_aximm_write_socket->bind(*(mp_M_AXI_FPD_transactor->wr_socket));
  }
  else
  {
  }

}

#endif // RIVIERA




#ifdef VCSSYSTEMC
design_1_versal_cips_0_0::design_1_versal_cips_0_0(const sc_core::sc_module_name& nm) : design_1_versal_cips_0_0_sc(nm),  pl0_ref_clk("pl0_ref_clk"), pmc_iro_clk("pmc_iro_clk"), pl0_resetn("pl0_resetn"), m_axi_fpd_aclk("m_axi_fpd_aclk"), M_AXI_FPD_awid("M_AXI_FPD_awid"), M_AXI_FPD_awaddr("M_AXI_FPD_awaddr"), M_AXI_FPD_awlen("M_AXI_FPD_awlen"), M_AXI_FPD_awsize("M_AXI_FPD_awsize"), M_AXI_FPD_awburst("M_AXI_FPD_awburst"), M_AXI_FPD_awlock("M_AXI_FPD_awlock"), M_AXI_FPD_awcache("M_AXI_FPD_awcache"), M_AXI_FPD_awprot("M_AXI_FPD_awprot"), M_AXI_FPD_awvalid("M_AXI_FPD_awvalid"), M_AXI_FPD_awuser("M_AXI_FPD_awuser"), M_AXI_FPD_awready("M_AXI_FPD_awready"), M_AXI_FPD_wlast("M_AXI_FPD_wlast"), M_AXI_FPD_wvalid("M_AXI_FPD_wvalid"), M_AXI_FPD_wready("M_AXI_FPD_wready"), M_AXI_FPD_bid("M_AXI_FPD_bid"), M_AXI_FPD_bresp("M_AXI_FPD_bresp"), M_AXI_FPD_bvalid("M_AXI_FPD_bvalid"), M_AXI_FPD_bready("M_AXI_FPD_bready"), M_AXI_FPD_arid("M_AXI_FPD_arid"), M_AXI_FPD_araddr("M_AXI_FPD_araddr"), M_AXI_FPD_arlen("M_AXI_FPD_arlen"), M_AXI_FPD_arsize("M_AXI_FPD_arsize"), M_AXI_FPD_arburst("M_AXI_FPD_arburst"), M_AXI_FPD_arlock("M_AXI_FPD_arlock"), M_AXI_FPD_arcache("M_AXI_FPD_arcache"), M_AXI_FPD_arprot("M_AXI_FPD_arprot"), M_AXI_FPD_arvalid("M_AXI_FPD_arvalid"), M_AXI_FPD_aruser("M_AXI_FPD_aruser"), M_AXI_FPD_arready("M_AXI_FPD_arready"), M_AXI_FPD_rid("M_AXI_FPD_rid"), M_AXI_FPD_rresp("M_AXI_FPD_rresp"), M_AXI_FPD_rlast("M_AXI_FPD_rlast"), M_AXI_FPD_rvalid("M_AXI_FPD_rvalid"), M_AXI_FPD_rready("M_AXI_FPD_rready"), M_AXI_FPD_awqos("M_AXI_FPD_awqos"), M_AXI_FPD_arqos("M_AXI_FPD_arqos"), M_AXI_FPD_wdata("M_AXI_FPD_wdata"), M_AXI_FPD_wstrb("M_AXI_FPD_wstrb"), M_AXI_FPD_rdata("M_AXI_FPD_rdata")
{
  // initialize pins
  mp_impl->pl0_ref_clk(pl0_ref_clk);
  mp_impl->pmc_iro_clk(pmc_iro_clk);
  mp_impl->pl0_resetn(pl0_resetn);
  mp_impl->m_axi_fpd_aclk(m_axi_fpd_aclk);

  // initialize transactors
  mp_M_AXI_FPD_transactor = NULL;

  // Instantiate Socket Stubs

  // configure M_AXI_FPD_transactor
    xsc::common_cpp::properties M_AXI_FPD_transactor_param_props;
    M_AXI_FPD_transactor_param_props.addLong("DATA_WIDTH", "128");
    M_AXI_FPD_transactor_param_props.addLong("FREQ_HZ", "299996999");
    M_AXI_FPD_transactor_param_props.addLong("ID_WIDTH", "16");
    M_AXI_FPD_transactor_param_props.addLong("ADDR_WIDTH", "44");
    M_AXI_FPD_transactor_param_props.addLong("AWUSER_WIDTH", "16");
    M_AXI_FPD_transactor_param_props.addLong("ARUSER_WIDTH", "16");
    M_AXI_FPD_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M_AXI_FPD_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M_AXI_FPD_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M_AXI_FPD_transactor_param_props.addLong("HAS_BURST", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_LOCK", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_PROT", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_CACHE", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_QOS", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_REGION", "0");
    M_AXI_FPD_transactor_param_props.addLong("HAS_WSTRB", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_BRESP", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_RRESP", "1");
    M_AXI_FPD_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    M_AXI_FPD_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    M_AXI_FPD_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    M_AXI_FPD_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    M_AXI_FPD_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M_AXI_FPD_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M_AXI_FPD_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M_AXI_FPD_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M_AXI_FPD_transactor_param_props.addLong("HAS_SIZE", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_RESET", "1");
    M_AXI_FPD_transactor_param_props.addFloat("PHASE", "0.0");
    M_AXI_FPD_transactor_param_props.addString("PROTOCOL", "AXI4");
    M_AXI_FPD_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M_AXI_FPD_transactor_param_props.addString("CLK_DOMAIN", "design_1_clk_wizard_0_0_clk_out1");
    M_AXI_FPD_transactor_param_props.addString("CATEGORY", "pl");
    M_AXI_FPD_transactor_param_props.addString("MY_CATEGORY", "ps");

    mp_M_AXI_FPD_transactor = new xtlm::xaximm_xtlm2pin_t<128,44,16,16,1,1,16,1>("M_AXI_FPD_transactor", M_AXI_FPD_transactor_param_props);
  mp_M_AXI_FPD_transactor->AWID(M_AXI_FPD_awid);
  mp_M_AXI_FPD_transactor->AWADDR(M_AXI_FPD_awaddr);
  mp_M_AXI_FPD_transactor->AWLEN(M_AXI_FPD_awlen);
  mp_M_AXI_FPD_transactor->AWSIZE(M_AXI_FPD_awsize);
  mp_M_AXI_FPD_transactor->AWBURST(M_AXI_FPD_awburst);
  mp_M_AXI_FPD_transactor->AWLOCK(M_AXI_FPD_awlock);
  mp_M_AXI_FPD_transactor->AWCACHE(M_AXI_FPD_awcache);
  mp_M_AXI_FPD_transactor->AWPROT(M_AXI_FPD_awprot);
  mp_M_AXI_FPD_transactor->AWVALID(M_AXI_FPD_awvalid);
  mp_M_AXI_FPD_transactor->AWUSER(M_AXI_FPD_awuser);
  mp_M_AXI_FPD_transactor->AWREADY(M_AXI_FPD_awready);
  mp_M_AXI_FPD_transactor->WLAST(M_AXI_FPD_wlast);
  mp_M_AXI_FPD_transactor->WVALID(M_AXI_FPD_wvalid);
  mp_M_AXI_FPD_transactor->WREADY(M_AXI_FPD_wready);
  mp_M_AXI_FPD_transactor->BID(M_AXI_FPD_bid);
  mp_M_AXI_FPD_transactor->BRESP(M_AXI_FPD_bresp);
  mp_M_AXI_FPD_transactor->BVALID(M_AXI_FPD_bvalid);
  mp_M_AXI_FPD_transactor->BREADY(M_AXI_FPD_bready);
  mp_M_AXI_FPD_transactor->ARID(M_AXI_FPD_arid);
  mp_M_AXI_FPD_transactor->ARADDR(M_AXI_FPD_araddr);
  mp_M_AXI_FPD_transactor->ARLEN(M_AXI_FPD_arlen);
  mp_M_AXI_FPD_transactor->ARSIZE(M_AXI_FPD_arsize);
  mp_M_AXI_FPD_transactor->ARBURST(M_AXI_FPD_arburst);
  mp_M_AXI_FPD_transactor->ARLOCK(M_AXI_FPD_arlock);
  mp_M_AXI_FPD_transactor->ARCACHE(M_AXI_FPD_arcache);
  mp_M_AXI_FPD_transactor->ARPROT(M_AXI_FPD_arprot);
  mp_M_AXI_FPD_transactor->ARVALID(M_AXI_FPD_arvalid);
  mp_M_AXI_FPD_transactor->ARUSER(M_AXI_FPD_aruser);
  mp_M_AXI_FPD_transactor->ARREADY(M_AXI_FPD_arready);
  mp_M_AXI_FPD_transactor->RID(M_AXI_FPD_rid);
  mp_M_AXI_FPD_transactor->RRESP(M_AXI_FPD_rresp);
  mp_M_AXI_FPD_transactor->RLAST(M_AXI_FPD_rlast);
  mp_M_AXI_FPD_transactor->RVALID(M_AXI_FPD_rvalid);
  mp_M_AXI_FPD_transactor->RREADY(M_AXI_FPD_rready);
  mp_M_AXI_FPD_transactor->AWQOS(M_AXI_FPD_awqos);
  mp_M_AXI_FPD_transactor->ARQOS(M_AXI_FPD_arqos);
  mp_M_AXI_FPD_transactor->WDATA(M_AXI_FPD_wdata);
  mp_M_AXI_FPD_transactor->WSTRB(M_AXI_FPD_wstrb);
  mp_M_AXI_FPD_transactor->RDATA(M_AXI_FPD_rdata);
  mp_M_AXI_FPD_transactor->CLK(m_axi_fpd_aclk);
  mp_M_AXI_FPD_transactor->RST(pl0_resetn);

  // initialize transactors stubs
  M_AXI_FPD_transactor_initiator_wr_socket_stub = nullptr;
  M_AXI_FPD_transactor_initiator_rd_socket_stub = nullptr;

}

void design_1_versal_cips_0_0::before_end_of_elaboration()
{
  // configure 'M_AXI_FPD' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("design_1_versal_cips_0_0", "M_AXI_FPD_TLM_MODE") != 1)
  {
    mp_impl->M_AXI_FPD_tlm_aximm_read_socket->bind(*(mp_M_AXI_FPD_transactor->rd_socket));
    mp_impl->M_AXI_FPD_tlm_aximm_write_socket->bind(*(mp_M_AXI_FPD_transactor->wr_socket));
  
  }
  else
  {
    M_AXI_FPD_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M_AXI_FPD_transactor_initiator_wr_socket_stub->bind(*(mp_M_AXI_FPD_transactor->wr_socket));
    M_AXI_FPD_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M_AXI_FPD_transactor_initiator_rd_socket_stub->bind(*(mp_M_AXI_FPD_transactor->rd_socket));
    mp_M_AXI_FPD_transactor->disable_transactor();
  }

}

#endif // VCSSYSTEMC




#ifdef MTI_SYSTEMC
design_1_versal_cips_0_0::design_1_versal_cips_0_0(const sc_core::sc_module_name& nm) : design_1_versal_cips_0_0_sc(nm),  pl0_ref_clk("pl0_ref_clk"), pmc_iro_clk("pmc_iro_clk"), pl0_resetn("pl0_resetn"), m_axi_fpd_aclk("m_axi_fpd_aclk"), M_AXI_FPD_awid("M_AXI_FPD_awid"), M_AXI_FPD_awaddr("M_AXI_FPD_awaddr"), M_AXI_FPD_awlen("M_AXI_FPD_awlen"), M_AXI_FPD_awsize("M_AXI_FPD_awsize"), M_AXI_FPD_awburst("M_AXI_FPD_awburst"), M_AXI_FPD_awlock("M_AXI_FPD_awlock"), M_AXI_FPD_awcache("M_AXI_FPD_awcache"), M_AXI_FPD_awprot("M_AXI_FPD_awprot"), M_AXI_FPD_awvalid("M_AXI_FPD_awvalid"), M_AXI_FPD_awuser("M_AXI_FPD_awuser"), M_AXI_FPD_awready("M_AXI_FPD_awready"), M_AXI_FPD_wlast("M_AXI_FPD_wlast"), M_AXI_FPD_wvalid("M_AXI_FPD_wvalid"), M_AXI_FPD_wready("M_AXI_FPD_wready"), M_AXI_FPD_bid("M_AXI_FPD_bid"), M_AXI_FPD_bresp("M_AXI_FPD_bresp"), M_AXI_FPD_bvalid("M_AXI_FPD_bvalid"), M_AXI_FPD_bready("M_AXI_FPD_bready"), M_AXI_FPD_arid("M_AXI_FPD_arid"), M_AXI_FPD_araddr("M_AXI_FPD_araddr"), M_AXI_FPD_arlen("M_AXI_FPD_arlen"), M_AXI_FPD_arsize("M_AXI_FPD_arsize"), M_AXI_FPD_arburst("M_AXI_FPD_arburst"), M_AXI_FPD_arlock("M_AXI_FPD_arlock"), M_AXI_FPD_arcache("M_AXI_FPD_arcache"), M_AXI_FPD_arprot("M_AXI_FPD_arprot"), M_AXI_FPD_arvalid("M_AXI_FPD_arvalid"), M_AXI_FPD_aruser("M_AXI_FPD_aruser"), M_AXI_FPD_arready("M_AXI_FPD_arready"), M_AXI_FPD_rid("M_AXI_FPD_rid"), M_AXI_FPD_rresp("M_AXI_FPD_rresp"), M_AXI_FPD_rlast("M_AXI_FPD_rlast"), M_AXI_FPD_rvalid("M_AXI_FPD_rvalid"), M_AXI_FPD_rready("M_AXI_FPD_rready"), M_AXI_FPD_awqos("M_AXI_FPD_awqos"), M_AXI_FPD_arqos("M_AXI_FPD_arqos"), M_AXI_FPD_wdata("M_AXI_FPD_wdata"), M_AXI_FPD_wstrb("M_AXI_FPD_wstrb"), M_AXI_FPD_rdata("M_AXI_FPD_rdata")
{
  // initialize pins
  mp_impl->pl0_ref_clk(pl0_ref_clk);
  mp_impl->pmc_iro_clk(pmc_iro_clk);
  mp_impl->pl0_resetn(pl0_resetn);
  mp_impl->m_axi_fpd_aclk(m_axi_fpd_aclk);

  // initialize transactors
  mp_M_AXI_FPD_transactor = NULL;

  // Instantiate Socket Stubs

  // configure M_AXI_FPD_transactor
    xsc::common_cpp::properties M_AXI_FPD_transactor_param_props;
    M_AXI_FPD_transactor_param_props.addLong("DATA_WIDTH", "128");
    M_AXI_FPD_transactor_param_props.addLong("FREQ_HZ", "299996999");
    M_AXI_FPD_transactor_param_props.addLong("ID_WIDTH", "16");
    M_AXI_FPD_transactor_param_props.addLong("ADDR_WIDTH", "44");
    M_AXI_FPD_transactor_param_props.addLong("AWUSER_WIDTH", "16");
    M_AXI_FPD_transactor_param_props.addLong("ARUSER_WIDTH", "16");
    M_AXI_FPD_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M_AXI_FPD_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M_AXI_FPD_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M_AXI_FPD_transactor_param_props.addLong("HAS_BURST", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_LOCK", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_PROT", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_CACHE", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_QOS", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_REGION", "0");
    M_AXI_FPD_transactor_param_props.addLong("HAS_WSTRB", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_BRESP", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_RRESP", "1");
    M_AXI_FPD_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    M_AXI_FPD_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "2");
    M_AXI_FPD_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "2");
    M_AXI_FPD_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    M_AXI_FPD_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M_AXI_FPD_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M_AXI_FPD_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M_AXI_FPD_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M_AXI_FPD_transactor_param_props.addLong("HAS_SIZE", "1");
    M_AXI_FPD_transactor_param_props.addLong("HAS_RESET", "1");
    M_AXI_FPD_transactor_param_props.addFloat("PHASE", "0.0");
    M_AXI_FPD_transactor_param_props.addString("PROTOCOL", "AXI4");
    M_AXI_FPD_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M_AXI_FPD_transactor_param_props.addString("CLK_DOMAIN", "design_1_clk_wizard_0_0_clk_out1");
    M_AXI_FPD_transactor_param_props.addString("CATEGORY", "pl");
    M_AXI_FPD_transactor_param_props.addString("MY_CATEGORY", "ps");

    mp_M_AXI_FPD_transactor = new xtlm::xaximm_xtlm2pin_t<128,44,16,16,1,1,16,1>("M_AXI_FPD_transactor", M_AXI_FPD_transactor_param_props);
  mp_M_AXI_FPD_transactor->AWID(M_AXI_FPD_awid);
  mp_M_AXI_FPD_transactor->AWADDR(M_AXI_FPD_awaddr);
  mp_M_AXI_FPD_transactor->AWLEN(M_AXI_FPD_awlen);
  mp_M_AXI_FPD_transactor->AWSIZE(M_AXI_FPD_awsize);
  mp_M_AXI_FPD_transactor->AWBURST(M_AXI_FPD_awburst);
  mp_M_AXI_FPD_transactor->AWLOCK(M_AXI_FPD_awlock);
  mp_M_AXI_FPD_transactor->AWCACHE(M_AXI_FPD_awcache);
  mp_M_AXI_FPD_transactor->AWPROT(M_AXI_FPD_awprot);
  mp_M_AXI_FPD_transactor->AWVALID(M_AXI_FPD_awvalid);
  mp_M_AXI_FPD_transactor->AWUSER(M_AXI_FPD_awuser);
  mp_M_AXI_FPD_transactor->AWREADY(M_AXI_FPD_awready);
  mp_M_AXI_FPD_transactor->WLAST(M_AXI_FPD_wlast);
  mp_M_AXI_FPD_transactor->WVALID(M_AXI_FPD_wvalid);
  mp_M_AXI_FPD_transactor->WREADY(M_AXI_FPD_wready);
  mp_M_AXI_FPD_transactor->BID(M_AXI_FPD_bid);
  mp_M_AXI_FPD_transactor->BRESP(M_AXI_FPD_bresp);
  mp_M_AXI_FPD_transactor->BVALID(M_AXI_FPD_bvalid);
  mp_M_AXI_FPD_transactor->BREADY(M_AXI_FPD_bready);
  mp_M_AXI_FPD_transactor->ARID(M_AXI_FPD_arid);
  mp_M_AXI_FPD_transactor->ARADDR(M_AXI_FPD_araddr);
  mp_M_AXI_FPD_transactor->ARLEN(M_AXI_FPD_arlen);
  mp_M_AXI_FPD_transactor->ARSIZE(M_AXI_FPD_arsize);
  mp_M_AXI_FPD_transactor->ARBURST(M_AXI_FPD_arburst);
  mp_M_AXI_FPD_transactor->ARLOCK(M_AXI_FPD_arlock);
  mp_M_AXI_FPD_transactor->ARCACHE(M_AXI_FPD_arcache);
  mp_M_AXI_FPD_transactor->ARPROT(M_AXI_FPD_arprot);
  mp_M_AXI_FPD_transactor->ARVALID(M_AXI_FPD_arvalid);
  mp_M_AXI_FPD_transactor->ARUSER(M_AXI_FPD_aruser);
  mp_M_AXI_FPD_transactor->ARREADY(M_AXI_FPD_arready);
  mp_M_AXI_FPD_transactor->RID(M_AXI_FPD_rid);
  mp_M_AXI_FPD_transactor->RRESP(M_AXI_FPD_rresp);
  mp_M_AXI_FPD_transactor->RLAST(M_AXI_FPD_rlast);
  mp_M_AXI_FPD_transactor->RVALID(M_AXI_FPD_rvalid);
  mp_M_AXI_FPD_transactor->RREADY(M_AXI_FPD_rready);
  mp_M_AXI_FPD_transactor->AWQOS(M_AXI_FPD_awqos);
  mp_M_AXI_FPD_transactor->ARQOS(M_AXI_FPD_arqos);
  mp_M_AXI_FPD_transactor->WDATA(M_AXI_FPD_wdata);
  mp_M_AXI_FPD_transactor->WSTRB(M_AXI_FPD_wstrb);
  mp_M_AXI_FPD_transactor->RDATA(M_AXI_FPD_rdata);
  mp_M_AXI_FPD_transactor->CLK(m_axi_fpd_aclk);
  mp_M_AXI_FPD_transactor->RST(pl0_resetn);

  // initialize transactors stubs
  M_AXI_FPD_transactor_initiator_wr_socket_stub = nullptr;
  M_AXI_FPD_transactor_initiator_rd_socket_stub = nullptr;

}

void design_1_versal_cips_0_0::before_end_of_elaboration()
{
  // configure 'M_AXI_FPD' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("design_1_versal_cips_0_0", "M_AXI_FPD_TLM_MODE") != 1)
  {
    mp_impl->M_AXI_FPD_tlm_aximm_read_socket->bind(*(mp_M_AXI_FPD_transactor->rd_socket));
    mp_impl->M_AXI_FPD_tlm_aximm_write_socket->bind(*(mp_M_AXI_FPD_transactor->wr_socket));
  
  }
  else
  {
    M_AXI_FPD_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M_AXI_FPD_transactor_initiator_wr_socket_stub->bind(*(mp_M_AXI_FPD_transactor->wr_socket));
    M_AXI_FPD_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M_AXI_FPD_transactor_initiator_rd_socket_stub->bind(*(mp_M_AXI_FPD_transactor->rd_socket));
    mp_M_AXI_FPD_transactor->disable_transactor();
  }

}

#endif // MTI_SYSTEMC




design_1_versal_cips_0_0::~design_1_versal_cips_0_0()
{
  delete mp_M_AXI_FPD_transactor;

}

#ifdef MTI_SYSTEMC
SC_MODULE_EXPORT(design_1_versal_cips_0_0);
#endif

#ifdef XM_SYSTEMC
XMSC_MODULE_EXPORT(design_1_versal_cips_0_0);
#endif

#ifdef RIVIERA
SC_MODULE_EXPORT(design_1_versal_cips_0_0);
SC_REGISTER_BV(128);
#endif

