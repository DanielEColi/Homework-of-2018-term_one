library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity subtractor is
  port(
    cin1 : in std_logic;
    cin2 : in std_logic;
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    S : out std_logic_vector(7 downto 0);
    cout : out std_logic
  );
end subtractor;

architecture rtl of subtractor is
begin
  process(cin1, cin2, A, B)
  begin
	if(cin1 = '1' or cin2 = '1')then
		S <= A - B;
    cout <= '1';
	else
		S <= A;
    cout <= '0';
	end if;
  end process;
end rtl;