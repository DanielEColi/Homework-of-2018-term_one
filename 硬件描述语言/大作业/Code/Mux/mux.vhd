library ieee;
use ieee.std_logic_1164.all;

entity Mux is
  port(
    Add_i : in std_logic_vector(15 downto 0);  --加法结果
	 Sub_i : in std_logic_vector(15 downto 0); --减法结果
	 Mut_i : in std_logic_vector(15 downto 0); --乘法结果
	 Div_i : in std_logic_vector(15 downto 0); --除法结果
	 Sel   : in std_logic_vector(1 downto 0);  --选择信号
	 Output : out std_logic_vector(15 downto 0)--结果输出
  );
end Mux;

architecture rtl of Mux is
begin
  with Sel select
    Output <= Add_i when "00",
              Sub_i when "01",
              Mut_i when "10",
              Div_i when others;
				
end rtl;