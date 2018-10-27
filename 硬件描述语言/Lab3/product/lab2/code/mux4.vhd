library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

---------------------------------------ENTITY DECLARATION-------------------------------------------------
entity mux4 is
	port(
		sel_i : in    std_logic_vector(1 downto 0);
		y_o   : out 	std_logic_vector(3 downto 0)
	);
end mux4;

----------------------------------------------------------------------------------------------------------

---------------------------------------ARCHITECTURE STRUCTURAL--------------------------------------------
architecture rtl of mux4 is

--begin
--	process(sel_i)
	begin 
--		case sel_i is
--			when "00" => y_o <= "1110";
--			when "01" => y_o <= "1101";
--			when "10" => y_o <= "1011";
--			when "11" => y_o <= "0111";
--			when others => y_o <= "1111";
--		end case;
WITH sel_i SELECT	
		y_o <=   "1110" WHEN "00",
					"1101" WHEN "01",
					"1011" WHEN "10",
					"0111" WHEN "11",
					"1111" WHEN OTHERS;
--	end process;
end rtl;
