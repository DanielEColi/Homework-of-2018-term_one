library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift is
    Port ( 
				clk_i : in  STD_LOGIC;
				rst_n_i : in  STD_LOGIC;
				shift_o : out  STD_LOGIC_VECTOR (7 downto 0)
			);
end shift;

architecture rtl of shift is
	signal s_shift : std_logic_vector(7 downto 0) := "01111111";
begin
	process(rst_n_i, clk_i, s_shift)
	begin
		if(rst_n_i = '0')then
			s_shift <= "01111111";
		elsif rising_edge(clk_i)then
			s_shift <= s_shift(6 downto 0) & s_shift(7);
		end if;
	end process;
	shift_o <= s_shift;
end rtl;

