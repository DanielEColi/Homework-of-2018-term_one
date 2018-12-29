library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dividor16 is
  port(
    clk_i : in std_logic;
	 start : in std_logic;
	 A : in std_logic_vector(7 downto 0);
	 B : in std_logic_vector(7 downto 0);
	 Fra : out std_logic_vector(15 downto 0)
  );
end Dividor16;

architecture rtl of Dividor16 is
  component Dividor is
    port(
	   clk : in std_logic;
      start : in std_logic;
      A : in std_logic_vector(7 downto 0);
      B : in std_logic_vector(7 downto 0);
      QL : out std_logic_vector(7 downto 0);  --shang
      QH : out std_logic_vector(7 downto 0)
	 );
  end component;
  
  signal s_middle : std_logic_vector(7 downto 0);
begin
  Divto16 : Dividor
  port map(
    clk => clk_i,
	 start => start,
	 A => A,
	 B => B,
	 QL => s_middle,
	 QH => open
  );
  
  Fra <= "00000000" & s_middle;

end rtl;

