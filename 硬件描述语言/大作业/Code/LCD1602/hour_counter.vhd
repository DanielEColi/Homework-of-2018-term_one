library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity hour_counter is
    Port ( 
				clk_i : in  STD_LOGIC;
				rst_n_i : in  STD_LOGIC;
				hour_cnt_o : out  STD_LOGIC_VECTOR (5 downto 0)
			);
end hour_counter;

architecture rtl of hour_counter is
	signal s_hour : std_logic_vector(5 downto 0) := "000000";
	
begin
	process(clk_i, rst_n_i)
	begin
		if(rst_n_i = '0')then
			s_hour <= "000000";
		elsif rising_edge(clk_i)then
			if(s_hour = "10111")then
				s_hour <= "000000";
			else
				s_hour <= s_hour + "000001";
			end if;
		end if;
	end process;
	hour_cnt_o <= s_hour;
end rtl;

