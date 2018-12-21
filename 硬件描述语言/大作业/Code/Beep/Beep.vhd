library ieee;
use ieee.std_logic_1164.all;

entity Beep is
  port(
    clk_i : in std_logic;
    Beep_i : in std_logic;
    Beep_o : out std_logic
  );
end Beep;

architecture rtl of Beep is
begin
  process(Beep_i)
  begin
    if(Beep_i'event)then
                      --此处输出一段时长的脉冲
    end if;
  end process;
end rtl;