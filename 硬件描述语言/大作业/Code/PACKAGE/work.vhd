library ieee;
use ieee.std_logic_1164.all;

package mypackage is
  --自定义类型
  type row is array(natural range<>) of std_logic_vector(7 downto 0);
  --声明加法器模块
  component Adder is
    generic(
      Add_bit : integer := 8
    );
    port(
      A : in std_logic_vector(Add_bit-1 downto 0);
      B : in std_logic_vector(Add_bit-1 downto 0);
      Sum : out std_logic_vector(Add_bit-1 downto 0);
	  Carry : out std_logic
    );
  end component;
  --声明补码模块
  component complement is
    generic(
      Data_bit : integer := 8   --数据位数
    );
    port(
      Data_i : in std_logic_vector(Data_bit-1 downto 0);
      Data_o : out std_logic_vector(Data_bit-1 downto 0)
    );
  end component;
  
end mypackage;