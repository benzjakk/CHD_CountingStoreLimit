
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name testTx -dir "C:/Users/benzs/Documents/GitHub/CWH_CountingStore/testTx/planAhead_run_1" -part xc3s400tq144-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "UART_TX.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {main.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top UART_TX $srcset
add_files [list {UART_TX.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s400tq144-4
