library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Key1x1 is
    Port ( clk_50mhz_i : in  STD_LOGIC;
           rst_n_i : in  STD_LOGIC;
           button_i : in  STD_LOGIC;
           led_o : out  STD_LOGIC_VECTOR (3 downto 0)
	  );
end Key1x1;

architecture rtl of Key1x1 is
	
	component clr_jitter_with_reg is
		port(
			clk_50mhz_i : in  STD_LOGIC;
         rst_n_i : in  STD_LOGIC;
         button_i : in  STD_LOGIC;
         button_o : out  STD_LOGIC
		);
	end component;
	
	signal s_btn_after_clr_jitter : std_logic;
	signal s_cnt						: std_logic_vector(3 downto 0);
	
begin
	i_clr_jitter_with_reg : clr_jitter_with_reg
	port map(
		clk_50mhz_i => clk_50mhz_i,
		rst_n_i     => rst_n_i,
		button_i    => button_i,
		button_o    => s_btn_after_clr_jitter
	);
	
	process(s_btn_after_clr_jitter, rst_n_i)
	begin
		if(rst_n_i = '0')then
			s_cnt <= "0000";
		elsif rising_edge(s_btn_after_clr_jitter)then
			s_cnt <= s_cnt + "0001";
		end if;
	end process;
	
	led_o <= not s_cnt;
	
end rtl;

