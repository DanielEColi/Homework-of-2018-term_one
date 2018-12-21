library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity check is
	port(
			clk	:	in	std_logic;
			rst_n_i	:	in	std_logic;
			input	:	in	std_logic;
			output	:	out std_logic
		);
end check;

architecture rtl of check is
	type state is	(state0, state1, state2, state3);
	signal pr_state, nx_state	:	state;
begin
------------------lower section---------------------
		process(clk,rst_n_i)
		begin
			if(rst_n_i = '0')then
				pr_state	<=	state0;
			elsif (clk'event and clk = '1')then
				pr_state <= nx_state;
			end if;
		end process;
		
-----------------upper section----------------------
		process(input, pr_state)
		begin
			case pr_state is
			when state0 =>
				if(input = '1')then
					output <= '0';
					nx_state <= state1;
				elsif(input = '0')then
					output <= '0';
					nx_state <= state0;
				end if;
			when state1 =>
				if(input = '1')then
					output <= '0';
					nx_state <= state2;
				elsif(input = '0')then
					output <= '0';
					nx_state <= state0;
				end if;
			when state2 =>
				if(input = '1')then
					output <= '1';
					nx_state <= state3;
				elsif(input = '0')then
					output <= '0';
					nx_state <= state0;
				end if;
			when state3 =>
				if(input = '1')then
					output <= '1';
					nx_state <= state3;
				elsif(input = '0')then
					output <= '0';
					nx_state <= state0;
				end if;
			end case;
		end process;	
end rtl;

