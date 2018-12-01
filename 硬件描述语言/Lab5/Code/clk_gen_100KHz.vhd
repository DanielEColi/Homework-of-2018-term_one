library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_gen_100KHz is
	 generic(
		CNT_MAX  : integer := 500;
		CNT_HALF : integer := 250
	 );

    Port ( 
		rst_n_i : 	in  	STD_LOGIC;
      clk_i : 		in  	STD_LOGIC;
      clk_o : 		out  	STD_LOGIC
	 );
end clk_gen_100KHz;

architecture rtl of clk_gen_100KHz is
  signal s_cnt   :  integer range 0 to CNT_MAX := 0;
  
begin
  process(clk_i, rst_n_i, s_cnt)
  begin
    if(rst_n_i = '0')then 
      s_cnt <= 0;
      clk_o <= '0';
    elsif rising_edge(clk_i) then
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

