library ieee;
use ieee.std_logic_1164.all;

entity Manager is
  port(
    rst_n_i : in std_logic;
	 wr_en : in std_logic;
	 decode : in std_logic_vector(3 downto 0);
	 set_rst : out std_logic;
	 clear : out std_logic;
	 div : out std_logic;
	 A : out std_logic_vector(7 downto 0);
	 B : out std_logic_vector(7 downto 0);
	 sel : out std_logic_vector(1 downto 0)
  );
end Manager;

architecture rtl of Manager is  
  type state is (s_num, s_clear, s_operator, s_result);
  signal pr_state, nx_state : state;

  signal s_trans : std_logic_vector(7 downto 0);
  
begin 
  process(decode)	
  begin
    case decode is
      when "0001" => s_trans <= "00000001";
      when "0010" => s_trans <= "00000010";
      when "0011" => s_trans <= "00000011";
      when "0100" => s_trans <= "00000100";
      when "0101" => s_trans <= "00000101";
      when "0110" => s_trans <= "00000110";
      when "0111" => s_trans <= "00000111";
      when "1000" => s_trans <= "00001000";
      when "1001" => s_trans <= "00001001";
      when "0000" => s_trans <= "00000000";
		when others => null;
    end case;
  end process;  
  
  process(wr_en, rst_n_i, decode)
  begin
    if(rst_n_i = '0' or decode = "1110")then
	  pr_state <= s_clear;
	elsif(wr_en'event and wr_en = '1')then
	  pr_state <= nx_state;
	end if;
  end process;
  
  process(pr_state, s_trans, decode)
    variable flag : boolean;
  begin
    case pr_state is
	  when s_clear =>
	   flag := false;
	   clear <= '1';
		A <= "00000001";
		B <= "00000001";
		sel <= "00";
		set_rst <= '0';
		div <= '1';
		nx_state <= s_num;
		
	  when s_num =>
	    if(flag = false)then
	     flag := true;
		  clear <= '0';
		  A <= s_trans;
		  nx_state <= s_operator;
		else
		  flag := false;
		  clear <= '0';
		  B <= s_trans;
		  nx_state <= s_result;
		end if;
	    
	  when s_operator =>
	    case decode is
		  when "1010" =>
		    sel <= "00";
		  when "1011" =>
		    sel <= "01";
		  when "1100" =>
		    sel <= "10";
		  when "1101" =>
		    sel <= "11";
			 div <= '0';
		  when others => null;
		end case;
		
		nx_state <= s_num;
	  when s_result =>
	    set_rst <= '1';
		nx_state <= s_clear;
	end case;
  end process;
  
end rtl;