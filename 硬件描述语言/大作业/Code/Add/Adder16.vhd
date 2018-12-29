library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.mypackage.all;

entity Adder16 is
  port(
    A : in std_logic_vector(7 downto 0);
	 B : in std_logic_vector(7 downto 0);
	 Sum : out std_logic_vector(15 downto 0)
  );
end Adder16;

architecture rtl of Adder16 is
  signal s_no_carry_sum : std_logic_vector(7 downto 0);
  signal s_carry : std_logic;
begin
  LowBitOfSum : Adder
  port map(
    A => A,
	 B => B,
	 Sum => s_no_carry_sum,
	 Carry => s_carry
  );
  
  Sum <= "0000000" & s_carry & s_no_carry_sum;
end rtl;

