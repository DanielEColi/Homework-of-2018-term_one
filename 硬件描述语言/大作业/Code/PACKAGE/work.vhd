library ieee;
use ieee.std_logic_1164.all;

package my_data_types is
  type row is array(15 downto 0) of std_logic_vector(7 downto 0);
  
end my_data_types;