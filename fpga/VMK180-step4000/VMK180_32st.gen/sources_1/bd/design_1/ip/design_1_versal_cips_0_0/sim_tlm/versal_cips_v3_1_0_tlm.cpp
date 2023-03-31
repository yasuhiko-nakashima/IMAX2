// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
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


#include "versal_cips_v3_1_0_tlm.h"

/***************************************************************************************
*   Global method, get registered with tlm2xtlm bridge
*   This function is called when tlm2xtlm bridge convert tlm payload to xtlm payload.
*
*   caller:     tlm2xtlm bridge
*   purpose:    To get master id and other parameters out of genattr_extension
*               and use master id to AxUSER PIN of xtlm payload.
*
*
***************************************************************************************/
void get_extensions_from_tlm(xtlm::aximm_payload* xtlm_pay, const tlm::tlm_generic_payload* gp)
{
    if((xtlm_pay == NULL) || (gp == NULL))
        return;
    if((gp->get_command() == tlm::TLM_WRITE_COMMAND) && (xtlm_pay->get_awuser_size() > 0))
    {
  genattr_extension* ext = NULL;
  gp->get_extension(ext);
        if(ext == NULL)
            return;
  //Portion of master ID(master_id[5:0]) are transfered on AxUSER bits(refere Zynq UltraScale+ TRM page.no:414)
  uint32_t val = ext->get_master_id() && 0x3F;
    unsigned char* ptr = xtlm_pay->get_awuser_ptr();
    unsigned int size  = xtlm_pay->get_awuser_size();
    *ptr = (unsigned char)val;

    }
    else if((gp->get_command() == tlm::TLM_READ_COMMAND) && (xtlm_pay->get_aruser_size() > 0))
    {
        genattr_extension* ext = NULL;
        gp->get_extension(ext);
        if(ext == NULL)
            return;
        //Portion of master ID(master_id[5:0]) are transfered on AxUSER bits(refere Zynq UltraScale+ TRM page.no:414)
        uint32_t val = ext->get_master_id() && 0x3F;
    unsigned char* ptr = xtlm_pay->get_aruser_ptr();
    unsigned int size  = xtlm_pay->get_aruser_size();
    *ptr = (unsigned char)val;
  }
}

/***************************************************************************************
*   Global method, get registered with xtlm2tlm bridge
*   This function is called when xtlm2tlm bridge convert xtlm payload to tlm payload.
*
*   caller:     xtlm2tlm bridge
*   purpose:    To create and add master id and other parameters to genattr_extension.
*               Master id red from AxID PIN of xtlm payload.
*
*
***************************************************************************************/
void add_extensions_to_tlm(const xtlm::aximm_payload* xtlm_pay, tlm::tlm_generic_payload* gp)
{
    if(gp == NULL)
        return;
  uint8_t val = 0;
    if((gp->get_command() != tlm::TLM_WRITE_COMMAND) && (gp->get_command() != tlm::TLM_READ_COMMAND))
        return;
  //portion of master ID bits(master_id[5:0]) are derived from the AXI ID(AWID/ARID). (refere Zynq UltraScale+ TRM page.no:414,415)
  val = ((uint8_t)(xtlm_pay->get_axi_id())) && 0x3F;
  genattr_extension* ext = new genattr_extension;
  ext->set_master_id(val);
  gp->set_extension(ext);
  gp->set_streaming_width(gp->get_data_length());
  if(gp->get_command() != tlm::TLM_WRITE_COMMAND)
  {
    gp->set_byte_enable_length(0);
    gp->set_byte_enable_ptr(0);
  }
}

