#ifndef IP_DESIGN_1_VERSAL_CIPS_0_0_H_
#define IP_DESIGN_1_VERSAL_CIPS_0_0_H_

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


#ifndef XTLM
#include "xtlm.h"
#endif
#ifndef SYSTEMC_INCLUDED
#include <systemc>
#endif

#if defined(_MSC_VER)
#define DllExport __declspec(dllexport)
#elif defined(__GNUC__)
#define DllExport __attribute__ ((visibility("default")))
#else
#define DllExport
#endif

#include "design_1_versal_cips_0_0_sc.h"




#ifdef XILINX_SIMULATOR
class DllExport design_1_versal_cips_0_0 : public design_1_versal_cips_0_0_sc
{
public:

  design_1_versal_cips_0_0(const sc_core::sc_module_name& nm);
  virtual ~design_1_versal_cips_0_0();

  // module pin-to-pin RTL interface

  sc_core::sc_out< bool > pl0_ref_clk;
  sc_core::sc_out< bool > pmc_iro_clk;
  sc_core::sc_out< bool > pl0_resetn;
  sc_core::sc_in< bool > m_axi_fpd_aclk;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_awid;
  sc_core::sc_out< sc_dt::sc_bv<44> > M_AXI_FPD_awaddr;
  sc_core::sc_out< sc_dt::sc_bv<8> > M_AXI_FPD_awlen;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_awsize;
  sc_core::sc_out< sc_dt::sc_bv<2> > M_AXI_FPD_awburst;
  sc_core::sc_out< bool > M_AXI_FPD_awlock;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_awcache;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_awprot;
  sc_core::sc_out< bool > M_AXI_FPD_awvalid;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_awuser;
  sc_core::sc_in< bool > M_AXI_FPD_awready;
  sc_core::sc_out< bool > M_AXI_FPD_wlast;
  sc_core::sc_out< bool > M_AXI_FPD_wvalid;
  sc_core::sc_in< bool > M_AXI_FPD_wready;
  sc_core::sc_in< sc_dt::sc_bv<16> > M_AXI_FPD_bid;
  sc_core::sc_in< sc_dt::sc_bv<2> > M_AXI_FPD_bresp;
  sc_core::sc_in< bool > M_AXI_FPD_bvalid;
  sc_core::sc_out< bool > M_AXI_FPD_bready;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_arid;
  sc_core::sc_out< sc_dt::sc_bv<44> > M_AXI_FPD_araddr;
  sc_core::sc_out< sc_dt::sc_bv<8> > M_AXI_FPD_arlen;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_arsize;
  sc_core::sc_out< sc_dt::sc_bv<2> > M_AXI_FPD_arburst;
  sc_core::sc_out< bool > M_AXI_FPD_arlock;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_arcache;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_arprot;
  sc_core::sc_out< bool > M_AXI_FPD_arvalid;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_aruser;
  sc_core::sc_in< bool > M_AXI_FPD_arready;
  sc_core::sc_in< sc_dt::sc_bv<16> > M_AXI_FPD_rid;
  sc_core::sc_in< sc_dt::sc_bv<2> > M_AXI_FPD_rresp;
  sc_core::sc_in< bool > M_AXI_FPD_rlast;
  sc_core::sc_in< bool > M_AXI_FPD_rvalid;
  sc_core::sc_out< bool > M_AXI_FPD_rready;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_awqos;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_arqos;
  sc_core::sc_out< sc_dt::sc_bv<128> > M_AXI_FPD_wdata;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_wstrb;
  sc_core::sc_in< sc_dt::sc_bv<128> > M_AXI_FPD_rdata;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:

  xtlm::xaximm_xtlm2pin_t<128,44,16,16,1,1,16,1>* mp_M_AXI_FPD_transactor;

};
#endif // XILINX_SIMULATOR




#ifdef XM_SYSTEMC
class DllExport design_1_versal_cips_0_0 : public design_1_versal_cips_0_0_sc
{
public:

  design_1_versal_cips_0_0(const sc_core::sc_module_name& nm);
  virtual ~design_1_versal_cips_0_0();

  // module pin-to-pin RTL interface

