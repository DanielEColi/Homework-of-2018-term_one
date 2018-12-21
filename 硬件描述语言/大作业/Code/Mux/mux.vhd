library ieee;
use ieee.std_logic_1164.all;

entity mux is
  port(
    di0 : in std_logic_vector(7 downto 0);
    di1 : in std_logic_vector(7 downto 0);
    di2 : in std_logic_vector(7 downto 0);
    di3 : in std_logic_vector(7 downto 0);
    di4 : in std_logic_vector(7 downto 0);
    dk0 : in std_logic;
    dk1 : in std_logic;
    dk2 : in std_logic;
    dk3 : in std_logic;
    sel : in std_logic_vector(2 downto 0);
    dout : out std_logic_vector(7 downto 0);
    opearation_overflow : out std_logic
  );
end mux;

architecture rtl of mux is
begin
  with sel select
    dout <= di0 when "000",
            di1 when "001",
            di2 when "010",
            di3 when "011",
            di4 when "100",
            "00000000" when others;
				
  with sel select
    opearation_overflow <= dk0 when "001",
                           dk1 when "010",
                           dk2 when "011",
                           dk3 when "100",
                           '0' when others;
end rtl;