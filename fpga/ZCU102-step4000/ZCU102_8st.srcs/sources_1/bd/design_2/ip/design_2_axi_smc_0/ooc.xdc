# aclk {FREQ_HZ 333333333 CLK_DOMAIN design_2_clk_wiz_0_0_clk_out1 PHASE 0.0} aclk1 {FREQ_HZ 200000000 CLK_DOMAIN design_2_clk_wiz_0_0_clk_out1 PHASE 0.0}
# Clock Domain: design_2_clk_wiz_0_0_clk_out1
create_clock -name aclk -period 3.000 [get_ports aclk]
# Generated clocks
create_generated_clock -name aclk1 -source [get_ports aclk] -multiply_by 200000000 -divide_by 333333333 [get_ports aclk1]
