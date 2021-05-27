
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name testTx -dir "C:/Users/benzs/Documents/GitHub/CWH_CountingStore/testTx/planAhead_run_3" -part xc6slx9tqg144-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "main01.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {main.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {main01.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top main01 $srcset
add_files [list {main01.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9tqg144-2