  sc_core::sc_out< bool > pl0_ref_clk;
  sc_core::sc_out< bool > pmc_iro_clk;
  sc_core::sc_out< bool > pl0_resetn;
  sc_core::sc_in< bool > m_axi_fpd_aclk;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_awid;
  sc_core::sc_out< sc_dt::sc_bv<44> > M_AXI_FPD_awaddr;
  sc_core::sc_out< sc_dt::sc_bv<8> > M_AXI_FPD_awlen;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_awsize;
  sc_core::sc_out< sc_dt::sc_bv<2> > M_AXI_FPD_awburst;
  sc_core::sc_out< bool > M_AXI_FPD_awlock;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_awcache;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_awprot;
  sc_core::sc_out< bool > M_AXI_FPD_awvalid;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_awuser;
  sc_core::sc_in< bool > M_AXI_FPD_awready;
  sc_core::sc_out< bool > M_AXI_FPD_wlast;
  sc_core::sc_out< bool > M_AXI_FPD_wvalid;
  sc_core::sc_in< bool > M_AXI_FPD_wready;
  sc_core::sc_in< sc_dt::sc_bv<16> > M_AXI_FPD_bid;
  sc_core::sc_in< sc_dt::sc_bv<2> > M_AXI_FPD_bresp;
  sc_core::sc_in< bool > M_AXI_FPD_bvalid;
  sc_core::sc_out< bool > M_AXI_FPD_bready;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_arid;
  sc_core::sc_out< sc_dt::sc_bv<44> > M_AXI_FPD_araddr;
  sc_core::sc_out< sc_dt::sc_bv<8> > M_AXI_FPD_arlen;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_arsize;
  sc_core::sc_out< sc_dt::sc_bv<2> > M_AXI_FPD_arburst;
  sc_core::sc_out< bool > M_AXI_FPD_arlock;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_arcache;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_arprot;
  sc_core::sc_out< bool > M_AXI_FPD_arvalid;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_aruser;
  sc_core::sc_in< bool > M_AXI_FPD_arready;
  sc_core::sc_in< sc_dt::sc_bv<16> > M_AXI_FPD_rid;
  sc_core::sc_in< sc_dt::sc_bv<2> > M_AXI_FPD_rresp;
  sc_core::sc_in< bool > M_AXI_FPD_rlast;
  sc_core::sc_in< bool > M_AXI_FPD_rvalid;
  sc_core::sc_out< bool > M_AXI_FPD_rready;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_awqos;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_arqos;
  sc_core::sc_out< sc_dt::sc_bv<128> > M_AXI_FPD_wdata;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_wstrb;
  sc_core::sc_in< sc_dt::sc_bv<128> > M_AXI_FPD_rdata;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:

  xtlm::xaximm_xtlm2pin_t<128,44,16,16,1,1,16,1>* mp_M_AXI_FPD_transactor;

};
#endif // XM_SYSTEMC




#ifdef RIVIERA
class DllExport design_1_versal_cips_0_0 : public design_1_versal_cips_0_0_sc
{
public:

  design_1_versal_cips_0_0(const sc_core::sc_module_name& nm);
  virtual ~design_1_versal_cips_0_0();

  // module pin-to-pin RTL interface

  sc_core::sc_out< bool > pl0_ref_clk;
  sc_core::sc_out< bool > pmc_iro_clk;
  sc_core::sc_out< bool > pl0_resetn;
  sc_core::sc_in< bool > m_axi_fpd_aclk;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_awid;
  sc_core::sc_out< sc_dt::sc_bv<44> > M_AXI_FPD_awaddr;
  sc_core::sc_out< sc_dt::sc_bv<8> > M_AXI_FPD_awlen;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_awsize;
  sc_core::sc_out< sc_dt::sc_bv<2> > M_AXI_FPD_awburst;
  sc_core::sc_out< bool > M_AXI_FPD_awlock;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_awcache;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_awprot;
  sc_core::sc_out< bool > M_AXI_FPD_awvalid;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_awuser;
  sc_core::sc_in< bool > M_AXI_FPD_awready;
  sc_core::sc_out< bool > M_AXI_FPD_wlast;
  sc_core::sc_out< bool > M_AXI_FPD_wvalid;
  sc_core::sc_in< bool > M_AXI_FPD_wready;
  sc_core::sc_in< sc_dt::sc_bv<16> > M_AXI_FPD_bid;
  sc_core::sc_in< sc_dt::sc_bv<2> > M_AXI_FPD_bresp;
  sc_core::sc_in< bool > M_AXI_FPD_bvalid;
  sc_core::sc_out< bool > M_AXI_FPD_bready;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_arid;
  sc_core::sc_out< sc_dt::sc_bv<44> > M_AXI_FPD_araddr;
  sc_core::sc_out< sc_dt::sc_bv<8> > M_AXI_FPD_arlen;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_arsize;
  sc_core::sc_out< sc_dt::sc_bv<2> > M_AXI_FPD_arburst;
  sc_core::sc_out< bool > M_AXI_FPD_arlock;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_arcache;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_arprot;
  sc_core::sc_out< bool > M_AXI_FPD_arvalid;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_aruser;
  sc_core::sc_in< bool > M_AXI_FPD_arready;
  sc_core::sc_in< sc_dt::sc_bv<16> > M_AXI_FPD_rid;
  sc_core::sc_in< sc_dt::sc_bv<2> > M_AXI_FPD_rresp;
  sc_core::sc_in< bool > M_AXI_FPD_rlast;
  sc_core::sc_in< bool > M_AXI_FPD_rvalid;
  sc_core::sc_out< bool > M_AXI_FPD_rready;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_awqos;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_arqos;
  sc_core::sc_out< sc_dt::sc_bv<128> > M_AXI_FPD_wdata;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_wstrb;
  sc_core::sc_in< sc_dt::sc_bv<128> > M_AXI_FPD_rdata;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:

