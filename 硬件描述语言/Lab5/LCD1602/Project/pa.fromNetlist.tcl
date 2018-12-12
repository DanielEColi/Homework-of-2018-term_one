
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name LCD1602 -dir "D:/FPGALab/product/Lab7_debug/Project/planAhead_run_2" -part xc3s250etq144-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/FPGALab/product/Lab7_debug/Project/LCD1602_Disp.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/FPGALab/product/Lab7_debug/Project} }
set_property target_constrs_file "D:/FPGALab/product/Lab7_debug/Code/LCD1602_Disp.ucf" [current_fileset -constrset]
add_files [list {D:/FPGALab/product/Lab7_debug/Code/LCD1602_Disp.ucf}] -fileset [get_property constrset [current_run]]
link_design
