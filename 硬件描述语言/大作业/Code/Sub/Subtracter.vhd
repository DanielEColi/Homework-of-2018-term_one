library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Subtracter is
  port(
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    Dif : out std_logic_vector(9 downto 0)
  );
end Subtracter;

architecture rtl of Subtracter is
begin
  Dif <= '0' & (A - B);
end rtl;