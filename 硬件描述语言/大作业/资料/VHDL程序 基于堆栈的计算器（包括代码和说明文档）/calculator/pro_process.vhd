library ieee;
use ieee.std_logic_1164.all;
entity pro_process is 
port(product:  in std_logic_vector(15 downto 0);
     dout  :  out std_logic_vector(7 downto 0);
     result_overflow:out std_logic);
     
end pro_process;
architecture behav of pro_process is
 begin  
    result_overflow<='0' when (product(14 downto 7)="00000000")   else
                     '0' when (product(14 downto 7)="11111111")   else
                     '1';
    dout<=product(15)&product(6 downto 0);
end behav;	