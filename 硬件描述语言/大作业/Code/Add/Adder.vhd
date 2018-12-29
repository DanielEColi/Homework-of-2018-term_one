library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Adder is
  generic(
    Add_bit : integer := 8
  );
  port(
    A : in std_logic_vector(Add_bit-1 downto 0);
    B : in std_logic_vector(Add_bit-1 downto 0);
    Sum : out std_logic_vector(Add_bit-1 downto 0);
	 Carry : out std_logic
  );
end Adder;

architecture rtl of Adder is
  signal s_sum : std_logic_vector(Add_bit-1 downto 0);
  signal s_carry : std_logic_vector(Add_bit downto 0);
begin
  process(A, B, s_carry)
  begin
    s_carry(0) <= '0';
    for i in A'low to A'high loop
      s_sum(i) <= A(i) xor B(i) xor s_carry(i);
      s_carry(i+1) <= (A(i) and B(i)) or (A(i) and s_carry(i)) or (B(i) and s_carry(i));
    end loop;
  end process;
  
  Sum <= s_sum;
  Carry <= s_carry(Add_bit);
end rtl;