/*
template<int INIT_WIDTH, int TARGET_WIDTH>
class tlm_width_conversion :public sc_module {
  public:
    tlm_utils::simple_initiator_socket<tlm_width_conversion<INIT_WIDTH,TARGET_WIDTH>, INIT_WIDTH> initsock;
    tlm_utils::simple_target_socket<tlm_width_conversion<INIT_WIDTH,TARGET_WIDTH>, TARGET_WIDTH> tarsock;
    tlm_width_conversion<INIT_WIDTH, TARGET_WIDTH>(sc_module_name name):sc_module(name){
        tarsock.register_b_transport(this, &tlm_width_conversion<INIT_WIDTH, TARGET_WIDTH>::b_transport);
        tarsock.register_get_direct_mem_ptr(this, &tlm_width_conversion<INIT_WIDTH, TARGET_WIDTH>::get_direct_mem_ptr);
        tarsock.register_transport_dbg(this, &tlm_width_conversion<INIT_WIDTH, TARGET_WIDTH>::transport_dbg);
    }
    private:
    void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay){
        initsock->b_transport(trans, delay);
    }
    unsigned int transport_dbg(tlm::tlm_generic_payload& trans){
        return initsock->transport_dbg(trans);
    }
    bool get_direct_mem_ptr(tlm::tlm_generic_payload& trans, tlm::tlm_dmi& dmi_data){
        return initsock->get_direct_mem_ptr(trans, dmi_data);
    }
};
*/

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                              //
// File:            versal_cips_v3_1_tlm.cpp                                                                         //
//                                                                                                              //
// Description:     versal_cips_v3_1_0_tlm class is a sc_module, act as intermediate layer between                     //
//                  xilinx_zynqmp qemu wrapper and Vivado generated systemc simulation ip wrapper.              //
//                  it's basically created for supporting tlm based xilinx_zynqmp from xtlm based vivado        //
//                  generated systemc wrapper. this wrapper is live only when SELECTED_SIM_MODEL is set         //
//                  to tlm. it's also act as bridge between vivado wrapper and xilinx_zynqmp wrapper.           //
//                  it fill the the gap between input/output ports of vivado generated wrapper to               //
//                  xilinx_zynqmp wrapper signals. This wrapper is auto generated by ttcl scripts               //
//                  based on IP configuration in vivado.                                                        //
//                                                                                                              //
//                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//TODO update clk with original freq from PARAM
//constructor having three paramters
// 1. module name in sc_module_name objec,
// 2. reference to map object of name and integer value pairs
// 3. reference to map object of name and string value pairs
// All the model parameters (integer and string) which are configuration parameters
// of ZynqUltraScale+ IP propogated from Vivado
versal_cips_v3_1_0_tlm :: versal_cips_v3_1_0_tlm (sc_core::sc_module_name name,
  xsc::common_cpp::properties model_param_props) : sc_module(name) //registering module name with parent
    ,pl0_ref_clk("pl0_ref_clk")
    ,pmc_iro_clk("pmc_iro_clk")
    ,pl0_resetn("pl0_resetn")
    ,m_axi_fpd_aclk("m_axi_fpd_aclk")
    ,pl0_ref_clk_clk("pl0_ref_clk_clk", sc_time(10.0,sc_core::SC_NS))//clock period in nanoseconds = 1000/freq(in MZ)
    ,m_rp_bridge_M_AXI_FPD("m_rp_bridge_M_AXI_FPD")
    ,dummy_usr_irq_req("dummy_usr_irq_req")
    ,dummy_usr_irq_ack("dummy_usr_irq_ack")
{
    fpd_cci_noc_clk = NULL;
    lpd_axi_noc_clk_sig = NULL;
    char* enable_clocks = getenv("ENABLE_CIPS_CLOCKS");
  //  Start versal_cips_v3_1_0_tlm()
  //creating instances of xtlm slave sockets
M_AXI_FPD_tlm_aximm_write_socket = new xtlm::xtlm_aximm_initiator_socket("M_AXI_FPD_tlm_aximm_write_socket",128);
M_AXI_FPD_tlm_aximm_read_socket = new xtlm::xtlm_aximm_initiator_socket("M_AXI_FPD_tlm_aximm_read_socket",128);

        //Adding AXIMM/AXIS interfaces here
  
  char* tcpip_addr = getenv("COSIM_MACHINE_TCPIP_ADDRESS");
  char* unix_addr = getenv("COSIM_MACHINE_PATH");
  char* skt_name;
  if (unix_addr != NULL){
      skt_name = strdup(unix_addr);
  } else if (tcpip_addr != NULL) {
      skt_name = strdup(tcpip_addr);
  } else {
      tcpip_addr = "NO_IP_ADDRESS";
      skt_name = strdup(tcpip_addr);
  }
  m_zynq3_tlm_model = new xilinx_versal("xilinx_versal",skt_name);

  //quantumkeeper value update
  char* qk_value = getenv("TLM_QUANTUM_IN_PS");
  if(qk_value != NULL) {
      double value = atof(qk_value);
      m_zynq3_tlm_model->m_qk.set_global_quantum(sc_core::sc_time(value,SC_PS));
  } else {
      m_zynq3_tlm_model->m_qk.set_global_quantum(sc_core::sc_time(20,SC_NS));
  }
  m_zynq3_tlm_model->m_qk.reset();

  m_xtlm2tlm = new xtlm::xaximm_xtlm2tlm*[11];//for slave interfaces of zynq3 -- 11 slave interfaces are exist
  for(int index = 0; index < 11; index++) {
      m_xtlm2tlm[index] = NULL;
  }


  //instantiating TLM2XTLM bridge and stiching it between
  //m_axi_gp_0 initiator socket of zynqmp Qemu tlm wrapper to M_AXI_FPD_tlm_aximm_write_socket/rd_socket sockets
  m_rp_bridge_M_AXI_FPD.clk(m_axi_fpd_aclk);
  m_rp_bridge_M_AXI_FPD.wr_socket.bind(*M_AXI_FPD_tlm_aximm_write_socket);
  m_rp_bridge_M_AXI_FPD.rd_socket.bind(*M_AXI_FPD_tlm_aximm_read_socket);
  m_rp_bridge_M_AXI_FPD.target_socket.bind(*m_zynq3_tlm_model->m_axi_fpd);
  m_zynq3_tlm_model->tie_off();

  SC_METHOD(pl_ps_irq_method);
  dont_initialize();

  SC_METHOD(trigger_pl0_ref_clk_pin);
  sensitive << pl0_ref_clk_clk;
  dont_initialize();


if((enable_clocks != NULL) && (strcasecmp(enable_clocks, "true") == 0)) {
  SC_METHOD(trigger_pmc_iro_clk_pin);
  sensitive << *fpd_cci_noc_clk;
  dont_initialize();
}

  m_rp_bridge_M_AXI_FPD.registerUserExtensionHandlerCallback(&get_extensions_from_tlm);

  m_zynq3_tlm_model->rst(qemu_rst);

  SC_METHOD(pl0_resetn_trigger);
  sensitive << m_zynq3_tlm_model->pl_reset[0];
  //  End versal_cips_v3_1_0_tlm()
}

