library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity buma is
port(a:in std_logic_vector(7 downto 0);
     b:out std_logic_vector(7 downto 0));
end buma;

architecture behavior of buma is
begin
   b<=(not a) +1;
end behavior;
