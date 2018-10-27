library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity calc_rem is
    Port ( 
				data_i : in  STD_LOGIC_VECTOR (5 downto 0);
				data_o : out  STD_LOGIC_VECTOR (4 downto 0)
			 );
end calc_rem;

architecture rtl of calc_rem is
	signal s_data : integer range 0 to 59;
	signal s_rem : integer range 0 to 9; 
	
begin
  s_data <= conv_integer(data_i);
  
	process(data_i)
	begin
		if    (s_data >= 0  and s_data <= 9) then
			s_rem <= s_data;
		elsif (s_data >= 10 and s_data <= 19) then 
			s_rem <= s_data - 10;
		elsif (s_data >= 20 and s_data <= 29) then 
			s_rem <= s_data - 20;
		elsif (s_data >= 30 and s_data <= 39) then 
			s_rem <= s_data - 30;
		elsif (s_data >= 40 and s_data <= 49) then 
			s_rem <= s_data - 40;
		elsif (s_data >= 50 and s_data <= 59) then 
			s_rem <= s_data - 50;
		end if;
	end process;
	data_o <= conv_std_logic_vector(s_rem,5);
end rtl; 

