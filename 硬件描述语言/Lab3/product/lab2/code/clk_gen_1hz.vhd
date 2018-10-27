----------------------------------------------------------------------------------------------------------
--ģ������: clk_gen_1hz
--ժҪ��ʾ: 
--��ǰ�汾: 1.0.0
--ģ������: 
--�������: 20XX��XX��XX�� 
--������Ҫ:
--��Ҫע��:                                                                   
----------------------------------------------------------------------------------------------------------
--ȡ���汾: 
--ģ������:
--�������: 
--�޸�����:
--�޸��ļ�: 
----------------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

---------------------------------------ENTITY DECLARATION-------------------------------------------------
entity clk_gen_1hz is
  generic(
  CNT_MAX : integer := 50000000;
  CNT_HALF: integer := 25000000
  );

  port(
    rst_n_i : in  std_logic;
    clk_i   : in  std_logic;
    clk_o   : out std_logic
    );
end clk_gen_1hz;

----------------------------------------------------------------------------------------------------------

---------------------------------------ARCHITECTURE STRUCTURAL--------------------------------------------
architecture rtl of clk_gen_1hz is

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

