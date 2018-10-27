library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decode is
    Port ( 
		seg7_BCDcode_i : in  STD_LOGIC_VECTOR (4 downto 0);
		seg7_decode_o : out  STD_LOGIC_VECTOR (7 downto 0)
		);
end decode;

architecture rtl of decode is

begin
	process(seg7_BCDcode_i)
	begin
		case seg7_BCDcode_i is
			when "00000" => seg7_decode_o <= "11000000";
			when "00001" => seg7_decode_o <= "11111001";
			when "00010" => seg7_decode_o <= "10100100";
			when "00011" => seg7_decode_o <= "10110000";
			when "00100" => seg7_decode_o <= "10011001";
			when "00101" => seg7_decode_o <= "10010010";
			when "00110" => seg7_decode_o <= "10000010";
			when "00111" => seg7_decode_o <= "11111000";
			when "01000" => seg7_decode_o <= "10000000";
			when "01001" => seg7_decode_o <= "10010000";
			when others  => seg7_decode_o <= "11000000";
		end case;
	end process;
end rtl;

