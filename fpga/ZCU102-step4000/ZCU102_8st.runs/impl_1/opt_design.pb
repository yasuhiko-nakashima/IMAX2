
k
Command: %s
53*	vivadotcl2:
&opt_design -directive ExploreWithRemap2default:defaultZ4-113h px� 
m
$Directive used for opt_design is: %s67*	vivadotcl2$
ExploreWithRemap2default:defaultZ4-136h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xczu9eg2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xczu9eg2default:defaultZ17-349h px� 
�
�The version limit for your license is '%s' and has expired for new software. A version limit expiration means that, although you may be able to continue to use the current version of tools or IP with this license, you will not be eligible for any updates or new releases.
719*common2
2022.082default:defaultZ17-1540h px� 
n
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_design2default:defaultZ4-22h px� 
R

Starting %s Task
103*constraints2
DRC2default:defaultZ18-103h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
U
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461h px� 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 8250.758 ; gain = 0.000 ; free physical = 111815 ; free virtual = 1268572default:defaulth px� 
a

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
i

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101h px� 
z
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
252default:default2
604162default:defaultZ31-138h px� 
K
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px� 
<
'Phase 1 Retarget | Checksum: 1bc7482fe
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:16 ; elapsed = 00:00:07 . Memory (MB): peak = 8250.758 ; gain = 0.000 ; free physical = 111738 ; free virtual = 1267802default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2
Retarget2default:default2
492default:default2
3952default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Retarget2default:default2
562default:defaultZ31-1021h px� 
u