versal_cips_v3_1_0_tlm :: ~versal_cips_v3_1_0_tlm() {
  //deleting dynamically created objects
  if(fpd_cci_noc_clk != NULL) {
      delete fpd_cci_noc_clk;
      fpd_cci_noc_clk = NULL;
  }
  if(lpd_axi_noc_clk_sig != NULL) {
      delete lpd_axi_noc_clk_sig;
      lpd_axi_noc_clk_sig = NULL;
  }
    delete M_AXI_FPD_tlm_aximm_write_socket;
    delete M_AXI_FPD_tlm_aximm_read_socket;
M_AXI_FPD_tlm_aximm_write_socket = NULL;
M_AXI_FPD_tlm_aximm_read_socket = NULL;

    for (int index = 0; index < 11; index++) {
        if(m_xtlm2tlm[index] != NULL) {
            delete m_xtlm2tlm[index];
            m_xtlm2tlm[index] = NULL;
        }
    }
    if(m_xtlm2tlm != NULL){
        delete[] m_xtlm2tlm;
    }

  //deleting the thread object, RdWrTCPSocket and rwd_tlmmodel
}

//Method which is sentive to pl0_ref_clk_clk sc_clock object
//pl0_ref_clk pin written based on pl0_ref_clk_clk clock value
void versal_cips_v3_1_0_tlm :: trigger_pl0_ref_clk_pin() {
    pl0_ref_clk.write(pl0_ref_clk_clk.read());
}

  void versal_cips_v3_1_0_tlm :: trigger_pmc_iro_clk_pin() {
      pmc_iro_clk.write((*fpd_cci_noc_clk).read());
  }

