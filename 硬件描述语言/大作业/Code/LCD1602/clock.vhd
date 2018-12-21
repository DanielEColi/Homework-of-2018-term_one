library ieee;
use ieee.std_logic_1164.all;

entity clock is
  port(
    clk_50mhz_i : in std_logic;
    rst_n_i : in std_logic;
    lcd_rs_o  : out  std_logic;
    lcd_wr_o  : out  std_logic;
    lcd_en_o  : out  std_logic;
    lcd_data_o  : out  std_logic_vector(7 downto 0)
  );
end clock;

architecture rtl of clock is
  component clk_gen_1hz is
    port(
      rst_n_i :   in    STD_LOGIC;
      clk_i :     in    STD_LOGIC;
      clk_o :     out    STD_LOGIC
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
      clk_i :       in    STD_LOGIC;
      rst_n_i :     in    STD_LOGIC;
      min_cnt_o :   out    STD_LOGIC_VECTOR (5 downto 0);
      hour_carry_o : out   STD_LOGIC
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
      data_o : out  STD_LOGIC_VECTOR (3 downto 0)
    );
  end component;
  
  component calc_rem is
    port(
      data_i : in  STD_LOGIC_VECTOR (5 downto 0);
      data_o : out  STD_LOGIC_VECTOR (3 downto 0)
    );
  end component;
  
  component LCD1602_Disp is
	port(
		clk_50mhz_i : in  std_logic;
		rst_n_i     : in  std_logic;
		disp_hour_h_i : in std_logic_vector(3 downto 0);
		disp_hour_l_i : in std_logic_vector(3 downto 0);
		disp_min_h_i : in std_logic_vector(3 downto 0);
		disp_min_l_i : in std_logic_vector(3 downto 0);
		disp_sec_h_i : in std_logic_vector(3 downto 0);
		disp_sec_l_i : in std_logic_vector(3 downto 0);
		lcd_rs_o    : out std_logic;
		lcd_wr_o    : out std_logic;
		lcd_en_o    : out std_logic;
		lcd_data_o  : out std_logic_vector(7 downto 0)
	);
  end component;
  
  signal s_clk_1hz : std_logic;
  signal s_1hz	:	std_logic;
  signal s_1min  :  std_logic;
  signal s_1hour :  std_logic;
  signal s_calc_sec : std_logic_vector(5 downto 0);
  signal s_calc_min : std_logic_vector(5 downto 0);
  signal s_calc_hour : std_logic_vector(5 downto 0);
  signal s_sec_h : std_logic_vector(3 downto 0);
  signal s_sec_l : std_logic_vector(3 downto 0);
  signal s_min_h : std_logic_vector(3 downto 0);
  signal s_min_l : std_logic_vector(3 downto 0);
  signal s_hour_h : std_logic_vector(3 downto 0);
  signal s_hour_l : std_logic_vector(3 downto 0);
  
begin
	i_clk_gen_1hz : clk_gen_1hz
	port map(
		rst_n_i => rst_n_i,
		clk_i   => clk_50mhz_i,
		clk_o   => s_clk_1hz
	);
	
	i_sec_counter : sec_counter
	port map(
		clk_i       => s_clk_1hz,
		rst_n_i     => rst_n_i,
		sec_cnt_o   => s_calc_sec,
		min_carry_o => s_1min
	);
	
	i_min_counter : min_counter
	port map(
		clk_i => s_1min,
		rst_n_i => rst_n_i,
		min_cnt_o => s_calc_min,
		hour_carry_o => s_1hour
	);
	
	i_hour_counter : hour_counter
	port map(
		clk_i => s_1hour,
		rst_n_i => rst_n_i,
		hour_cnt_o => s_calc_hour
	);
	
	i_sec_mod : calc_mod
	port map(
		data_i => s_calc_sec,
		data_o => s_sec_h
	);
	
	i_min_mod : calc_mod
	port map(
		data_i => s_calc_min,
		data_o => s_min_h
	);
	
	i_hour_mod : calc_mod
	port map(
		data_i => s_calc_hour,
		data_o => s_hour_h
	);
	
	i_sec_rem : calc_rem
	port map(
		data_i => s_calc_sec,
		data_o => s_sec_l
	);
	
	i_min_rem : calc_rem
	port map(
		data_i => s_calc_min,
		data_o => s_min_l
	);
	
	i_hour_rem : calc_rem
	port map(
		data_i => s_calc_hour,
		data_o => s_hour_l
	);
	
	i_LCD1602_Disp : LCD1602_Disp
	port map(
		clk_50mhz_i => clk_50mhz_i,
		rst_n_i     => rst_n_i,
		disp_hour_h_i => s_hour_h,
		disp_hour_l_i => s_hour_l,
		disp_min_h_i => s_min_h,
		disp_min_l_i => s_min_l,
		disp_sec_h_i => s_sec_h,
		disp_sec_l_i => s_sec_l,
		lcd_rs_o    => lcd_rs_o,
		lcd_wr_o    => lcd_wr_o,
		lcd_en_o    => lcd_en_o,
		lcd_data_o  => lcd_data_o
	);
end rtl;