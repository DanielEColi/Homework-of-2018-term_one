library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Key4x4 is
    Port ( clk_50mhz_i : in  STD_LOGIC;
           rst_n_i : in  STD_LOGIC;
			  col_i   : in STD_LOGIC_VECTOR(3 downto 0);
			  row_o   : out STD_LOGIC_VECTOR(3 downto 0);
           led_o : out  STD_LOGIC_VECTOR (3 downto 0)
	 );
end Key4x4;

architecture rtl of Key4x4 is

	component clr_jitter_with_reg is
		port(
			clk_50mhz_i : in  STD_LOGIC;
			rst_n_i : in  STD_LOGIC;
			button_i : in  STD_LOGIC;
			button_o : out  STD_LOGIC
		);
	end component;
	
	component row_scan is
		port(
			clk_i : in  STD_LOGIC;
			rst_n_i : in  STD_LOGIC;
			row_o : out  STD_LOGIC_VECTOR (3 downto 0)
		);
	end component;
	
	component row_delay is
	  port(
		   clk_i : in  STD_LOGIC;
         rst_n_i : in  STD_LOGIC;
         row_i : in  STD_LOGIC_VECTOR (3 downto 0);
         row_reg_o : out  STD_LOGIC_VECTOR (3 downto 0)
	  );
	end component;
	
	component combine is
		port(
			row_i : in  STD_LOGIC_VECTOR (3 downto 0);
         col_i : in  STD_LOGIC_VECTOR (3 downto 0);
         row_col_o : out  STD_LOGIC_VECTOR (7 downto 0)
		);
	end component;
	
	component decoder is
		port(
			clk_i : in  STD_LOGIC;
         rst_n_i : in  STD_LOGIC;
         row_col_i : in  STD_LOGIC_VECTOR (7 downto 0);
         led_o : out  STD_LOGIC_VECTOR (3 downto 0)
		);
	end component;
	
	signal s_row : std_logic_vector(3 downto 0);
	signal s_col : std_logic_vector(3 downto 0);
	signal s_row_reg : std_logic_vector(3 downto 0);
	signal s_row_col : std_logic_vector(7 downto 0);
	
begin
	i_row_scan : row_scan
	port map(
		clk_i => clk_50mhz_i,
		rst_n_i => rst_n_i,
		row_o   => s_row
	);
	
	row_o <= s_row;
	
	i_row_delay : row_delay
	port map(
		clk_i => clk_50mhz_i,
		rst_n_i => rst_n_i,
		row_i => s_row,
		row_reg_o => s_row_reg
	);
	
	i_clr_jitter_with_reg0 : clr_jitter_with_reg
	port map(
		clk_50mhz_i => clk_50mhz_i,
		rst_n_i => rst_n_i,
		button_i => col_i(0),
		button_o => s_col(0)
	);
	
	i_clr_jitter_with_reg1 : clr_jitter_with_reg
	port map(
		clk_50mhz_i => clk_50mhz_i,
		rst_n_i => rst_n_i,
		button_i => col_i(1),
		button_o => s_col(1)
	);
	
	i_clr_jitter_with_reg2 : clr_jitter_with_reg
	port map(
		clk_50mhz_i => clk_50mhz_i,
		rst_n_i => rst_n_i,
		button_i => col_i(2),
		button_o => s_col(2)
	);
	
	i_clr_jitter_with_reg3 : clr_jitter_with_reg
	port map(
		clk_50mhz_i => clk_50mhz_i,
		rst_n_i => rst_n_i,
		button_i => col_i(3),
		button_o => s_col(3)
	);
	
	i_combine : combine
	port map(
		row_i => s_row_reg,
		col_i => s_col,
		row_col_o => s_row_col
	);
	
	i_decoder : decoder
	port map(
		clk_i => clk_50mhz_i,
		rst_n_i => rst_n_i,
		row_col_i => s_row_col,
		led_o => led_o
	);

end rtl;

