library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;use ieee.std_logic_unsigned.all;

entity seg7 is
	port(
		rst_n_i : in std_logic;
		clk_50mhz_i : in std_logic;
		seg7_decode_i : in std_logic_vector(4 downto 0);
		seg7_sel_o    : out std_logic_vector(7 downto 0);
		seg7_decode_o : out std_logic_vector(7 downto 0)
	);
end seg7;

architecture rtl of seg7 is
component clk_gen_500hz is
	port(
		rst_n_i : in std_logic;
		clk_i   : in std_logic;
		clk_o   : out std_logic
	);
end component;

component shifter is
	port(
		clk_i : in std_logic;
		rst_n_i : in std_logic;
		shift_o : out std_logic_vector(7 downto 0)
	);
end component;

component seg7_decoder is
	port(
		switch_i : in std_logic_vector(4 downto 0);
		seg7_decode_o : out std_logic_vector(7 downto 0)
	);
end component;

signal mid_500hz : std_logic;
begin
	U1	:	clk_gen_500hz port map(
												rst_n_i => rst_n_i,
												clk_i => clk_50mhz_i,
												clk_o => mid_500hz
											);
	U2	:	shifter port map(
										clk_i => mid_500hz,
										rst_n_i => rst_n_i,
										shift_o => seg7_sel_o
									);
	U3	:	seg7_decoder port map(
								switch_i => seg7_decode_i,
								seg7_decode_o => seg7_decode_o
								);
end rtl;

