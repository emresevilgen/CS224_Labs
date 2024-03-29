#------------------------------------------------------------
#---------------------- Clock signal ------------------------
#------------------------------------------------------------
set_property PACKAGE_PIN W5 [get_ports clk]
    set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

#------------------------------------------------------------
#-------------------- 7 segment display ---------------------
#------------------------------------------------------------
set_property PACKAGE_PIN W7 [get_ports {C[6]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {C[6]}] 
set_property PACKAGE_PIN W6 [get_ports {C[5]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {C[5]}] 
set_property PACKAGE_PIN U8 [get_ports {C[4]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {C[4]}] 
set_property PACKAGE_PIN V8 [get_ports {C[3]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {C[3]}] 
set_property PACKAGE_PIN U5 [get_ports {C[2]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {C[2]}] 
set_property PACKAGE_PIN V5 [get_ports {C[1]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {C[1]}] 
set_property PACKAGE_PIN U7 [get_ports {C[0]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {C[0]}] 
set_property PACKAGE_PIN V7 [get_ports DP]  	 	 	 	  
 	set_property IOSTANDARD LVCMOS33 [get_ports DP] 
	
set_property PACKAGE_PIN U2 [get_ports {AN[0]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {AN[0]}] 
set_property PACKAGE_PIN U4 [get_ports {AN[1]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {AN[1]}] 
set_property PACKAGE_PIN V4 [get_ports {AN[2]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {AN[2]}] 
set_property PACKAGE_PIN W4 [get_ports {AN[3]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {AN[3]}]
 	
 	
# Buttons
set_property PACKAGE_PIN T17 [get_ports {clkButton}]                          
    set_property IOSTANDARD LVCMOS33 [get_ports {clkButton}] 
set_property PACKAGE_PIN U18 [get_ports {reset}]                          
    set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
    
# LEDs 
set_property PACKAGE_PIN E19 [get_ports {memwrite}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {memwrite}] 
set_property PACKAGE_PIN U16 [get_ports {regwrite}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {regwrite}]    
#set_property PACKAGE_PIN U19 [get_ports {StallD}]                      
#     set_property IOSTANDARD LVCMOS33 [get_ports {StallD}] 
#set_property PACKAGE_PIN V19 [get_ports {StallF}]                      
#     set_property IOSTANDARD LVCMOS33 [get_ports {StallF}]  