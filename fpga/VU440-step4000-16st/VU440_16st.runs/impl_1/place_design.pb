
O
*Debug cores have already been implemented
153*	chipscopeZ16-240h px� 
d
Command: %s
53*	vivadotcl23
place_design -directive Explore2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xcvu4402default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xcvu4402default:defaultZ17-349h px� 
�
�The version limit for your license is '%s' and has expired for new software. A version limit expiration means that, although you may be able to continue to use the current version of tools or IP with this license, you will not be eligible for any updates or new releases.
719*common2
2022.082default:defaultZ17-1540h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px� 
n
/The placer was invoked with the '%s' directive.14*	placeflow2
Explore2default:defaultZ46-5h px� 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
82default:defaultZ30-611h px� 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.042default:default2
00:00:00.052default:default2
	10597.9492default:default2
0.0002default:default2
835882default:default2
1210792default:defaultZ17-722h px� 
[
FPhase 1.1 Placer Initialization Netlist Sorting | Checksum: 1bfa15332
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.11 ; elapsed = 00:00:00.12 . Memory (MB): peak = 10597.949 ; gain = 0.000 ; free physical = 83588 ; free virtual = 1210792default:defaulth px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.042default:default2
00:00:00.042default:default2
	10597.9492default:default2
0.0002default:default2
835882default:default2
1210802default:defaultZ17-722h px� 
�

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
g
RPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: da223015
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:02 ; elapsed = 00:00:48 . Memory (MB): peak = 10597.949 ; gain = 0.000 ; free physical = 81864 ; free virtual = 1194942default:defaulth px� 
}

Phase %s%s
101*constraints2
1.3 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px� 
O
:Phase 1.3 Build Placer Netlist Model | Checksum: fe691a29
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:36 ; elapsed = 00:01:39 . Memory (MB): peak = 13741.711 ; gain = 3143.762 ; free physical = 79787 ; free virtual = 1174192default:defaulth px� 
z

Phase %s%s
101*constraints2
1.4 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px� 
L
7Phase 1.4 Constrain Clocks/Macros | Checksum: fe691a29
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:37 ; elapsed = 00:01:39 . Memory (MB): peak = 13741.711 ; gain = 3143.762 ; free physical = 79782 ; free virtual = 1174142default:defaulth px� 
H
3Phase 1 Placer Initialization | Checksum: fe691a29
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:38 ; elapsed = 00:01:41 . Memory (MB): peak = 13741.711 ; gain = 3143.762 ; free physical = 79779 ; free virtual = 1174102default:defaulth px� 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
2.1 2default:default2!
Floorplanning2default:defaultZ18-101h px� 
B
-Phase 2.1 Floorplanning | Checksum: b7bf496b
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:08:39 ; elapsed = 00:03:42 . Memory (MB): peak = 14801.461 ; gain = 4203.512 ; free physical = 79193 ; free virtual = 1168252default:defaulth px� 


Phase %s%s
101*constraints2
2.2 2default:default20
Physical Synthesis In Placer2default:defaultZ18-101h px� 
K
)No high fanout nets found in the design.
65*physynthZ32-65h px� 
�
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
I
'No nets found for fanout-optimization.
64*physynthZ32-64h px� 
�
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_69�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_692default:default2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__66	�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__662default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_101�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_1012default:default2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_3__4	�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_3__42default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_14�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_142default:default2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__14	�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__142default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_76�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_762default:default2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__72	�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__722default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_77�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_772default:default2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__73	�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__732default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_33�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_332default:default2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__33	�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__332default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_102�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_1022default:default2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__95	�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__952default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_37�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_372default:default2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__37	�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__372default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/i_intcap.CAP_ADDR_O_reg[12]_14�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/i_intcap.CAP_ADDR_O_reg[12]_142default:default2�
�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__14	�inst_design_1_wrapper/design_1_i/system_ila_0/inst/ila_lib/inst/ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__142default:default8Z32-117h px� 
P
.No nets found for critical-cell optimization.
68*physynthZ32-68h px� 
�
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
j
FNo candidate cells for DSP register optimization found in the design.
274*physynthZ32-456h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
22default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
h
DNo candidate cells for SRL register optimization found in the design349*physynthZ32-677h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
i
ENo candidate cells for BRAM register optimization found in the design297*physynthZ32-526h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
R
.No candidate nets found for HD net replication521*physynthZ32-949h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.042default:default2
00:00:00.042default:default2
	18608.1602default:default2
