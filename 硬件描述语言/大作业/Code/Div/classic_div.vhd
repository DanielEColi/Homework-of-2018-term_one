library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity chufa_1 is
  generic(
    bit_b : integer := 16; --beichushu
    bit_c : integer := 16  --chushu
  );
  port(
    clk : in std_logic;
    beichushu : in std_logic_vector(bit_b-1 downto 0);--bit_b-1
    chushu : in std_logic_vector(bit_c-1 downto 0);--bit_c-1
    shang : out std_logic_vector(bit_b-1 downto 0)
  );--bit_b-1
end chufa_1;

architecture rtl of chufa_1 is
  signal div : std_logic_vector(bit_c downto 0);--chushu'length+1==bit_c
begin
  div <= '0' & chushu;
  process(clk)
    variable bei_div : std_logic_vector(bit_b-1 downto 0);--bit_b-1
    variable bei_sub : std_logic_vector(chushu'length downto 0);--4
  begin
    if clk='1' and clk'event then
      bei_div := beichushu;
      for i in bit_b-1 downto 0 loop--7=bei_div'length=bit_b-1
        bei_sub(chushu'length downto 1) := bei_sub(chushu'length-1 downto 0);
        bei_sub(0) := bei_div(i);
        if bei_sub >= div then
          shang(i) <= '1';
          bei_sub := bei_sub-div;
        else 
          shang(i) <= '0';
        end if;
      end loop;
    end if;
    bei_sub := (others => '0');
  end process;
end rtl;