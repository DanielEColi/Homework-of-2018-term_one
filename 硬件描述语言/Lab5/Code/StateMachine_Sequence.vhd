library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity StateMachine_Sequence is
	port(
		clk_i : in std_logic;
		rst_n_i : in std_logic;
		state_i : in std_logic_vector(3 downto 0);
		lcd_rs_o : out std_logic;
		lcd_wr_o : out std_logic;
		lcd_en_o : out std_logic;
		lcd_data_o : out std_logic_vector(7 downto 0)
	);
end StateMachine_Sequence;

architecture rtl of StateMachine_Sequence is

begin


end rtl;

