library ieee;
use ieee.std_logic_1164.all;
use work.mypackage.all;

entity Subtracter is
  port(
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    Dif : out std_logic_vector(15 downto 0)
  );
end Subtracter;

architecture rtl of Subtracter is
  signal s_complement : std_logic_vector(7 downto 0);
  signal s_sum : std_logic_vector(7 downto 0);
begin
  ComplementOfSub : complement
  port map(
    Data_i => B,
	 Data_o => s_complement
  );
  
  AdderOfSub : Adder
  port map(
    A => A,
	 B => s_complement,
	 Sum => s_sum,
	 Carry => open
  );
  
  Dif <= "00000000" & s_sum;
end rtl;