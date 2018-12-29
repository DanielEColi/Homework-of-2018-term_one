library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity combine is
    Port ( row_i : in  STD_LOGIC_VECTOR (3 downto 0);
           col_i : in  STD_LOGIC_VECTOR (3 downto 0);
           row_col_o : out  STD_LOGIC_VECTOR (7 downto 0)
	 );
end combine;

architecture rtl of combine is

begin
	row_col_o <= row_i & col_i;       --将行和列拼接在一起输出

end rtl;

