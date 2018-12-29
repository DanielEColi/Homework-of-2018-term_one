library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity row_scan is
    Port ( clk_i : in  STD_LOGIC;    --时钟信号输入
           rst_n_i : in  STD_LOGIC;  --复位信号
           row_o : out  STD_LOGIC_VECTOR (3 downto 0) --行输出
	 );
end row_scan;

architecture rtl of row_scan is
	
	component clk_gen_50hz is
		port(
			clk_i : in  STD_LOGIC;
         rst_n_i : in  STD_LOGIC;
         clk_o : out  STD_LOGIC
		);
	end component;
	
	signal s_clk_50hz : std_logic;
	signal s_row      : std_logic_vector(3 downto 0);
	
begin
	
	i_clk_gen_50hz : clk_gen_50hz   --例化50hz模块
	port map(
		clk_i   => clk_i,
		rst_n_i => rst_n_i,
		clk_o   => s_clk_50hz
	);
	
	process(s_clk_50hz, rst_n_i, s_row)
	begin
		if(rst_n_i = '0')then      --复位信号有效
			s_row <= "1110";       --输出1110
		elsif rising_edge(s_clk_50hz)then         --否则，如果到达时钟上升沿
			s_row <= s_row(0) & s_row(3 downto 1);--移位
		end if;
	end process;
	
	row_o <= s_row;

end rtl;

