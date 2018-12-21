library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity BitExg is
  port(
    din : in integer range 0 to 25535;
    bit_5 : out std_logic_vector(7 downto 0);
    bit_4 : out std_logic_vector(7 downto 0);
    bit_3 : out std_logic_vector(7 downto 0);
    bit_2 : out std_logic_vector(7 downto 0);
    bit_1 : out std_logic_vector(7 downto 0)
  );
end BitExg;

architecture rtl of BitExg is
  function integer_to_ascii(data : integer) return integer is
    variable rlt : integer range 32 to 125;
  begin
    case data is
      when 0 => rlt := 48;
      when 1 => rlt := 49;
      when 2 => rlt := 50;
      when 3 => rlt := 51;
      when 4 => rlt := 52;
      when 5 => rlt := 53;
      when 6 => rlt := 54;
      when 7 => rlt := 55;
      when 8 => rlt := 56;
      when 9 => rlt := 57;
      when others => rlt := 32;
     end case;
     
     return rlt;
  end integer_to_ascii;

  type each_bit is array(4 downto 0) of integer range 0 to 9;
  signal s_bit : each_bit;
begin
  
  process(din)
    variable cmp : integer range 0 to 100000;
    variable s_data : integer range 0 to 25535;
  begin
    s_data := din;

    for i in 1 to 5 loop
      if(i = 1)then
        cmp := 10000;
      elsif(i = 2)then
        cmp := 1000;
      elsif(i = 3)then
        cmp := 100;
      elsif(i = 4)then
        cmp := 10;
      elsif(i = 5)then
        exit;
      end if;
      
      for j in 0 to 9 loop
        if(s_data <= cmp * (j+1))then
			 s_bit(5 - i) <= j;
			 s_data := s_data - cmp * j;
          exit;
        end if;
      end loop;
    end loop;
    s_bit(0) <= s_data;
  end process;
  
  bit_5 <= conv_std_logic_vector(integer_to_ascii(s_bit(4)),8);
  bit_4 <= conv_std_logic_vector(integer_to_ascii(s_bit(3)),8);
  bit_3 <= conv_std_logic_vector(integer_to_ascii(s_bit(2)),8);
  bit_2 <= conv_std_logic_vector(integer_to_ascii(s_bit(1)),8);
  bit_1 <= conv_std_logic_vector(integer_to_ascii(s_bit(0)),8);
  
end rtl;