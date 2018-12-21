library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity row_delay is
    Port ( clk_i : in  STD_LOGIC;
           rst_n_i : in  STD_LOGIC;
           row_i : in  STD_LOGIC_VECTOR (3 downto 0);
           row_reg_o : out  STD_LOGIC_VECTOR (3 downto 0)
	 );
end row_delay;

architecture rtl of row_delay is
	
	component clk_gen_50hz is
		port(
			clk_i : in  STD_LOGIC;
         rst_n_i : in  STD_LOGIC;
         clk_o : out  STD_LOGIC
		);
	end component;
	
	signal s_clk_50hz : std_logic;
	
begin
	i_clk_gen_50hz : clk_gen_50hz
	port map(
		clk_i   => clk_i,
		rst_n_i => rst_n_i,
		clk_o   => s_clk_50hz
	);
	
	process(s_clk_50hz, rst_n_i, row_i)
	begin
		if(rst_n_i = '0')then
			row_reg_o <= "0000";
		elsif rising_edge(s_clk_50hz)then
			row_reg_o <= row_i;
		end if;
	end process;

end rtl;

