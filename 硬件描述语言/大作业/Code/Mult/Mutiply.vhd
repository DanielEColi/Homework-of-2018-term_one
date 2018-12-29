library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Mutiply is
  port(
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    Prod : out std_logic_vector(15 downto 0)
  );
end Mutiply;

architecture rtl of Mutiply is
begin 
    Prod <= A * B;
end rtl;