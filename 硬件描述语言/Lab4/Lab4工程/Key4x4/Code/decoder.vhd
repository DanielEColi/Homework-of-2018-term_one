library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
    Port ( clk_i : in  STD_LOGIC;
           rst_n_i : in  STD_LOGIC;
           row_col_i : in  STD_LOGIC_VECTOR (7 downto 0);
           led_o : out  STD_LOGIC_VECTOR (3 downto 0)
	 );
end decoder;

architecture rtl of decoder is

	component clk_gen_50hz is
		port(
			clk_i : in  STD_LOGIC;
         rst_n_i : in  STD_LOGIC;
         clk_o : out  STD_LOGIC
		);
	end component;
	
	signal s_clk_50hz : std_logic;
	signal s_led : std_logic_vector(3 downto 0);
begin
	
	i_clk_gen_50hz : clk_gen_50hz
	port map(
		clk_i   => clk_i,
		rst_n_i => rst_n_i,
		clk_o   => s_clk_50hz
	);

	process(s_clk_50hz, rst_n_i, row_col_i)
	begin
		if(rst_n_i = '0')then
			s_led <= "0000";
		elsif rising_edge(s_clk_50hz)then
			case row_col_i is
				when "01110111" => s_led <= "0000";
				when "01111011" => s_led <= "0001";
				when "01111101" => s_led <= "0010";
				when "01111110" => s_led <= "0011";
				when "10110111" => s_led <= "0100";
				when "10111011" => s_led <= "0101";
				when "10111101" => s_led <= "0110";
				when "10111110" => s_led <= "0111";
				when "11010111" => s_led <= "1000";
				when "11011011" => s_led <= "1001";
				when "11011101" => s_led <= "1010";
				when "11011110" => s_led <= "1011";
				when "11100111" => s_led <= "1100";
				when "11101011" => s_led <= "1101";
				when "11101101" => s_led <= "1110";
				when "11101110" => s_led <= "1111";
				when others =>  null;
			end case;
		end if;
	end process;
	
	led_o <= not s_led;
	
end rtl;

