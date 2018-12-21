library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.my_data_types.all;

entity RegBlock is
  port(
    clear : in std_logic;
    wr_en : in std_logic;
    get_rst : in std_logic;
    input : in std_logic_vector(3 downto 0);
    rst   : in std_logic_vector(15 downto 0);
    row1_o : out row;
    row2_o : out row
  );
end RegBlock;

architecture rtl of RegBlock is
  component BitExg is
    port(
      din : in integer range 0 to 25535;
      bit_5 : out std_logic_vector(7 downto 0);
      bit_4 : out std_logic_vector(7 downto 0);
      bit_3 : out std_logic_vector(7 downto 0);
      bit_2 : out std_logic_vector(7 downto 0);
      bit_1 : out std_logic_vector(7 downto 0)
    );
  end component;
  signal s_data : std_logic_vector(7 downto 0);
  signal s_rst  : integer range 0 to 65535;
  signal s_bit1 : std_logic_vector(7 downto 0);
  signal s_bit2 : std_logic_vector(7 downto 0);
  signal s_bit3 : std_logic_vector(7 downto 0);
  signal s_bit4 : std_logic_vector(7 downto 0);
  signal s_bit5 : std_logic_vector(7 downto 0);
  signal s_row1 : row;
  signal s_row2 : row;
begin
  s_rst <= conv_integer(rst);

  i_BitExg : BitExg
  port map(
    din => s_rst,
    bit_5 => s_bit5,
    bit_4 => s_bit4,
    bit_3 => s_bit3,
    bit_2 => s_bit2,
    bit_1 => s_bit1
  );

  with input select
    s_data <= "00110000" when "0000",
              "00110001" when "0001",
              "00110010" when "0010",
              "00110011" when "0011",
              "00110100" when "0100",
              "00110101" when "0101",
              "00110110" when "0110",
              "00110111" when "0111",
              "00111000" when "1000",
              "00111001" when "1001",
              "00101011" when "1010", --"+"
              "00101101" when "1011", --"-"
              "00101010" when "1100", --"*"
              "00101111" when "1101", --"/"
				  "00100000" when others;
  
  process(clear, wr_en, get_rst)
  begin
    if(clear'event and clear = '1')then
      for i in 0 to 15 loop
        s_row1(i) <= "00100000";
        s_row2(i) <= "00100000";
      end loop;
    elsif(wr_en'event and wr_en = '1')then
      for i in 0 to 14 loop
        s_row1(15 - i) <= s_row1(14 - i);
      end loop;
      s_row1(0) <= s_data;
    elsif(get_rst'event and get_rst = '1')then
      s_row2(0) <= s_bit1;
      s_row2(1) <= s_bit2;
      s_row2(2) <= s_bit3;
      s_row2(3) <= s_bit4;
      s_row2(4) <= s_bit5;
    end if;
  end process;
end rtl;