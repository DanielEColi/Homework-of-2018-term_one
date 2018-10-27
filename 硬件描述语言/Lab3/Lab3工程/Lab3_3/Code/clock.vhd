library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock is
    Port ( 
			clk_50mhz_i : in  STD_LOGIC;
			rst_n_i : in  STD_LOGIC;
			seg7_sel_o : out  STD_LOGIC_VECTOR (7 downto 0);
			seg7_code_o : out  STD_LOGIC_VECTOR (7 downto 0)
		);
end clock;

architecture rtl of clock is
	component clk_gen_1hz is
		port(
				rst_n_i : 	in  	STD_LOGIC;
				clk_i : 		in  	STD_LOGIC;
				clk_o : 		out  	STD_LOGIC
			);
	end component;
	
	component sec_counter is
		port(
				clk_i : in  STD_LOGIC;
				rst_n_i : in  STD_LOGIC;
				sec_cnt_o : out  STD_LOGIC_VECTOR (5 downto 0);
				min_carry_o : out  STD_LOGIC
			);
	end component;
	
	component min_counter is
		port(
				clk_i : 			in  	STD_LOGIC;
				rst_n_i : 		in  	STD_LOGIC;
				min_cnt_o : 	out  	STD_LOGIC_VECTOR (5 downto 0);
				hour_carry_o : out 	STD_LOGIC
			);
	end component;
	
	component hour_counter is
		port(
				clk_i : in  STD_LOGIC;
				rst_n_i : in  STD_LOGIC;
				hour_cnt_o : out  STD_LOGIC_VECTOR (5 downto 0)
			);
	end component;	
	
	component calc_mod is
		port(
				data_i : in  STD_LOGIC_VECTOR (5 downto 0);
				data_o : out  STD_LOGIC_VECTOR (4 downto 0)
			);
	end component;	
	
	component calc_rem is
		port(
				data_i : in  STD_LOGIC_VECTOR (5 downto 0);
				data_o : out  STD_LOGIC_VECTOR (4 downto 0)
			);
	end component;	
	
	component Seg7_digital_LED is
		port(
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
	end component;		
	
	signal s_1hz	:	std_logic;
	signal s_1min  :  std_logic;
	signal s_1hour :  std_logic;
	signal s_calc_sec : std_logic_vector(5 downto 0);
	signal s_calc_min : std_logic_vector(5 downto 0);
	signal s_calc_hour : std_logic_vector(5 downto 0);
	signal s_sec_h : std_logic_vector(4 downto 0);
	signal s_sec_l : std_logic_vector(4 downto 0);
	signal s_min_h : std_logic_vector(4 downto 0);
	signal s_min_l : std_logic_vector(4 downto 0);
	signal s_hour_h : std_logic_vector(4 downto 0);
	signal s_hour_l : std_logic_vector(4 downto 0);
begin
	U1	:	clk_gen_1hz port map(
											rst_n_i => rst_n_i,
											clk_i   => clk_50mhz_i,
											clk_o   => s_1hz
										);
	U2	:	sec_counter port map(
											clk_i => s_1hz,
											rst_n_i => rst_n_i,
											sec_cnt_o => s_calc_sec,
											min_carry_o => s_1min
										);
	U3	:	min_counter port map(
											clk_i => s_1min,
											rst_n_i => rst_n_i,
											min_cnt_o => s_calc_min,
											hour_carry_o => s_1hour
										);
	U4 :  hour_counter port map(
											clk_i => s_1hour,
											rst_n_i => rst_n_i,
											hour_cnt_o => s_calc_hour
										);
										
	U5 :  calc_mod port map		(
											data_i => s_calc_sec,
											data_o => s_sec_h
										);
	U6 :  calc_mod port map		(
											data_i => s_calc_min,
											data_o => s_min_h
										);
	U7 :  calc_mod port map		(
											data_i => s_calc_hour,
											data_o => s_hour_h
										);
	U8 :  calc_rem port map		(
											data_i => s_calc_sec,
											data_o => s_sec_l
										);
	U9 :  calc_rem port map		(
											data_i => s_calc_min,
											data_o => s_min_l
										);
	U10 :  calc_rem port map	(
											data_i => s_calc_hour,
											data_o => s_hour_l
										);
	U11 :  Seg7_digital_LED port map(
											clk_50mhz_i => clk_50mhz_i,
											rst_n_i => rst_n_i,
											hour_h_i => s_hour_h,
											hour_l_i => s_hour_l,
											min_h_i  => s_min_h,
											min_l_i  => s_min_l,
											sec_h_i  => s_sec_h,
											sec_l_i  => s_sec_l,
											seg7_sel_o => seg7_sel_o,
											seg7_decode_o => seg7_code_o
										);
end rtl;

