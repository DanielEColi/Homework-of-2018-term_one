library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seg7_disp is
    Port ( 
		shift_i : in  STD_LOGIC_VECTOR (7 downto 0);
		seg7_code_o : out  STD_LOGIC_VECTOR (7 downto 0)
	  );
end Seg7_disp;

architecture rtl of Seg7_disp is

begin
	process(shift_i)
	begin
		case shift_i is
			when "11111110" => seg7_code_o <= "11111001";
			when "11111101" => seg7_code_o <= "10100100";
			when "11111011" => seg7_code_o <= "10110000";
			when "11110111" => seg7_code_o <= "10011001";
			when "11101111" => seg7_code_o <= "10010010";
			when "11011111" => seg7_code_o <= "10000010";
			when "10111111" => seg7_code_o <= "11111000";
			when "01111111" => seg7_code_o <= "10000000";
			when others     => seg7_code_o <= "11111001";
		end case;
	end process;
end rtl;

