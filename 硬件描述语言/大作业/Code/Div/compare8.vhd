library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity compare8 is
  port(
    IA_more_than_B : in std_logic;
    IB_more_than_A : in std_logic;
    IA_equal_B     : in std_logic;
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    OA_more_than_B : out std_logic;
    OB_more_than_A : out std_logic;
    OA_equal_B : out std_logic
  );
end compare8;

architecture rtl of compare8 is
begin
  process(IA_more_than_B,IB_more_than_A,IA_equal_B,A,B)
  begin
    if(IA_more_than_B = '1')then
      OA_more_than_B <= '1';
      OB_more_than_A <= '0';
      OA_equal_B <= '0';
    elsif(IB_more_than_A = '1')then
      OA_more_than_B <= '0';
      OB_more_than_A <= '1';
      OA_equal_B <= '0';
    elsif(IA_equal_B = '1')then
      for i in 0 to 7 loop
        if(A(7 - i) > B(7 - i))then
          OA_more_than_B <= '1';
          OB_more_than_A <= '0';
          OA_equal_B <= '0';
          exit;
        elsif(A(7 - i) < B(7 - i))then
          OA_more_than_B <= '0';
          OB_more_than_A <= '1';
          OA_equal_B <= '0';
          exit;
        elsif(i = 7 and A(0) = B(0))then
          OA_more_than_B <= '0';
          OB_more_than_A <= '0';
          OA_equal_B <= '1';
        end if;
      end loop;
    end if;
  end process;
end rtl;