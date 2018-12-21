library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity reg16b is
  port(
    clk : in std_logic;
    cin : in std_logic;
    load : in std_logic;
    ariend : in std_logic;
    a : in std_logic_vector(7 downto 0);
    d : in std_logic_vector(7 downto 0);
    qh : out std_logic_vector(7 downto 0);
    ql : out std_logic_vector(7 downto 0)
  );
end reg16b;

architecture rtl of reg16b is
  signal r16s : std_logic_vector(15 downto 0);
begin
  process(clk, load, ariend)
  begin
    if(clk'event and clk = '1')then
      if(ariend = '0')then
        if(load = '1')then			--装载新数据
          r16s(15 downto 0) <= "00000000" & A(7 downto 0);
        elsif(load = '0')then
          r16s(15 downto 9) <= d(6 downto 0);
          r16s(8 downto 1) <= r16s(7 downto 0);  --数据左移
          r16s(0) <= '0';		--最后一位补0
          if(cin = '1')then  --如果比较器输出为1，则第二位值为1
            r16s(1) <= '1';
          end if;
        end if;
      else
        if(cin = '1')then    --余数如果大于除数，则再进行一次减法
          r16s(15 downto 8) <= d(7 downto 0);
          r16s(7 downto 0) <= r16s(7 downto 0) + 1;  
        end if;
      end if;
    end if;
  end process;
  
  qh <= r16s(15 downto 8);
  ql <= r16s(7 downto 0);
end rtl;