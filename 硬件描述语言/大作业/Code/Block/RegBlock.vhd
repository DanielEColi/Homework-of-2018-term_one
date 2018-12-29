library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.mypackage.all;

entity RegBlock is
  generic(
    bit_width : integer := 16
  );
  port(
    clk_i : in std_logic;
    clear : in std_logic;
    wr_en : in std_logic;
    get_rst : in std_logic;
    input : in std_logic_vector(3 downto 0);
    rst   : in std_logic_vector(bit_width - 1 downto 0);
    row1_o : out row(15 downto 0);
    row2_o : out row(15 downto 0)
  );
end RegBlock;

architecture rtl of RegBlock is
  function std_logic_vector_to_integer (data : std_logic_vector) return integer is
	 variable result : integer range 0 to 2**data'length-1;
  begin
    if(data(data'high) = '1')then
	   result := 1;
    else
	   result := 0;
	 end if;
	 
	 for i in (data'high - 1) downto (data'low) loop
	   result := result * 2;
		if(data(i) = '1')then
		  result := result + 1;
		end if;
	 end loop;
	 
	 return result;
  end std_logic_vector_to_integer;
  
  component BitExg is
    port(
      din : in integer range 0 to 65535;
      bit_5 : out std_logic_vector(7 downto 0);
      bit_4 : out std_logic_vector(7 downto 0);
      bit_3 : out std_logic_vector(7 downto 0);
      bit_2 : out std_logic_vector(7 downto 0);
      bit_1 : out std_logic_vector(7 downto 0)
    );
  end component;
  
  type state is (s_clear, s_write, s_idle);
  signal pr_state, nx_state : state;
  signal s_data : std_logic_vector(7 downto 0);
  signal s_rst  : integer range 0 to 2**bit_width-1;
  signal s_bit  : row(0 to 4);
  signal s_row1 : row(15 downto 0);
  signal s_row2 : row(15 downto 0);
  
  signal iBuffer : std_logic;
  signal iBuffer2 : std_logic;
begin
  s_rst <= std_logic_vector_to_integer(rst);

  i_BitExg : BitExg
  port map(
    din => s_rst,
    bit_5 => s_bit(4),
    bit_4 => s_bit(3),
    bit_3 => s_bit(2),
    bit_2 => s_bit(1),
    bit_1 => s_bit(0)
  );

  process(input)
  begin
	 case input is
	   when "0000" => s_data <= "00110000";
		when "0001" => s_data <= "00110001";
		when "0010" => s_data <= "00110010";
		when "0011" => s_data <= "00110011";
		when "0100" => s_data <= "00110100";
		when "0101" => s_data <= "00110101";
		when "0110" => s_data <= "00110110";
		when "0111" => s_data <= "00110111";
		when "1000" => s_data <= "00111000";
		when "1001" => s_data <= "00111001"; 
		when "1010" => s_data <= "00111011"; --"+"
		when "1011" => s_data <= "00111101"; --"-"
		when "1100" => s_data <= "00111010"; --"*"
		when "1101" => s_data <= "00111111"; --"/"
		when others => null;
	 end case;
  end process;

  process(clear, clk_i)
  begin
    if(clear = '1')then
	   pr_state <= s_clear;
	 elsif(clk_i'event and clk_i = '1')then
	   iBuffer <= wr_en;
		iBuffer2 <= iBuffer;
		pr_state <= nx_state;
	 end if;
  end process;
  
  process(pr_state, iBuffer, wr_en, get_rst, s_data, s_bit)
  begin
    case pr_state is
	   when s_idle =>
		  if(iBuffer = '1' and iBuffer2 = '0')then
		    nx_state <= s_write;
		  end if;
		  
	   when s_clear =>
		  for i in 0 to 15 loop
          s_row1(i) <= "00100000";
          s_row2(i) <= "00100000";
        end loop;
		  nx_state <= s_idle;
		  
		when s_write =>
		  if(get_rst = '1')then
		    s_row2(0) <= s_bit(0);
          s_row2(1) <= s_bit(1);
          s_row2(2) <= s_bit(2);
          s_row2(3) <= s_bit(3);
          s_row2(4) <= s_bit(4);
		  else
		    for i in 0 to 14 loop
            s_row1(15 - i) <= s_row1(14 - i);
          end loop;
          s_row1(0) <= s_data;
		  end if;
		  	  
		  nx_state <= s_idle;
	 end case;
  end process;
  
  row1_o <= s_row1;
  row2_o <= s_row2;
end rtl;