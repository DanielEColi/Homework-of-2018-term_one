library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity min_counter is
    Port ( 
				clk_i : 			in  	STD_LOGIC;
				rst_n_i : 		in  	STD_LOGIC;
				min_cnt_o : 	out  	STD_LOGIC_VECTOR (5 downto 0);
				hour_carry_o : out 	STD_LOGIC
			);
end min_counter;

architecture rtl of min_counter is
	signal s_carry	:	std_logic := '0';
	signal s_min	:	std_logic_vector(5 downto 0) := "000000";
	
begin
	process(clk_i, rst_n_i)
	begin
		if(rst_n_i = '0')then
			s_carry <= '0';
			s_min   <= "000000";
		elsif rising_edge(clk_i)then
			if(s_min = "111011")then
				s_min <= "000000";
				s_carry <= '1';
			else
				s_min <= s_min + "000001";
				s_carry <= '0';
			end if;
		end if;
	end process;
	min_cnt_o <= s_min;
	hour_carry_o <= s_carry;
end rtl;

