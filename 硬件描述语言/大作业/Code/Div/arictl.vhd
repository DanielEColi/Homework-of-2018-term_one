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
  if(start = '1')then --�ߵ�ƽ����������
    sign <= "0000";
  elsif(clk'event and clk = '1')then
    if(sign < 8)then  --С��8�����������8����������ѽ���
      sign <= sign + 1;
    end if;
  end if;
  end process;
  
  process(clk, sign, start)
  begin
    if(start = '0')then
      if(sign < 8)then  --�����������ڽ���
        ariend <= '0';
      else              
        ariend <= '1';  --�������С�ڳ���������������������ٽ���һ�����ڵ�����
      end if;
    else 
      ariend <= '0';
    end if;
  end process;
end rtl;