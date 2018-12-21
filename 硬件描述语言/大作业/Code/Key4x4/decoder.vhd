library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
    Port ( clk_i : in  STD_LOGIC;
           rst_n_i : in  STD_LOGIC;
           row_col_i : in  STD_LOGIC_VECTOR (7 downto 0);
           rst_o : out  STD_LOGIC_VECTOR (3 downto 0)
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
	signal s_out : std_logic_vector(3 downto 0);
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
			s_out <= "0000";
		elsif rising_edge(s_clk_50hz)then
			case row_col_i is
				when "01110111" => s_out <= "0001"; --1
				when "01111011" => s_out <= "0010"; --2
				when "01111101" => s_out <= "0011"; --3
				when "01111110" => s_out <= "1010"; --"+"
				when "10110111" => s_out <= "0011"; --4
				when "10111011" => s_out <= "0100"; --5
				when "10111101" => s_out <= "0101"; --6
				when "10111110" => s_out <= "1011"; --"-"
				when "11010111" => s_out <= "0111"; --7
				when "11011011" => s_out <= "1000"; --8
				when "11011101" => s_out <= "1001"; --9
				when "11011110" => s_out <= "1100"; --"*"
				when "11100111" => s_out <= "1110"; --clear
				when "11101011" => s_out <= "0000"; --0
				when "11101101" => s_out <= "1111"; --enter
				when "11101110" => s_out <= "1101"; --"/"
				when others =>  null;
			end case;
		end if;
	end process;
	
	rst_o <= not s_out;
	
end rtl;

