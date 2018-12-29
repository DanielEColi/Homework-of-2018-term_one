library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity row_delay is
    Port ( clk_i : in  STD_LOGIC;              --时钟信号输入
           rst_n_i : in  STD_LOGIC;            --复位信号
           row_i : in  STD_LOGIC_VECTOR (3 downto 0);  --行输入信号
           row_reg_o : out  STD_LOGIC_VECTOR (3 downto 0)  --延迟后输出信号
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
	i_clk_gen_50hz : clk_gen_50hz	--例化50hz信号模块
	port map(
		clk_i   => clk_i,
		rst_n_i => rst_n_i,
		clk_o   => s_clk_50hz
	);
	
	process(s_clk_50hz, rst_n_i, row_i)
	begin
		if(rst_n_i = '0')then             --如果复位信号有效
			row_reg_o <= "0000";          --输出全为0
		elsif rising_edge(s_clk_50hz)then --否则，如果到时钟上升沿
			row_reg_o <= row_i;           --输出前一个row_i
		end if;
	end process;

end rtl;

