library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clk_gen_50hz is
    generic(
		CNT_MAX	:	integer	:=	1000000;  --计数最大值
		CNT_HALF :  integer  := 500000    --计数一半
	 );
	 
	 Port ( clk_i : in  STD_LOGIC;        --主频信号输入
           rst_n_i : in  STD_LOGIC;       --复位信号
           clk_o : out  STD_LOGIC         --输出
	 );
end clk_gen_50hz;

architecture rtl of clk_gen_50hz is
	signal s_cnt : integer range 0 to CNT_MAX := 0;  --计数器
begin
	process(clk_i, rst_n_i, s_cnt)
	begin 
		if(rst_n_i = '0')then             --复位信号有效
			s_cnt <= 0;                   --计数器清零
			clk_o <= '0';                 --时钟输出拉低
		elsif rising_edge(clk_i)then      --时钟输入上升沿
			if(s_cnt = CNT_MAX)then       --计数到最大值
				s_cnt <= 0;               --计数器清零
				clk_o <= '0';             --时钟输出拉低
			elsif(s_cnt = CNT_HALF)then   --计数到一半
				s_cnt <= s_cnt + 1;       --计数器加1
				clk_o <= '1';             --时钟输出拉高
			else
				s_cnt <= s_cnt + 1;       --计数器加1
			end if;
		end if;
	end process;		
end rtl;

