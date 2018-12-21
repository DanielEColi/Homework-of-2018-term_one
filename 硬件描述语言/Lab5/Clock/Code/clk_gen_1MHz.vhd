library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--用于产生频率为1MHz的时钟信号
entity clk_gen_1MHz is
  generic(
    CNT_MAX  : integer := 50;
    CNT_HALF : integer := 25
  );

  Port( 
    rst_n_i : 	in  	STD_LOGIC;
    clk_i : 		in  	STD_LOGIC;
    clk_o : 		out  	STD_LOGIC
  );
end clk_gen_1MHz;

architecture rtl of clk_gen_1MHz is
  signal s_cnt   :  integer range 0 to CNT_MAX := 0;
  
begin
  process(clk_i, rst_n_i, s_cnt)
  begin
    if(rst_n_i = '0')then         --复位信号有效时
      s_cnt <= 0;
      clk_o <= '0';
    elsif rising_edge(clk_i) then --时钟上升沿时
      if (s_cnt = CNT_MAX) then
        s_cnt <= 0;
        clk_o <= '0';
      elsif (s_cnt = CNT_HALF) then
        s_cnt <= s_cnt + 1;
        clk_o <= '1';
      else
        s_cnt <= s_cnt + 1;
      end if;
    end if;
  end process;
end rtl;

