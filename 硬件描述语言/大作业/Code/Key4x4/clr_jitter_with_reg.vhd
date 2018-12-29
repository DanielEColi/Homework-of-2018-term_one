library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clr_jitter_with_reg is              --去抖模块
    Port ( clk_50mhz_i : in  STD_LOGIC;    --时钟信号输入
           rst_n_i : in  STD_LOGIC;        --复位信号输入
           button_i : in  STD_LOGIC;       --按键输入
           button_o : out  STD_LOGIC       --去抖结果
	  );
end clr_jitter_with_reg;

architecture rtl of clr_jitter_with_reg is

	component clk_gen_50hz is              --50hz信号模块
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
		if(rst_n_i = '0')then                --复位信号有效
			x <= '0';                        --x信号线为低电平
		elsif rising_edge(s_clk_50hz)then    --如果到时钟上升沿
			x <= button_i;                   --x获取到按键输入值
		end if;
	end process;
	
	process(s_clk_50hz, rst_n_i, x)          
	begin 
		if(rst_n_i = '0')then                --复位信号有效
			y <= '0';                        --y信号线为低电平
		elsif rising_edge(s_clk_50hz)then    --时钟上升沿
			y <= x;                          --y获取x的值
		end if;
	end process;
	
	button_o <= not((not x) and y);

end rtl;

