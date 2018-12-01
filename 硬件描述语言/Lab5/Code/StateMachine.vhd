library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity StateMachine is
	generic(
		CNT_MAX : integer := 2000
	);
	port(
		clk_i : in std_logic;
		rst_n_i : in std_logic;
		--lcd_rs_o : out std_logic;
		--lcd_wr_o : out std_logic;
		--lcd_en_o : out std_logic;
		state_o : out std_logic_vector(3 downto 0)
	);
end StateMachine;

architecture rtl of StateMachine is
	type state is (s_rst, s_38H, s_08H, s_01H, s_06H, s_0cH, s_addr, s_write);
	signal pr_state, nx_state	:	state;
	signal s_cnt : integer range 0 to CNT_MAX := 0;
begin
------------------lower section---------------------	
	process(clk_i, rst_n_i)
	begin
		if(rst_n_i = '0')then
			pr_state <= s_rst;
		elsif (clk_i'event and clk_i = '1')then
			pr_state <= nx_state;
		end if;
	end process;
-----------------upper section----------------------
	process(clk_i, pr_state)
	begin
		case pr_state is
		when s_rst =>
			if(clk_i'event and clk_i = '1')then
				s_cnt <= s_cnt + 1;
			end if;
			if(s_cnt < 1500)then
				nx_state <= s_rst;
				state_o <= "0000";
			elsif(s_cnt >= 1500)then
				s_cnt <= 0;
				nx_state <= s_38H;
			end if;
		when s_38H =>
			if(clk_i'event and clk_i = '1')then
				s_cnt <= s_cnt + 1;
			end if;
			if(s_cnt < 4)then
				nx_state <= s_38H;
				state_o <= "0001";
			elsif(s_cnt >= 4)then
				s_cnt <= 0;
				nx_state <= s_08H;
			end if;
		when s_08H =>
			if(clk_i'event and clk_i = '1')then
				s_cnt <= s_cnt + 1;
			end if;
			if(s_cnt < 4)then
				nx_state <= s_08H;
				state_o <= "0010";
			elsif(s_cnt >= 4)then
				s_cnt <= 0;
				nx_state <= s_01H;
			end if;
		when s_01H =>
			if(clk_i'event and clk_i = '1')then
				s_cnt <= s_cnt + 1;
			end if;
			if(s_cnt < 1640)then
				nx_state <= s_01H;
				state_o <= "0011";
			elsif(s_cnt >= 1640)then
				s_cnt <= 0;
				nx_state <= s_06H;
			end if;
		when s_06H =>
			if(clk_i'event and clk_i = '1')then
				s_cnt <= s_cnt + 1;
			end if;
			if(s_cnt < 4)then
				nx_state <= s_06H;
				state_o <= "0100";
			elsif(s_cnt >= 4)then
				s_cnt <= 0;
				nx_state <= s_0cH;
			end if;
		when s_0cH =>
			if(clk_i'event and clk_i = '1')then
				s_cnt <= s_cnt + 1;
			end if;
			if(s_cnt < 4)then
				nx_state <= s_0cH;
				state_o <= "0101";
			elsif(s_cnt >= 4)then
				s_cnt <= 0;
				nx_state <= s_addr;
			end if;
		when s_addr =>
			if(clk_i'event and clk_i = '1')then
				s_cnt <= s_cnt + 1;
			end if;
			if(s_cnt < 4)then
				nx_state <= s_addr;
				state_o <= "0110";
			elsif(s_cnt >= 4)then
				s_cnt <= 0;
				nx_state <= s_write;
			end if;
		when s_write =>
			if(clk_i'event and clk_i = '1')then
				s_cnt <= s_cnt + 1;
			end if;
			if(s_cnt < 4)then
				nx_state <= s_write;
				state_o <= "0111";
			elsif(s_cnt >= 4)then
				s_cnt <= 0;
				nx_state <= s_addr;
			end if;
		end case;
	end process;
end rtl;