Phase %s%s
101*constraints2
2 2default:default2(
Constant propagation2default:defaultZ18-101h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
H
3Phase 2 Constant propagation | Checksum: 2184e6329
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:17 ; elapsed = 00:00:08 . Memory (MB): peak = 8250.758 ; gain = 0.000 ; free physical = 111741 ; free virtual = 1267842default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2(
Constant propagation2default:default2
02default:default2
622default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2(
Constant propagation2default:default2
552default:defaultZ31-1021h px� 
r

Phase %s%s
101*constraints2
3 2default:default2%
BUFG optimization2default:defaultZ18-101h px� 
�
4Inserted BUFG %s to drive %s load(s) on clock net %s141*opt2U
Adesign_2_i/clk_wiz_0/inst/clk_out1_design_2_clk_wiz_0_0_BUFG_inst2default:default2
02default:default2R
>design_2_i/clk_wiz_0/inst/clk_out1_design_2_clk_wiz_0_0_BUFGCE2default:defaultZ31-194h px� 
�
4Inserted BUFG %s to drive %s load(s) on clock net %s141*opt2U
Adesign_2_i/clk_wiz_0/inst/clk_out2_design_2_clk_wiz_0_0_BUFG_inst2default:default2
02default:default2R
>design_2_i/clk_wiz_0/inst/clk_out2_design_2_clk_wiz_0_0_BUFGCE2default:defaultZ31-194h px� 
W
!Inserted %s BUFG(s) on clock nets140*opt2
22default:defaultZ31-193h px� 
�
OInserted BUFG to drive high-fanout reset|set|enable net. BUFG cell: %s, Net: %s93*opt2�
6design_2_i/rst_200M/U0/peripheral_aresetn[0]_BUFG_inst	6design_2_i/rst_200M/U0/peripheral_aresetn[0]_BUFG_inst2default:default2p
,design_2_i/rst_200M/U0/peripheral_aresetn[0],design_2_i/rst_200M/U0/peripheral_aresetn[0]2default:default8Z31-129h px� 
E
0Phase 3 BUFG optimization | Checksum: 18d6c2de5
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:18 ; elapsed = 00:00:09 . Memory (MB): peak = 8250.758 ; gain = 0.000 ; free physical = 111740 ; free virtual = 1267832default:defaulth px� 
�
EPhase %s created %s cells of which %s are BUFGs and removed %s cells.395*opt2%
BUFG optimization2default:default2
22default:default2
12default:default2
02default:defaultZ31-662h px� 
|

Phase %s%s
101*constraints2
4 2default:default2/
Shift Register Optimization2default:defaultZ18-101h px� 
O
:Phase 4 Shift Register Optimization | Checksum: 21d60968b
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:22 ; elapsed = 00:00:13 . Memory (MB): peak = 8250.758 ; gain = 0.000 ; free physical = 111737 ; free virtual = 1267792default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2/
Shift Register Optimization2default:default2
02default:default2
02default:defaultZ31-389h px� 
f

Phase %s%s
101*constraints2
5 2default:default2
Sweep2default:defaultZ18-101h px� 
9
$Phase 5 Sweep | Checksum: 1a25644d4
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:24 ; elapsed = 00:00:15 . Memory (MB): peak = 8250.758 ; gain = 0.000 ; free physical = 111733 ; free virtual = 1267762default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2
Sweep2default:default2
02default:default2
19502default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Sweep2default:default2
762default:defaultZ31-1021h px� 
u

Phase %s%s
101*constraints2
6 2default:default2(
Constant propagation2default:defaultZ18-101h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
H
3Phase 6 Constant propagation | Checksum: 1a25644d4
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:25 ; elapsed = 00:00:16 . Memory (MB): peak = 8250.758 ; gain = 0.000 ; free physical = 111733 ; free virtual = 1267762default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2(
Constant propagation2default:default2
02default:default2
02default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2(
Constant propagation2default:default2
552default:defaultZ31-1021h px� 
f

Phase %s%s
101*constraints2
7 2default:default2
Sweep2default:defaultZ18-101h px� 
9
$Phase 7 Sweep | Checksum: 1e63f29ec
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:26 ; elapsed = 00:00:17 . Memory (MB): peak = 8250.758 ; gain = 0.000 ; free physical = 111732 ; free virtual = 1267742default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2
Sweep2default:default2
02default:default2
02default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Sweep2default:default2
762default:defaultZ31-1021h px� 
f

Phase %s%s
101*constraints2
8 2default:default2
Remap2default:defaultZ18-101h px� 
9
$Phase 8 Remap | Checksum: 15d9913c7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:51 ; elapsed = 00:00:45 . Memory (MB): peak = 8250.758 ; gain = 0.000 ; free physical = 111533 ; free virtual = 1265762default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2
Remap2default:default2
48782default:default2
61762default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Remap2default:default2
112default:defaultZ31-1021h px� 
x

Phase %s%s
101*constraints2
9 2default:default2+
Post Processing Netlist2default:defaultZ18-101h px� 
K
6Phase 9 Post Processing Netlist | Checksum: 227187121
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:52 ; elapsed = 00:00:46 . Memory (MB): peak = 8250.758 ; gain = 0.000 ; free physical = 111560 ; free virtual = 1266032default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2+
Post Processing Netlist2default:default2
02default:default2
02default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2+
Post Processing Netlist2default:default2
572default:defaultZ31-1021h px� 
/
Opt_design Change Summary
*commonh px� 
/
=========================
*commonh px� 


*commonh px� 


*commonh px� 
�
z-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Phase                        |  #Cells created  |  #Cells Removed  |  #Constrained objects preventing optimizations  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�	
�	|  Retarget                     |              49  |             395  |                                             56  |
|  Constant propagation         |               0  |              62  |                                             55  |
|  BUFG optimization            |               2  |               0  |                                              0  |
|  Shift Register Optimization  |               0  |               0  |                                              0  |
|  Sweep                        |               0  |            1950  |                                             76  |
|  Constant propagation         |               0  |               0  |                                             55  |
|  Sweep                        |               0  |               0  |                                             76  |
|  Remap                        |            4878  |            6176  |                                             11  |
|  Post Processing Netlist      |               0  |               0  |                                             57  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
a

Starting %s Task
103*constraints2&
Connectivity Check2default:defaultZ18-103h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.29 ; elapsed = 00:00:00.28 . Memory (MB): peak = 8250.758 ; gain = 0.000 ; free physical = 111560 ; free virtual = 1266032default:defaulth px� 
J
5Ending Logic Optimization Task | Checksum: 1a7b9d395
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:53 ; elapsed = 00:00:47 . Memory (MB): peak = 8250.758 ; gain = 0.000 ; free physical = 111561 ; free virtual = 1266032default:defaulth px� 
\

Starting %s Task
103*constraints2!
Final Cleanup2default:defaultZ18-103h px� 
E
0Ending Final Cleanup Task | Checksum: 1a7b9d395
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 8250.758 ; gain = 0.000 ; free physical = 111560 ; free virtual = 1266032default:defaulth px� 
b

Starting %s Task
103*constraints2'
Netlist Obfuscation2default:defaultZ18-103h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.012default:default2
00:00:00.022default:default2
8250.7582default:default2
0.0002default:default2
1115602default:default2
1266032default:defaultZ17-722h px� 
K
6Ending Netlist Obfuscation Task | Checksum: 1a7b9d395
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.02 . Memory (MB): peak = 8250.758 ; gain = 0.000 ; free physical = 111560 ; free virtual = 1266032default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
442default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px� 
\
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2 
opt_design: 2default:default2
00:00:572default:default2
00:00:512default:default2
8250.7582default:default2
0.0002default:default2
1115852default:default2
1266282default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.012default:default2
00:00:00.012default:default2
8250.7582default:default2
0.0002default:default2
1115852default:default2
1266282default:defaultZ17-722h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:00.102default:default2
00:00:00.032default:default2
8250.7582default:default2
0.0002default:default2
1115632default:default2
1266112default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.032default:default2
00:00:00.012default:default2
8250.7582default:default2
0.0002default:default2
1115802default:default2
1266392default:defaultZ17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2r
^/home/nakashim/proj-arm64/fpga/ZCU102-step4000/ZCU102_8st.runs/impl_1/design_2_wrapper_opt.dcp2default:defaultZ17-1381h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2&
write_checkpoint: 2default:default2
00:00:292default:default2
00:00:302default:default2
8250.7582default:default2
0.0002default:default2
1115882default:default2
1266712default:defaultZ17-722h px� 
�
%s4*runtcl2�
�Executing : report_drc -file design_2_wrapper_drc_opted.rpt -pb design_2_wrapper_drc_opted.pb -rpx design_2_wrapper_drc_opted.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
ureport_drc -file design_2_wrapper_drc_opted.rpt -pb design_2_wrapper_drc_opted.pb -rpx design_2_wrapper_drc_opted.rpx2default:defaultZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
d/home/nakashim/proj-arm64/fpga/ZCU102-step4000/ZCU102_8st.runs/impl_1/design_2_wrapper_drc_opted.rptd/home/nakashim/proj-arm64/fpga/ZCU102-step4000/ZCU102_8st.runs/impl_1/design_2_wrapper_drc_opted.rpt2default:default8Z2-168h px� 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px� 


End Record