library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Seg7_digital_LED is
    Port ( 
				clk_50mhz_i : 		in  	STD_LOGIC;
				rst_n_i : 			in  	STD_LOGIC;
				hour_h_i :        in    STD_LOGIC_VECTOR (4 downto 0);
				hour_l_i :        in    STD_LOGIC_VECTOR (4 downto 0);
				min_h_i  :        in    STD_LOGIC_VECTOR (4 downto 0);
				min_l_i  :        in    STD_LOGIC_VECTOR (4 downto 0);
				sec_h_i  :        in    STD_LOGIC_VECTOR (4 downto 0);
				sec_l_i  :        in    STD_LOGIC_VECTOR (4 downto 0);
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
	
	component decode is
		port(
			seg7_BCDcode_i : in  STD_LOGIC_VECTOR (4 downto 0);
			seg7_decode_o : out  STD_LOGIC_VECTOR (7 downto 0)
		);
	end component;
	
	component Seg7_disp is
		port(
			shift_i : 			in  	STD_LOGIC_VECTOR(7 downto 0);
			disp_hour_h_i : 	in 	STD_LOGIC_VECTOR(7 downto 0);
			disp_hour_l_i : 	in 	STD_LOGIC_VECTOR(7 downto 0);
			disp_min_h_i : 	in 	STD_LOGIC_VECTOR(7 downto 0);
			disp_min_l_i : 	in 	STD_LOGIC_VECTOR(7 downto 0);
			disp_sec_h_i : 	in 	STD_LOGIC_VECTOR(7 downto 0);
			disp_sec_l_i : 	in 	STD_LOGIC_VECTOR(7 downto 0);
			seg7_code_o : 		out  	STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;
	
	signal s_400hz : std_logic;
	signal s_shift : std_logic_vector(7 downto 0);
	signal s_hour_h : std_logic_vector(7 downto 0);
	signal s_hour_l : std_logic_vector(7 downto 0);
	signal s_min_h : std_logic_vector(7 downto 0);
	signal s_min_l : std_logic_vector(7 downto 0);
	signal s_sec_h : std_logic_vector(7 downto 0);
	signal s_sec_l : std_logic_vector(7 downto 0);

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
	U3 : decode port map(
										seg7_BCDcode_i => hour_h_i,
										seg7_decode_o  => s_hour_h
							);
							
	U4 : decode port map(
										seg7_BCDcode_i => hour_l_i,
										seg7_decode_o  => s_hour_l
							);
							
	U5 : decode port map(
										seg7_BCDcode_i => min_h_i,
										seg7_decode_o  => s_min_h
							);
							
	U6 : decode port map(
										seg7_BCDcode_i => min_l_i,
										seg7_decode_o  => s_min_l
							);
							
	U7 : decode port map(
										seg7_BCDcode_i => sec_h_i,
										seg7_decode_o  => s_sec_h
							);
							
	U8 : decode port map(
										seg7_BCDcode_i => sec_l_i,
										seg7_decode_o  => s_sec_l
							);
							
	U9	:	Seg7_disp port map    (
										shift_i => s_shift,
										disp_hour_h_i => s_hour_h,
										disp_hour_l_i => s_hour_l,
										disp_min_h_i => s_min_h,
										disp_min_l_i => s_min_l,
										disp_sec_h_i => s_sec_h,
										disp_sec_l_i => s_sec_l,
										seg7_code_o => seg7_decode_o
									);
	seg7_sel_o <= s_shift;
end rtl;
