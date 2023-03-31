# aclk {FREQ_HZ 299996999 CLK_DOMAIN design_1_clk_wizard_0_0_clk_out1 PHASE 0.0} aclk1 {FREQ_HZ 199998000 CLK_DOMAIN design_1_clk_wizard_0_0_clk_out1 PHASE 0.0}
# Clock Domain: design_1_clk_wizard_0_0_clk_out1
create_clock -name aclk -period 3.333 [get_ports aclk]
# Generated clocks
create_generated_clock -name aclk1 -source [get_ports aclk] -multiply_by 199998000 -divide_by 299996999 [get_ports aclk1]
