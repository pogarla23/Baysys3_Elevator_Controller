set_property PACKAGE_PIN R2 [get_ports clk]
    set_property IOSTANDARD LVCMOS33 [get_ports clk]
    set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF]
 #switches
 set_property PACKAGE_PIN V16 [get_ports F[0]]
  #first floor         
    set_property IOSTANDARD LVCMOS33 [get_ports F[0]]
 set_property PACKAGE_PIN W16 [get_ports F[1]] 
 #second floor
    set_property IOSTANDARD LVCMOS33 [get_ports F[1]]
 set_property PACKAGE_PIN W17 [get_ports F[2]]
  #third floor 
    set_property IOSTANDARD LVCMOS33 [get_ports F[2]]
 set_property PACKAGE_PIN W15 [get_ports F[3]] 
 #blocked
    set_property IOSTANDARD LVCMOS33 [get_ports F[3]]
 # LEDs
 set_property PACKAGE_PIN U3 [get_ports Fout[0]]
    set_property IOSTANDARD LVCMOS33 [get_ports Fout[0]]
 set_property PACKAGE_PIN P3 [get_ports Fout[1]]
    set_property IOSTANDARD LVCMOS33 [get_ports Fout[1]]
 set_property PACKAGE_PIN N3 [get_ports Fout[2]]
    set_property IOSTANDARD LVCMOS33 [get_ports Fout[2]]
 set_property PACKAGE_PIN P1 [get_ports Fout[3]]
    set_property IOSTANDARD LVCMOS33 [get_ports Fout[3]]