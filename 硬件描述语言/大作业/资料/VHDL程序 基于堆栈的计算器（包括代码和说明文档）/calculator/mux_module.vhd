library ieee;
use ieee.std_logic_1164.all;
entity mux_module is 
port(di0,di1,di2,di3,di4	:  in std_logic_vector(7 downto 0);
     dk0,dk1,dk2,dk3  :  in std_logic;
     sel  :  in std_logic_vector(2 downto 0);
     dout  :  out std_logic_vector(7 downto 0);
     opearation_overflow:out std_logic);
     
end mux_module;
architecture archmux of mux_module is
 begin  
    with sel select
         dout<=di0 when "000",
	           di1 when "001",
	           di2 when "010",
	           di3 when "011",
	           di4 when "100",
	           "00000000" when  others;
	with sel select
         opearation_overflow<=dk0 when "001",
	                          dk1 when "010",
	                          dk2 when "011",
	                          dk3 when "100",
	                          '0' when  others;
	
end archmux;	