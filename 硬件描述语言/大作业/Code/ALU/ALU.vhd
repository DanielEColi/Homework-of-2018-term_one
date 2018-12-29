library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
  port(
    clk_i : in std_logic;                  --时钟输入口
    A : in std_logic_vector(7 downto 0);   --操作数1
	 B : in std_logic_vector(7 downto 0);  --操作数2
	 Sel : in std_logic_vector(1 downto 0);--选择信号
	 Div : in std_logic;                   --除法有效信号
	 Result : out std_logic_vector(15 downto 0) --结果
  );
end ALU;

architecture rtl of ALU is
  component Adder16 is
    port(
	   A : in std_logic_vector(7 downto 0);
	   B : in std_logic_vector(7 downto 0);
	   Sum : out std_logic_vector(15 downto 0)
	 );
  end component;
  
  component Subtracter is
    port(
	   A : in std_logic_vector(7 downto 0);
      B : in std_logic_vector(7 downto 0);
      Dif : out std_logic_vector(15 downto 0)
	 );
  end component;
  
  component Mutiply is
    port(
	   A : in std_logic_vector(7 downto 0);
      B : in std_logic_vector(7 downto 0);
      Prod : out std_logic_vector(15 downto 0)
	 );
  end component;
  
  component Dividor16 is
    port(
	   clk_i : in std_logic;
	   start : in std_logic;
	   A : in std_logic_vector(7 downto 0);
	   B : in std_logic_vector(7 downto 0);
	   Fra : out std_logic_vector(15 downto 0)
	 );
  end component;
  
  component Mux is
    port(
	   Add_i : in std_logic_vector(15 downto 0);
	   Sub_i : in std_logic_vector(15 downto 0);
	   Mut_i : in std_logic_vector(15 downto 0);
	   Div_i : in std_logic_vector(15 downto 0);
	   Sel   : in std_logic_vector(1 downto 0);
	   Output : out std_logic_vector(15 downto 0)
	 );
  end component;
  
  signal s_sum : std_logic_vector(15 downto 0);
  signal s_dif : std_logic_vector(15 downto 0);
  signal s_prod : std_logic_vector(15 downto 0);
  signal s_fra : std_logic_vector(15 downto 0);
  
begin
  i_adder : Adder16    --例化加法器模块
  port map(
    A => A,
	 B => B,
	 Sum => s_sum
  );
  
  i_subtracter : Subtracter  --例化减法器模块
  port map(
    A => A,
	 B => B,
	 Dif => s_dif
  );
  
  i_mutiply : Mutiply   --例化乘法器模块
  port map(
    A => A,
	 B => B,
	 Prod => s_prod
  );
  
  i_dividor : Dividor16   --例化除法器模块
  port map(
    clk_i => clk_i,
	 start => Div,
	 A => A,
	 B => B,
	 Fra => s_fra
  );
  
  i_mux : Mux   --例化多路复用选择器模块
  port map(
    Add_i => s_sum,
	 Sub_i => s_dif,
	 Mut_i => s_prod,
	 Div_i => s_fra,
	 Sel => Sel,
	 Output => Result
  );
end rtl;