void versal_cips_v3_1_0_tlm :: pl_ps_irq_method() {
}
//pl0_resetn output reset pin get toggle when emio bank 2's 31th signal gets toggled
//EMIO[2] bank 31th(GPIO[95] signal)acts as reset signal to the PL(refer Zynq UltraScale+ TRM, page no:761)
void versal_cips_v3_1_0_tlm :: pl0_resetn_trigger() {
  static int i = 0;
  if(i == 0) {
    pl0_resetn.write(true);
    i++;
  } else {
    pl0_resetn.write(m_zynq3_tlm_model->pl_reset[0]);
  }
}

void versal_cips_v3_1_0_tlm :: start_of_simulation()
{
  qemu_rst.write(false);
  char* tcpip_addr = getenv("COSIM_MACHINE_TCPIP_ADDRESS");
  char* unix_addr = getenv("COSIM_MACHINE_PATH");
  if(tcpip_addr == NULL && unix_addr == NULL) {
      std::cerr << "\n\n############################################################## \n#\n"
                << " #  You have set SELECTED_SIM_MODLE=TLM for Versal CIPS block.\n" 
                << " #  Since this requires software content, the QEMU based simulation in Vivado will not generate any transactions on master interfaces and will also not respond to any transactions on slave interfaces.\n" 
                << " #  To use SW driven simulation, create use the Vitis flow\n" 
                << "\n#\n##############################################################\n\n";
      //exit(0);
  }
}
void versal_cips_v3_1_0_tlm :: rwd_tlmmodule_init() {
}

void versal_cips_v3_1_0_tlm :: enable_sim_qdma() {
}
template <int IN_WIDTH, int OUT_WIDTH>
rptlm2xtlm_converter<IN_WIDTH, OUT_WIDTH>::rptlm2xtlm_converter(sc_module_name name):sc_module(name)
  ,target_socket("target_socket")
  ,wr_socket("init_wr_socket",OUT_WIDTH)
  ,rd_socket("init_rd_socket",OUT_WIDTH)
  ,m_btrans_conv("b_transport_converter")
  ,xtlm_bridge("tlm2xtlmbridge")
{
  target_socket.bind(m_btrans_conv.target_socket);
  m_btrans_conv.initiator_socket.bind(xtlm_bridge.target_socket);
  xtlm_bridge.rd_socket->bind(rd_socket);
  xtlm_bridge.wr_socket->bind(wr_socket);
}
template <int IN_WIDTH, int OUT_WIDTH>
void rptlm2xtlm_converter<IN_WIDTH, OUT_WIDTH>::registerUserExtensionHandlerCallback(
  void (*callback)(xtlm::aximm_payload*,
    const tlm::tlm_generic_payload*)) {
  xtlm_bridge.registerUserExtensionHandlerCallback(callback);
}
template <int IN_WIDTH, int OUT_WIDTH>
void rptlm2xtlm_converter<IN_WIDTH, OUT_WIDTH>::before_end_of_elaboration() {
  m_btrans_conv.clk(clk);
}