0.0002default:default2
785552default:default2
1161892default:defaultZ17-722h px� 
B
-
Summary of Physical Synthesis Optimizations
*commonh px� 
B
-============================================
*commonh px� 


*commonh px� 


*commonh px� 
�
�----------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Optimization                  |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
----------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�	
�	|  Very High Fanout              |            0  |              0  |                     0  |           1  |           1  |  00:00:02  |
|  Fanout                        |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Critical Cell                 |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  DSP Register                  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Shift Register                |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  BRAM Register                 |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  HD Interface Net Replication  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Total                         |            0  |              0  |                     0  |           1  |           7  |  00:00:03  |
----------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
Q
<Phase 2.2 Physical Synthesis In Placer | Checksum: d601aa0e
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:18:41 ; elapsed = 00:08:32 . Memory (MB): peak = 18608.160 ; gain = 8010.211 ; free physical = 78541 ; free virtual = 1161762default:defaulth px� 
D
/Phase 2 Global Placement | Checksum: 142cdf0de
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:19:32 ; elapsed = 00:08:54 . Memory (MB): peak = 18608.160 ; gain = 8010.211 ; free physical = 78812 ; free virtual = 1164472default:defaulth px� 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px� 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px� 
O
:Phase 3.1 Commit Multi Column Macros | Checksum: ce95fc80
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:19:36 ; elapsed = 00:08:55 . Memory (MB): peak = 18608.160 ; gain = 8010.211 ; free physical = 78801 ; free virtual = 1164362default:defaulth px� 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px� 
R
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 124f7612d
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:20:13 ; elapsed = 00:09:11 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 78689 ; free virtual = 1163232default:defaulth px� 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px� 
L
7Phase 3.3 Area Swap Optimization | Checksum: 1a3ca34b5
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:20:22 ; elapsed = 00:09:17 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 78682 ; free virtual = 1163172default:defaulth px� 
�

Phase %s%s
101*constraints2
3.4 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px� 
T
?Phase 3.4 Pipeline Register Optimization | Checksum: 19f09b62a
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:20:26 ; elapsed = 00:09:21 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 78678 ; free virtual = 1163122default:defaulth px� 
t

Phase %s%s
101*constraints2
3.5 2default:default2%
Fast Optimization2default:defaultZ18-101h px� 
F
1Phase 3.5 Fast Optimization | Checksum: ea312917
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:21:04 ; elapsed = 00:09:40 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 78669 ; free virtual = 1163042default:defaulth px� 
y

Phase %s%s
101*constraints2
3.6 2default:default2*
Small Shape Clustering2default:defaultZ18-101h px� 
L
7Phase 3.6 Small Shape Clustering | Checksum: 1c993d02f
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:22:46 ; elapsed = 00:11:07 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 77596 ; free virtual = 1152312default:defaulth px� 
r

Phase %s%s
101*constraints2
3.7 2default:default2#
DP Optimization2default:defaultZ18-101h px� 
E
0Phase 3.7 DP Optimization | Checksum: 12985f534
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:26:29 ; elapsed = 00:12:46 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 77537 ; free virtual = 1151722default:defaulth px� 


Phase %s%s
101*constraints2
3.8 2default:default20
Flow Legalize Slice Clusters2default:defaultZ18-101h px� 
R
=Phase 3.8 Flow Legalize Slice Clusters | Checksum: 13befd6e0
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:26:35 ; elapsed = 00:12:48 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 77759 ; free virtual = 1153942default:defaulth px� 
r

Phase %s%s
101*constraints2
3.9 2default:default2#
Slice Area Swap2default:defaultZ18-101h px� 
E
0Phase 3.9 Slice Area Swap | Checksum: 193bddaf7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:27:41 ; elapsed = 00:13:15 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 77266 ; free virtual = 1149012default:defaulth px� 
y

Phase %s%s
101*constraints2
3.10 2default:default2)
Commit Slice Clusters2default:defaultZ18-101h px� 
L
7Phase 3.10 Commit Slice Clusters | Checksum: 1ef0f51db
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:28:51 ; elapsed = 00:13:38 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 77096 ; free virtual = 1147312default:defaulth px� 
D
/Phase 3 Detail Placement | Checksum: 1ef0f51db
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:29:01 ; elapsed = 00:13:45 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 78191 ; free virtual = 1158252default:defaulth px� 
�

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px� 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
�

Phase %s%s
101*constraints2
4.1.1 2default:default2/
Post Placement Optimization2default:defaultZ18-101h px� 
V
APost Placement Optimization Initialization | Checksum: 29b460da7
*commonh px� 
u

Phase %s%s
101*constraints2
4.1.1.1 2default:default2"
BUFG Insertion2default:defaultZ18-101h px� 
�
2Processed net %s, inserted BUFG to drive %s loads.34*	placeflow2�
�inst_design_1_wrapper/design_1_i/aurora_64b66b_1/inst/design_1_aurora_64b66b_1_0_core_i/design_1_aurora_64b66b_1_0_wrapper_i/common_reset_cbcc_i/cbcc_fifo_reset_wr_clk2default:default2
10852default:defaultZ46-35h px� 
�
Replicated bufg driver %s39*	placeflow2�
�inst_design_1_wrapper/design_1_i/aurora_64b66b_1/inst/design_1_aurora_64b66b_1_0_core_i/design_1_aurora_64b66b_1_0_wrapper_i/common_reset_cbcc_i/cbcc_fifo_reset_wr_clk_reg_bufg_rep2default:defaultZ46-45h px� 
�
2Processed net %s, inserted BUFG to drive %s loads.34*	placeflow2�
�inst_design_1_wrapper/design_1_i/aurora_64b66b_0/inst/design_1_aurora_64b66b_0_0_core_i/design_1_aurora_64b66b_0_0_wrapper_i/common_reset_cbcc_i/cbcc_fifo_reset_wr_clk2default:default2
10852default:defaultZ46-35h px� 
�
Replicated bufg driver %s39*	placeflow2�
�inst_design_1_wrapper/design_1_i/aurora_64b66b_0/inst/design_1_aurora_64b66b_0_0_core_i/design_1_aurora_64b66b_0_0_wrapper_i/common_reset_cbcc_i/cbcc_fifo_reset_wr_clk_reg_bufg_rep2default:defaultZ46-45h px� 
�
�BUFG insertion identified %s candidate nets, %s success, %s bufg driver replicated, %s skipped for placement/routing, %s skipped for timing, %s skipped for netlist change reason40*	placeflow2
22default:default2
22default:default2
22default:default2
02default:default2
02default:default2
02default:defaultZ46-46h px� 
H
3Phase 4.1.1.1 BUFG Insertion | Checksum: 22a53af6d
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:31:55 ; elapsed = 00:14:38 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 78784 ; free virtual = 1164192default:defaulth px� 
w

Phase %s%s
101*constraints2
4.1.1.2 2default:default2$
BUFG Replication2default:defaultZ18-101h px� 
�
wNet %s has constraints that cannot be copied, and hence, it cannot be cloned. The constraint blocking the cloning is %s378*physynth2�
Dinst_design_1_wrapper/design_1_i/RESET_CTRL_0/inst/PERI_RESET_P_BUFGDinst_design_1_wrapper/design_1_i/RESET_CTRL_0/inst/PERI_RESET_P_BUFG2default:default2�
q @ /home/nakashim/proj-arm64/fpga/VU440-step4000-16st/VU440_16st.srcs/constrs_1/imports/MAP/io_ports_150M.xdc:1382default:default8Z32-716h px� 
z
)Replicated %s BUFGs out of %s candidates
41*	placeflow2
02default:default2
32default:defaultZ46-47h px� 
J
5Phase 4.1.1.2 BUFG Replication | Checksum: 22a53af6d
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:33:04 ; elapsed = 00:14:53 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 78493 ; free virtual = 1161292default:defaulth px� 
�
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
-2.4262default:defaultZ30-746h px� 
r

Phase %s%s
101*constraints2
4.1.1.3 2default:default2
Replication2default:defaultZ18-101h px� 
�
kPost Replication Timing Summary WNS=%s. For the most accurate timing information please run report_timing.
24*	placeflow2
-2.4262default:defaultZ46-19h px� 
E
0Phase 4.1.1.3 Replication | Checksum: 238ee7d97
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:39:14 ; elapsed = 00:19:40 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 78262 ; free virtual = 1158982default:defaulth px� 
S
>Phase 4.1.1 Post Placement Optimization | Checksum: 238ee7d97
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:39:16 ; elapsed = 00:19:42 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 78278 ; free virtual = 1159132default:defaulth px� 
N
9Phase 4.1 Post Commit Optimization | Checksum: 238ee7d97
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:39:18 ; elapsed = 00:19:44 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 78278 ; free virtual = 1159132default:defaulth px� 
�
�Placer has a high congestion level. Please run route_design if needed to identify more accurate regions of congestion. You can use the route congestion metrics in the device view and/or check the logfile for congestion reports.20*	placeflowZ46-14h px� 
y

