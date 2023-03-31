-- (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:util_ds_buf:2.1
-- IP Revision: 12

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_util_ds_buf_0_0 IS
  PORT (
    BUFG_I : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    BUFG_O : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END design_1_util_ds_buf_0_0;

ARCHITECTURE design_1_util_ds_buf_0_0_arch OF design_1_util_ds_buf_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_util_ds_buf_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT util_ds_buf IS
    GENERIC (
      C_BUF_TYPE : STRING;
      C_SIZE : INTEGER;
      C_BUFGCE_DIV : INTEGER
    );
    PORT (
      IBUF_DS_P : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      IBUF_DS_N : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      IBUF_OUT : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      IBUF_DS_ODIV2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      OBUF_IN : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      OBUF_DS_P : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      OBUF_DS_N : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      IOBUF_DS_P : INOUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      IOBUF_DS_N : INOUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      IOBUF_IO_T : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      IOBUF_IO_I : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      IOBUF_IO_O : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      IOBUF_IO_IO : INOUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFG_I : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFG_O : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFGCE_I : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFGCE_CE : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFGCE_O : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFH_I : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFH_O : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFHCE_I : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFHCE_CE : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFHCE_O : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFG_GT_I : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFG_GT_CE : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFG_GT_CEMASK : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFG_GT_CLR : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFG_GT_CLRMASK : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      BUFG_GT_DIV : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      BUFG_GT_O : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
  END COMPONENT util_ds_buf;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF BUFG_O: SIGNAL IS "XIL_INTERFACENAME BUFG_O, FREQ_HZ 78125000, CLK_DOMAIN design_1_clk_78m_buff_0_IBUF_OUT, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF BUFG_O: SIGNAL IS "xilinx.com:signal:clock:1.0 BUFG_O CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF BUFG_I: SIGNAL IS "XIL_INTERFACENAME BUFG_I, FREQ_HZ 78125000, CLK_DOMAIN design_1_clk_78m_buff_0_IBUF_OUT, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF BUFG_I: SIGNAL IS "xilinx.com:signal:clock:1.0 BUFG_I CLK";
BEGIN
  U0 : util_ds_buf
    GENERIC MAP (
      C_BUF_TYPE => "BUFG",
      C_SIZE => 1,
      C_BUFGCE_DIV => 1
    )
    PORT MAP (
      IBUF_DS_P => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      IBUF_DS_N => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      OBUF_IN => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      IOBUF_IO_T => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      IOBUF_IO_I => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      BUFG_I => BUFG_I,
      BUFG_O => BUFG_O,
      BUFGCE_I => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      BUFGCE_CE => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      BUFH_I => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      BUFHCE_I => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      BUFHCE_CE => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      BUFG_GT_I => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      BUFG_GT_CE => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      BUFG_GT_CEMASK => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      BUFG_GT_CLR => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      BUFG_GT_CLRMASK => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      BUFG_GT_DIV => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3))
    );
END design_1_util_ds_buf_0_0_arch;
