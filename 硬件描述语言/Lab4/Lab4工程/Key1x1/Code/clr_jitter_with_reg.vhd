library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clr_jitter_with_reg is
    Port ( clk_50mhz_i : in  STD_LOGIC;
           rst_n_i : in  STD_LOGIC;
           button_i : in  STD_LOGIC;
           button_o : out  STD_LOGIC
	  );
end clr_jitter_with_reg;

architecture rtl of clr_jitter_with_reg is

	component clk_gen_50hz is
		port(
			clk_i : in  STD_LOGIC;
         rst_n_i : in  STD_LOGIC;
         clk_o : out  STD_LOGIC
		);
	end component;
	
	signal s_clk_50hz : std_logic;
	signal x          : std_logic;
	signal y          : std_logic;
begin
	i_clk_gen_50hz : clk_gen_50hz
	port map(
		clk_i   => clk_50mhz_i,
		rst_n_i => rst_n_i,
		clk_o   => s_clk_50hz
	);
	
	process(s_clk_50hz, rst_n_i, button_i)
	begin
		if(rst_n_i = '0')then
			x <= '0';
		elsif rising_edge(s_clk_50hz)then
			x <= button_i;
		end if;
	end process;
	
	process(s_clk_50hz, rst_n_i, x)
	begin
		if(rst_n_i = '0')then
			y <= '0';
		elsif rising_edge(s_clk_50hz)then
			y <= x;
		end if;
	end process;
	
	button_o <= (not x) and y;

end rtl;

