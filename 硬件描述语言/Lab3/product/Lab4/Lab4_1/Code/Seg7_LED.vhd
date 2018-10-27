library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Seg7_LED is
    Port ( 
				seg7_decode_i : in  STD_LOGIC_VECTOR (4 downto 0);
				seg7_sel_o : out  STD_LOGIC_VECTOR (7 downto 0);
				seg7_decode_o : out  STD_LOGIC_VECTOR (7 downto 0)
			);
end Seg7_LED;

architecture rtl of Seg7_LED is

begin
	seg7_decode_o <=  "11000000" when seg7_decode_i = "00000" else
							"11111001" when seg7_decode_i = "00001" else
							"10100100" when seg7_decode_i = "00010" else
							"10110000" when seg7_decode_i = "00011" else
							"10011001" when seg7_decode_i = "00100" else
							"10010010" when seg7_decode_i = "00101" else
							"10000010" when seg7_decode_i = "00110" else
							"11111000" when seg7_decode_i = "00111" else
							"10000000" when seg7_decode_i = "01000" else
							"10010000" when seg7_decode_i = "01001" else
							"10001000" when seg7_decode_i = "01010" else
							"10000011" when seg7_decode_i = "01011" else
							"11000110" when seg7_decode_i = "01100" else
							"10100001" when seg7_decode_i = "01101" else
							"10000110" when seg7_decode_i = "01110" else
							"10001110" when seg7_decode_i = "01111" else
							"11000000" when seg7_decode_i = "10000" else
							"11000000" when seg7_decode_i = "10001" else
							"11000000";
	seg7_sel_o <= "00000000";
end rtl;

