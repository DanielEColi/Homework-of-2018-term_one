library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seg7_disp is
    Port ( 
		shift_i : 			in  	STD_LOGIC_VECTOR(7 downto 0);
		disp_hour_h_i : 	in 	STD_LOGIC_VECTOR(7 downto 0);
		disp_hour_l_i : 	in 	STD_LOGIC_VECTOR(7 downto 0);
		disp_min_h_i : 	in 	STD_LOGIC_VECTOR(7 downto 0);
		disp_min_l_i : 	in 	STD_LOGIC_VECTOR(7 downto 0);
		disp_sec_h_i : 	in 	STD_LOGIC_VECTOR(7 downto 0);
		disp_sec_l_i : 	in 	STD_LOGIC_VECTOR(7 downto 0);
		seg7_code_o : 		out  	STD_LOGIC_VECTOR(7 downto 0)
	  );
end Seg7_disp;

architecture rtl of Seg7_disp is

begin
	process(shift_i)
	begin
		case shift_i is
			when "11111110" => seg7_code_o <= disp_sec_l_i;
			when "11111101" => seg7_code_o <= disp_sec_h_i;
			when "11111011" => seg7_code_o <= "10111111";
			when "11110111" => seg7_code_o <= disp_min_l_i;
			when "11101111" => seg7_code_o <= disp_min_h_i;
			when "11011111" => seg7_code_o <= "10111111";
			when "10111111" => seg7_code_o <= disp_hour_l_i;
			when "01111111" => seg7_code_o <= disp_hour_h_i;
			when others     => seg7_code_o <= "10111111";
		end case;
	end process;
end rtl;

