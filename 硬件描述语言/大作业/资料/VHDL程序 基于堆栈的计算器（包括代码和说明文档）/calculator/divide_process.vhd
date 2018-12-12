library ieee;
use ieee.std_logic_1164.all;
entity divide_process is 
port(din1,din2:  in std_logic_vector(7 downto 0);
     result_overflow:out std_logic);
     
end divide_process;

architecture behav of divide_process is
begin  
    result_overflow<='1' when (din2="00000000" or din2="10000000" )  else
                     '0';
end behav;	