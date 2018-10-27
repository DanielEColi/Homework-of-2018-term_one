library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;use ieee.std_logic_unsigned.all;

entity shifter is
	port(
		clk_i : in std_logic;
		rst_n_i : in std_logic;
		shift_o : out std_logic_vector(7 downto 0)
	);

end shifter;

architecture rtl of shifter is
	signal s_shift : std_logic_vector(7 downto 0);
begin
	process(rst_n_i, clk_i, s_shift)
	begin
		if(rst_n_i = '0')then
			s_shift <= "00000000";
		elsif rising_edge(clk_i)then
			s_shift <= s_shift(6 downto 0) & s_shift(7);
		end if;
	end process;
	shift_o <= s_shift;
end rtl;

