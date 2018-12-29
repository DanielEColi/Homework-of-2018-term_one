library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity complement is
  generic(
    Data_bit : integer := 8
  );
  port(
    Data_i : in std_logic_vector(Data_bit-1 downto 0);
    Data_o : out std_logic_vector(Data_bit-1 downto 0)
  );
end complement;

architecture rtl of complement is
begin
  Data_o <= (not Data_i) + 1;
end rtl;