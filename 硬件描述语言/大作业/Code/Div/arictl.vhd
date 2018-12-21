library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity arictl is
  port(
    clk : in std_logic;
    start : in std_logic;
    clkout : out std_logic;
    rstall : out std_logic;
    ariend : out std_logic
  );
end arictl;

architecture rtl of arictl is
  signal sign : std_logic_vector(3 downto 0);
begin
  rstall <= start;
  clkout <= clk;
  
  process(clk, start)
  begin
  if(start = '1')then --高电平计数器清零
    sign <= "0000";
  elsif(clk'event and clk = '1')then
    if(sign < 8)then  --小于8则计数，等于8则表明运算已结束
      sign <= sign + 1;
    end if;
  end if;
  end process;
  
  process(clk, sign, start)
  begin
    if(start = '0')then
      if(sign < 8)then  --除法运算正在进行
        ariend <= '0';
      else              
        ariend <= '1';  --如果余数小于除数，则运算结束，否则，再进行一个周期的运算
      end if;
    else 
      ariend <= '0';
    end if;
  end process;
end rtl;