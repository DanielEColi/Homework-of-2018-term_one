library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Seg7_digital_LED is
    Port ( 
				clk_50mhz_i : 		in  	STD_LOGIC;
				rst_n_i : 			in  	STD_LOGIC;
				seg7_sel_o : 		out  	STD_LOGIC_VECTOR (7 downto 0);
				seg7_decode_o : 	out  	STD_LOGIC_VECTOR (7 downto 0)
			);
end Seg7_digital_LED;

architecture rtl of Seg7_digital_LED is
	component clk_gen_400hz is
		port(
			rst_n_i : 	in  	STD_LOGIC;
			clk_i : 		in  	STD_LOGIC;
			clk_o : 		out  	STD_LOGIC
		);
	end component;
	
	component shift is
		port(
			clk_i : in  STD_LOGIC;
			rst_n_i : in  STD_LOGIC;
			shift_o : out  STD_LOGIC_VECTOR (7 downto 0)
		);
	end component;
	
	component Seg7_disp is
		port(
			shift_i : in  STD_LOGIC_VECTOR (7 downto 0);
			seg7_code_o : out  STD_LOGIC_VECTOR (7 downto 0)
		);
	end component;
	
	signal s_400hz : std_logic;
	signal s_shift : std_logic_vector(7 downto 0);

begin
	U1	:	clk_gen_400hz port map(
										clk_i => clk_50mhz_i,
										rst_n_i => rst_n_i,
										clk_o => s_400hz
									);
	U2	:	shift port map			 (
										clk_i => s_400hz,
										rst_n_i => rst_n_i,
										shift_o => s_shift
									);
	U3	:	Seg7_disp port map    (
										shift_i => s_shift,
										seg7_code_o => seg7_decode_o
									);
	seg7_sel_o <= s_shift;
end rtl;