Phase %s%s
101*constraints2
4.2 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px� 
L
7Phase 4.2 Post Placement Cleanup | Checksum: 238ee7d97
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:39:34 ; elapsed = 00:19:52 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 78365 ; free virtual = 1160002default:defaulth px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.122default:default2
00:00:00.122default:default2
	18803.4802default:default2
0.0002default:default2
784392default:default2
1160742default:defaultZ17-722h px� 
s

Phase %s%s
101*constraints2
4.3 2default:default2$
Placer Reporting2default:defaultZ18-101h px� 
F
1Phase 4.3 Placer Reporting | Checksum: 280901b53
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:39:42 ; elapsed = 00:20:01 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 78444 ; free virtual = 1160792default:defaulth px� 
z

Phase %s%s
101*constraints2
4.4 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.042default:default2
00:00:00.042default:default2
	18803.4802default:default2
0.0002default:default2
784642default:default2
1161002default:defaultZ17-722h px� 
M
8Phase 4.4 Final Placement Cleanup | Checksum: 1d9078f28
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:39:44 ; elapsed = 00:20:03 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 78465 ; free virtual = 1161002default:defaulth px� 
\
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 1d9078f28
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:39:46 ; elapsed = 00:20:05 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 78465 ; free virtual = 1161002default:defaulth px� 
>
)Ending Placer Task | Checksum: 122f2dce9
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:39:46 ; elapsed = 00:20:05 . Memory (MB): peak = 18803.480 ; gain = 8205.531 ; free physical = 79416 ; free virtual = 1170512default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1992default:default2
12default:default2
82default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
place_design: 2default:default2
00:40:002default:default2
00:20:172default:default2
	18803.4802default:default2
8205.5312default:default2
794162default:default2
1170512default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.042default:default2
00:00:00.042default:default2
	18803.4802default:default2
0.0002default:default2
794172default:default2
1170522default:defaultZ17-722h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.162default:default2
00:00:00.042default:default2
	18803.4802default:default2
0.0002default:default2
788842default:default2
1168252default:defaultZ17-722h px� 
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
00:00:562default:default2
00:00:202default:default2
	18803.4802default:default2
0.0002default:default2
779342default:default2
1167242default:defaultZ17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2r
^/home/nakashim/proj-arm64/fpga/VU440-step4000-16st/VU440_16st.runs/impl_1/VU440_TOP_placed.dcp2default:defaultZ17-1381h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2&
write_checkpoint: 2default:default2
00:01:582default:default2
00:01:402default:default2
	18803.4802default:default2
0.0002default:default2
790772default:default2
1169612default:defaultZ17-722h px� 
d
%s4*runtcl2H
4Executing : report_io -file VU440_TOP_io_placed.rpt
2default:defaulth px� 
�
�report_io: Time (s): cpu = 00:00:00.18 ; elapsed = 00:00:00.38 . Memory (MB): peak = 18803.480 ; gain = 0.000 ; free physical = 79005 ; free virtual = 116890
*commonh px� 
�
%s4*runtcl2~
jExecuting : report_utilization -file VU440_TOP_utilization_placed.rpt -pb VU440_TOP_utilization_placed.pb
2default:defaulth px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2(
report_utilization: 2default:default2
00:01:142default:default2
00:01:002default:default2
	18803.4802default:default2
0.0002default:default2
790812default:default2
1169662default:defaultZ17-722h px� 
�
%s4*runtcl2e
QExecuting : report_control_sets -verbose -file VU440_TOP_control_sets_placed.rpt
2default:defaulth px� 
�
�report_control_sets: Time (s): cpu = 00:00:00.70 ; elapsed = 00:00:00.85 . Memory (MB): peak = 18803.480 ; gain = 0.000 ; free physical = 79075 ; free virtual = 116963
*commonh px� 


End Record