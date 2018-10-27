library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;use ieee.std_logic_unsigned.all;

entity seg7_decoder is
	port(
		switch_i : in std_logic_vector(4 downto 0);
		seg7_decode_o : out std_logic_vector(7 downto 0)
	);
	
end seg7_decoder;

architecture rtl of seg7_decoder is
	signal outputnum : std_logic_vector(7 downto 0);
begin
	process(switch_i, outputnum)
	begin
		case switch_i is
			when "00000" => outputnum <= "11000000";
			when "00001" => outputnum <= "11111001";
			when "00010" => outputnum <= "10100100";
			when "00011" => outputnum <= "10110000";
			when "00100" => outputnum <= "10011001";
			when "00101" => outputnum <= "10010010";
			when "00110" => outputnum <= "10000010";
			when "00111" => outputnum <= "11111000";
			when "01000" => outputnum <= "10000000";
			when "01001" => outputnum <= "10010000";
			when "01010" => outputnum <= "10001000";
			when "01011" => outputnum <= "10000011";
			when "01100" => outputnum <= "11000110";
			when "01101" => outputnum <= "10100001";
			when "01110" => outputnum <= "10000110";
			when "01111" => outputnum <= "10001110";
			when others  => outputnum <= "11111111";
		end case;	
	end process;
	seg7_decode_o <= outputnum;
end rtl;