  xtlm::xaximm_xtlm2pin_t<128,44,16,16,1,1,16,1>* mp_M_AXI_FPD_transactor;

};
#endif // RIVIERA




#ifdef VCSSYSTEMC
#include "utils/xtlm_aximm_initiator_stub.h"

class DllExport design_1_versal_cips_0_0 : public design_1_versal_cips_0_0_sc
{
public:

  design_1_versal_cips_0_0(const sc_core::sc_module_name& nm);
  virtual ~design_1_versal_cips_0_0();

  // module pin-to-pin RTL interface

  sc_core::sc_out< bool > pl0_ref_clk;
  sc_core::sc_out< bool > pmc_iro_clk;
  sc_core::sc_out< bool > pl0_resetn;
  sc_core::sc_in< bool > m_axi_fpd_aclk;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_awid;
  sc_core::sc_out< sc_dt::sc_bv<44> > M_AXI_FPD_awaddr;
  sc_core::sc_out< sc_dt::sc_bv<8> > M_AXI_FPD_awlen;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_awsize;
  sc_core::sc_out< sc_dt::sc_bv<2> > M_AXI_FPD_awburst;
  sc_core::sc_out< bool > M_AXI_FPD_awlock;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_awcache;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_awprot;
  sc_core::sc_out< bool > M_AXI_FPD_awvalid;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_awuser;
  sc_core::sc_in< bool > M_AXI_FPD_awready;
  sc_core::sc_out< bool > M_AXI_FPD_wlast;
  sc_core::sc_out< bool > M_AXI_FPD_wvalid;
  sc_core::sc_in< bool > M_AXI_FPD_wready;
  sc_core::sc_in< sc_dt::sc_bv<16> > M_AXI_FPD_bid;
  sc_core::sc_in< sc_dt::sc_bv<2> > M_AXI_FPD_bresp;
  sc_core::sc_in< bool > M_AXI_FPD_bvalid;
  sc_core::sc_out< bool > M_AXI_FPD_bready;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_arid;
  sc_core::sc_out< sc_dt::sc_bv<44> > M_AXI_FPD_araddr;
  sc_core::sc_out< sc_dt::sc_bv<8> > M_AXI_FPD_arlen;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_arsize;
  sc_core::sc_out< sc_dt::sc_bv<2> > M_AXI_FPD_arburst;
  sc_core::sc_out< bool > M_AXI_FPD_arlock;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_arcache;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_arprot;
  sc_core::sc_out< bool > M_AXI_FPD_arvalid;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_aruser;
  sc_core::sc_in< bool > M_AXI_FPD_arready;
  sc_core::sc_in< sc_dt::sc_bv<16> > M_AXI_FPD_rid;
  sc_core::sc_in< sc_dt::sc_bv<2> > M_AXI_FPD_rresp;
  sc_core::sc_in< bool > M_AXI_FPD_rlast;
  sc_core::sc_in< bool > M_AXI_FPD_rvalid;
  sc_core::sc_out< bool > M_AXI_FPD_rready;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_awqos;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_arqos;
  sc_core::sc_out< sc_dt::sc_bv<128> > M_AXI_FPD_wdata;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_wstrb;
  sc_core::sc_in< sc_dt::sc_bv<128> > M_AXI_FPD_rdata;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:

  xtlm::xaximm_xtlm2pin_t<128,44,16,16,1,1,16,1>* mp_M_AXI_FPD_transactor;

  // Transactor stubs
  xtlm::xtlm_aximm_initiator_stub * M_AXI_FPD_transactor_initiator_rd_socket_stub;
  xtlm::xtlm_aximm_initiator_stub * M_AXI_FPD_transactor_initiator_wr_socket_stub;

  // Socket stubs

};
#endif // VCSSYSTEMC




#ifdef MTI_SYSTEMC
#include "utils/xtlm_aximm_initiator_stub.h"

class DllExport design_1_versal_cips_0_0 : public design_1_versal_cips_0_0_sc
{
public:

  design_1_versal_cips_0_0(const sc_core::sc_module_name& nm);
  virtual ~design_1_versal_cips_0_0();

  // module pin-to-pin RTL interface

  sc_core::sc_out< bool > pl0_ref_clk;
  sc_core::sc_out< bool > pmc_iro_clk;
  sc_core::sc_out< bool > pl0_resetn;
  sc_core::sc_in< bool > m_axi_fpd_aclk;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_awid;
  sc_core::sc_out< sc_dt::sc_bv<44> > M_AXI_FPD_awaddr;
  sc_core::sc_out< sc_dt::sc_bv<8> > M_AXI_FPD_awlen;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_awsize;
  sc_core::sc_out< sc_dt::sc_bv<2> > M_AXI_FPD_awburst;
  sc_core::sc_out< bool > M_AXI_FPD_awlock;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_awcache;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_awprot;
  sc_core::sc_out< bool > M_AXI_FPD_awvalid;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_awuser;
  sc_core::sc_in< bool > M_AXI_FPD_awready;
  sc_core::sc_out< bool > M_AXI_FPD_wlast;
  sc_core::sc_out< bool > M_AXI_FPD_wvalid;
  sc_core::sc_in< bool > M_AXI_FPD_wready;
  sc_core::sc_in< sc_dt::sc_bv<16> > M_AXI_FPD_bid;
  sc_core::sc_in< sc_dt::sc_bv<2> > M_AXI_FPD_bresp;
  sc_core::sc_in< bool > M_AXI_FPD_bvalid;
  sc_core::sc_out< bool > M_AXI_FPD_bready;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_arid;
  sc_core::sc_out< sc_dt::sc_bv<44> > M_AXI_FPD_araddr;
  sc_core::sc_out< sc_dt::sc_bv<8> > M_AXI_FPD_arlen;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_arsize;
  sc_core::sc_out< sc_dt::sc_bv<2> > M_AXI_FPD_arburst;
  sc_core::sc_out< bool > M_AXI_FPD_arlock;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_arcache;
  sc_core::sc_out< sc_dt::sc_bv<3> > M_AXI_FPD_arprot;
  sc_core::sc_out< bool > M_AXI_FPD_arvalid;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_aruser;
  sc_core::sc_in< bool > M_AXI_FPD_arready;
  sc_core::sc_in< sc_dt::sc_bv<16> > M_AXI_FPD_rid;
  sc_core::sc_in< sc_dt::sc_bv<2> > M_AXI_FPD_rresp;
  sc_core::sc_in< bool > M_AXI_FPD_rlast;
  sc_core::sc_in< bool > M_AXI_FPD_rvalid;
  sc_core::sc_out< bool > M_AXI_FPD_rready;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_awqos;
  sc_core::sc_out< sc_dt::sc_bv<4> > M_AXI_FPD_arqos;
  sc_core::sc_out< sc_dt::sc_bv<128> > M_AXI_FPD_wdata;
  sc_core::sc_out< sc_dt::sc_bv<16> > M_AXI_FPD_wstrb;
  sc_core::sc_in< sc_dt::sc_bv<128> > M_AXI_FPD_rdata;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:

  xtlm::xaximm_xtlm2pin_t<128,44,16,16,1,1,16,1>* mp_M_AXI_FPD_transactor;

  // Transactor stubs
  xtlm::xtlm_aximm_initiator_stub * M_AXI_FPD_transactor_initiator_rd_socket_stub;
  xtlm::xtlm_aximm_initiator_stub * M_AXI_FPD_transactor_initiator_wr_socket_stub;

  // Socket stubs

};
#endif // MTI_SYSTEMC
#endif // IP_DESIGN_1_VERSAL_CIPS_0_0_H_
