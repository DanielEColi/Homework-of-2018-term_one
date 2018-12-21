library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.my_data_types.all;

entity LCD1602_Disp is
  generic(
    LCD_COM   : STD_LOGIC := '0';
    LCD_DATA  : STD_LOGIC := '1';
    LCD_READ  : STD_LOGIC := '1';
    LCD_WRITE : STD_LOGIC := '0';
    LCD_LOW   : STD_LOGIC := '0';
    LCD_HIGH  : STD_LOGIC := '1'
  );
  
  port(
    clk_50mhz_i : in  std_logic;
    rst_n_i     : in  std_logic;
    row1        : in  row;
    row2        : in  row;
    lcd_rs_o    : out std_logic;
    lcd_wr_o    : out std_logic;
    lcd_en_o    : out std_logic;
    lcd_data_o  : out std_logic_vector(7 downto 0)
  );
end LCD1602_Disp;

Architecture rtl of LCD1602_Disp is
  component clk_gen_1MHz is
    port(
      rst_n_i : in  std_logic;
      clk_i   : in  std_logic;
      clk_o   : out std_logic
    );
  end component;
  
  function char_to_integer(data : character) return integer is
    variable rlt : integer range 32 to 125;
  begin
    case data is
      when ' ' =>    rlt := 32;
      when '!' =>    rlt := 33;
      --when '"' =>    rlt := 34;
      when '#' =>    rlt := 35;
      when '$' =>    rlt := 36;
      when '%' =>    rlt := 37;
      when '&' =>    rlt := 38;
      when ''' =>    rlt := 39;
      when '(' =>    rlt := 40;
      when ')' =>    rlt := 41;
      when '*' =>    rlt := 42;
      when '+' =>    rlt := 43;
      when ',' =>    rlt := 44;
      when '-' =>    rlt := 45;
      when '.' =>    rlt := 46;
      when '/' =>    rlt := 47;
      when '0' =>    rlt := 48;
      when '1' =>    rlt := 49;
      when '2' =>    rlt := 50;
      when '3' =>    rlt := 51;
      when '4' =>    rlt := 52;
      when '5' =>    rlt := 53;
      when '6' =>    rlt := 54;
      when '7' =>    rlt := 55;
      when '8' =>    rlt := 56;
      when '9' =>    rlt := 57;
      when ':' =>    rlt := 58;
      when ';' =>    rlt := 59;
      when '<' =>    rlt := 60;
      when '=' =>    rlt := 61;
      when '>' =>    rlt := 62;
      when '?' =>    rlt := 63;
      when '@' =>    rlt := 64;
      when 'A' =>    rlt := 65;
      when 'B' =>    rlt := 66;
      when 'C' =>    rlt := 67;
      when 'D' =>    rlt := 68;
      when 'E' =>    rlt := 69;
      when 'F' =>    rlt := 70;
      when 'G' =>    rlt := 71;
      when 'H' =>    rlt := 72;
      when 'I' =>    rlt := 73;
      when 'J' =>    rlt := 74;
      when 'K' =>    rlt := 75;
      when 'L' =>    rlt := 76;
      when 'M' =>    rlt := 77;
      when 'N' =>    rlt := 78;
      when 'O' =>    rlt := 79;
      when 'P' =>    rlt := 80;
      when 'Q' =>    rlt := 81;
      when 'R' =>    rlt := 82;
      when 'S' =>    rlt := 83;
      when 'T' =>    rlt := 84;
      when 'U' =>    rlt := 85;
      when 'V' =>    rlt := 86;
      when 'W' =>    rlt := 87;
      when 'X' =>    rlt := 88;
      when 'Y' =>    rlt := 89;
      when 'Z' =>    rlt := 90;
      when '[' =>    rlt := 91;
      when '\' =>    rlt := 92;
      when ']' =>    rlt := 93;
      when '^' =>    rlt := 94;
      when '_' =>    rlt := 95;
      when '`' =>    rlt := 96;
      when 'a' =>    rlt := 97;
      when 'b' =>    rlt := 98;
      when 'c' =>    rlt := 99;
      when 'd' =>    rlt := 100;
      when 'e' =>    rlt := 101;
      when 'f' =>    rlt := 102;
      when 'g' =>    rlt := 103;
      when 'h' =>    rlt := 104;
      when 'i' =>    rlt := 105;
      when 'j' =>    rlt := 106;
      when 'k' =>    rlt := 107;
      when 'l' =>    rlt := 108;
      when 'm' =>    rlt := 109;
      when 'n' =>    rlt := 110;
      when 'o' =>    rlt := 111;
      when 'p' =>    rlt := 112;
      when 'q' =>    rlt := 113;
      when 'r' =>    rlt := 114;
      when 's' =>    rlt := 115;
      when 't' =>    rlt := 116;
      when 'u' =>    rlt := 117;
      when 'v' =>    rlt := 118;
      when 'w' =>    rlt := 119;
      when 'x' =>    rlt := 120;
      when 'y' =>    rlt := 121;
      when 'z' =>    rlt := 122;
      when '{' =>    rlt := 123;
      when '|' =>    rlt := 124;
      when '}' =>    rlt := 125;
      when others => rlt := 32;
     end case;
     
     return rlt;
  end char_to_integer;
  
  type state is(s_rst, s_38H, s_08H, s_01H, s_06H, s_0CH, set_addr, write_data);
  signal pr_state, nx_state : state;
  
  signal s_cnt     : INTEGER range 0 to 15000 := 0;
  signal s_cnt_max : INTEGER range 0 to 15000 := 0;
  
  signal s_clk_1MHz : std_logic := '0';
  
  signal s_addr_cnt : INTEGER range 0 to 31 := 0;
  signal s_start_addr_cnt : std_logic := LCD_LOW;
  signal s_lcd_ddram_addr : std_logic_vector(7 downto 0) := "10000000";
  signal s_lcd_ddram_data : std_logic_vector(7 downto 0) := "00100000";
  
  signal s_row1 : row;
  signal s_row2 : row;
begin
  U_Clk_gen_1MHz : clk_gen_1MHz
  port map(
    rst_n_i => rst_n_i,
    clk_i   => clk_50mhz_i,
    clk_o   => s_clk_1MHz
  );
------------------lower section---------------------
  process(s_clk_1MHz, rst_n_i)
  
  begin
    if(rst_n_i = '0')then
      pr_state <= s_rst;
    elsif (s_clk_1MHz'event and s_clk_1MHz = '1')then
      pr_state <= nx_state;
    end if;
  end process;
-----------------upper section----------------------
  process(pr_state, s_cnt, s_clk_1MHz)
  
  begin
    --default values
    
    case pr_state is 
      when s_rst      =>
		  nx_state          <= s_rst;
		  lcd_wr_o          <= LCD_WRITE;
		  lcd_rs_o          <= LCD_DATA;
		  lcd_data_o        <= "11111111";
		  lcd_en_o          <= LCD_LOW;
		  s_cnt_max         <= 0;
		  s_start_addr_cnt  <= LCD_LOW;
        nx_state <= s_38H;
      when s_38H      =>
        s_cnt_max <= 15000;
        if(s_cnt < s_cnt_max - 3)then
          nx_state <= s_38H;
        elsif(s_cnt = s_cnt_max - 3)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= "00111000";
          nx_state <= s_38H;
        elsif(s_cnt = s_cnt_max - 2)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= "00111000";
          lcd_en_o <= LCD_HIGH;
          nx_state <= s_38H;
        elsif(s_cnt = s_cnt_max - 1)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= "00111000";
          --lcd_en_o <= LCD_LOW;
          nx_state <= s_38H;
        elsif(s_cnt = s_cnt_max)then
          nx_state <= s_08H;
        end if;
        
      when s_08H      =>
        s_cnt_max <= 40;
        if(s_cnt < s_cnt_max - 3)then
          nx_state <= s_08H;
        elsif(s_cnt = s_cnt_max - 3)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= "00001000";
          nx_state <= s_08H;
        elsif(s_cnt = s_cnt_max - 2)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= "00001000";
          lcd_en_o <= LCD_HIGH;
          nx_state <= s_08H;
        elsif(s_cnt = s_cnt_max - 1)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= "00001000";
          --lcd_en_o <= LCD_LOW;
          nx_state <= s_08H;
        elsif(s_cnt = s_cnt_max)then
          nx_state <= s_01H;
        end if;
        
      when s_01H      =>
        s_cnt_max <= 40;
        if(s_cnt < s_cnt_max - 3)then
          nx_state <= s_01H;
        elsif(s_cnt = s_cnt_max - 3)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= "00000001";
          nx_state <= s_01H;
        elsif(s_cnt = s_cnt_max - 2)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= "00000001";
          lcd_en_o <= LCD_HIGH;
          nx_state <= s_01H;
        elsif(s_cnt = s_cnt_max - 1)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= "00000001";
          --lcd_en_o <= LCD_LOW;
          nx_state <= s_01H;
        elsif(s_cnt = s_cnt_max)then
          nx_state <= s_06H;
        end if;
        
      when s_06H      =>
        s_cnt_max <= 1640;
        if(s_cnt < s_cnt_max - 3)then
          nx_state <= s_06H;
        elsif(s_cnt = s_cnt_max - 3)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= "00000110";
          nx_state <= s_06H;
        elsif(s_cnt = s_cnt_max - 2)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= "00000110";
          lcd_en_o <= LCD_HIGH;
          nx_state <= s_06H;
        elsif(s_cnt = s_cnt_max - 1)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= "00000110";
          --lcd_en_o <= LCD_LOW;
          nx_state <= s_06H;
        elsif(s_cnt = s_cnt_max)then
          nx_state <= s_0CH;
        end if;
        
      when s_0CH      =>
        s_cnt_max <= 40;
        if(s_cnt < s_cnt_max - 3)then
          nx_state <= s_0CH;
        elsif(s_cnt = s_cnt_max - 3)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= "00001100";
          nx_state <= s_0CH;
        elsif(s_cnt = s_cnt_max - 2)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= "00001100";
          lcd_en_o <= LCD_HIGH;
          nx_state <= s_0CH;
        elsif(s_cnt = s_cnt_max - 1)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= "00001100";
          --lcd_en_o <= LCD_LOW;
          nx_state <= s_0CH;
        elsif(s_cnt = s_cnt_max)then
          nx_state <= set_addr;
        end if;
        
      when set_addr   =>
        s_cnt_max <= 40;
        if(s_cnt < s_cnt_max - 3)then
          nx_state <= set_addr;
        elsif(s_cnt = s_cnt_max - 3)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= s_lcd_ddram_addr;
          nx_state <= set_addr;
        elsif(s_cnt = s_cnt_max - 2)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= s_lcd_ddram_addr;
          lcd_en_o <= LCD_HIGH;
          nx_state <= set_addr;
        elsif(s_cnt = s_cnt_max - 1)then
          lcd_rs_o <= LCD_COM;
          lcd_data_o <= s_lcd_ddram_addr;
          --lcd_en_o <= LCD_LOW;
          nx_state <= set_addr;
        elsif(s_cnt = s_cnt_max)then
          nx_state <= write_data;
        end if;
        
      when write_data =>
        s_cnt_max <= 40;
        if(s_cnt < s_cnt_max - 3)then
          nx_state <= write_data;
        elsif(s_cnt = s_cnt_max - 3)then
          lcd_rs_o <= LCD_DATA;
          lcd_data_o <= s_lcd_ddram_data;
          nx_state <= write_data;
        elsif(s_cnt = s_cnt_max - 2)then
          lcd_rs_o <= LCD_DATA;
          lcd_data_o <= s_lcd_ddram_data;
          lcd_rs_o <= LCD_DATA;
          lcd_en_o <= LCD_HIGH;
          nx_state <= write_data;
        elsif(s_cnt = s_cnt_max - 1)then
          lcd_rs_o <= LCD_DATA;
          lcd_data_o <= s_lcd_ddram_data;
          lcd_rs_o <= LCD_DATA;
          --lcd_en_o <= LCD_LOW;
          nx_state <= write_data;
        elsif(s_cnt = s_cnt_max)then
          nx_state <= set_addr;
          s_start_addr_cnt <= LCD_HIGH;
        end if;
        
    end case;
	 
  end process;
  
-----------------cnt_process------------------------
  process(rst_n_i, s_cnt, s_clk_1MHz)
  
  begin
    if(rst_n_i = '0')then
      s_cnt <= 0;
    elsif(s_clk_1MHz'event and s_clk_1MHz = '1')then
      if(s_cnt < s_cnt_max)then
        s_cnt <= s_cnt + 1;
      elsif(s_cnt >= s_cnt_max)then
        s_cnt <= 0;
      end if;
    end if;
  end process;

----------------------------------------------------
  process(rst_n_i, s_start_addr_cnt, s_clk_1MHz, s_addr_cnt)
  
  begin
    if(rst_n_i = '0')then
      s_addr_cnt <= 0;
    elsif(s_start_addr_cnt = '1')then
      if(s_clk_1MHz'event and s_clk_1MHz = '1')then
        if(s_addr_cnt >= 32)then
          s_addr_cnt <= 0;
        else
          s_addr_cnt <= s_addr_cnt + 1;
        end if;
      end if;
    end if;
  end process;
  
----------------------------------------------------
  process(s_addr_cnt)
  
  begin
    if(s_addr_cnt >= 0 and s_addr_cnt <= 15)then
      s_lcd_ddram_addr <= "10000000" + conv_std_logic_vector(s_addr_cnt, 8);
    elsif(s_addr_cnt >= 16 and s_addr_cnt <= 31)then
      s_lcd_ddram_addr <= "11000000" + conv_std_logic_vector(s_addr_cnt - 16, 8);
    end if;
  end process;

----------------------------------------------------
  s_row1 <= row1;
  s_row2 <= row2;
  
----------------------------------------------------
  process(s_addr_cnt)
  
  begin
    case s_addr_cnt is
      when 0 =>  s_lcd_ddram_data <= s_row1(15);
      when 1 =>  s_lcd_ddram_data <= s_row1(14);
      when 2 =>  s_lcd_ddram_data <= s_row1(13);
      when 3 =>  s_lcd_ddram_data <= s_row1(12);
      when 4 =>  s_lcd_ddram_data <= s_row1(11);
      when 5 =>  s_lcd_ddram_data <= s_row1(10);
      when 6 =>  s_lcd_ddram_data <= s_row1(9);
      when 7 =>  s_lcd_ddram_data <= s_row1(8);
      when 8 =>  s_lcd_ddram_data <= s_row1(7);
      when 9 =>  s_lcd_ddram_data <= s_row1(6);
      when 10 => s_lcd_ddram_data <= s_row1(5);
      when 11 => s_lcd_ddram_data <= s_row1(4);
      when 12 => s_lcd_ddram_data <= s_row1(3);
      when 13 => s_lcd_ddram_data <= s_row1(2);
      when 14 => s_lcd_ddram_data <= s_row1(1);
      when 15 => s_lcd_ddram_data <= s_row1(0);
      when 16 => s_lcd_ddram_data <= s_row2(15);
      when 17 => s_lcd_ddram_data <= s_row2(14);
      when 18 => s_lcd_ddram_data <= s_row2(13);
      when 19 => s_lcd_ddram_data <= s_row2(12);
      when 20 => s_lcd_ddram_data <= s_row2(11);
      when 21 => s_lcd_ddram_data <= s_row2(10);
      when 22 => s_lcd_ddram_data <= s_row2(9);
      when 23 => s_lcd_ddram_data <= s_row2(8);
      when 24 => s_lcd_ddram_data <= s_row2(7);
      when 25 => s_lcd_ddram_data <= s_row2(6);
      when 26 => s_lcd_ddram_data <= s_row2(5);
      when 27 => s_lcd_ddram_data <= s_row2(4);
      when 28 => s_lcd_ddram_data <= s_row2(3);
      when 29 => s_lcd_ddram_data <= s_row2(2);
      when 30 => s_lcd_ddram_data <= s_row2(1);
      when 31 => s_lcd_ddram_data <= s_row2(0);
      when others => s_lcd_ddram_data <= "00100000";
    end case;
  end process;
----------------------------------------------------
end rtl;