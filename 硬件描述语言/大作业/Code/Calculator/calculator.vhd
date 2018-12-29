library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.mypackage.all;

entity Calculator is
  port(
    rst_n_i : in std_logic;   --复位信号
	 clk_50mhz_i : in std_logic;  --主频时钟信号
	 col_i : in std_logic_vector(3 downto 0);  --列输入
	 row_o : out std_logic_vector(3 downto 0); --行输出
	 Beep_o : out std_logic;   --蜂鸣器信号
	 lcd_rs_o : out std_logic; --lcd控制线
	 lcd_wr_o : out std_logic;
	 lcd_en_o : out std_logic;
	 lcd_data_o : out std_logic_vector(7 downto 0)
  );
end Calculator;

architecture rtl of Calculator is
  component clk_gen_50hz is
	 Port ( 
	   clk_i : in  STD_LOGIC;
      rst_n_i : in  STD_LOGIC;
      clk_o : out  STD_LOGIC
	 );
  end component;
  
  component Key4x4 is
    port(
	   clk_50mhz_i : in  STD_LOGIC;
      rst_n_i : in  STD_LOGIC;
	   col_i   : in STD_LOGIC_VECTOR(3 downto 0);
	   wr_en   : out STD_LOGIC;
	   row_o   : out STD_LOGIC_VECTOR(3 downto 0);
      rst_o : out  STD_LOGIC_VECTOR (3 downto 0)
	 );
  end component;
  
  component Beep is
    port(
	   rst_n_i : in std_logic;
      clk_i : in std_logic;
      Beep_i : in std_logic;
      Beep_o : out std_logic
	 );
  end component;
  
  component Manager is
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
  end component;
  
  component ALU is
    port(
	   clk_i : in std_logic;
      A : in std_logic_vector(7 downto 0);
	   B : in std_logic_vector(7 downto 0);
	   Sel : in std_logic_vector(1 downto 0);
	   Div : in std_logic;
	   Result : out std_logic_vector(15 downto 0)
	 );
  end component;
  
  component RegBlock is
    port(
	   clk_i : in std_logic;
      clear : in std_logic;
      wr_en : in std_logic;
      get_rst : in std_logic;
      input : in std_logic_vector(3 downto 0);
      rst   : in std_logic_vector(15 downto 0);
      row1_o : out row(15 downto 0);
      row2_o : out row(15 downto 0)
	 );
  end component;
  
  component LCD1602_Disp is
    port(
	   clk_50mhz_i : in  std_logic;
      rst_n_i     : in  std_logic;
      row1        : in  row(15 downto 0);
      row2        : in  row(15 downto 0);
      lcd_rs_o    : out std_logic;
      lcd_wr_o    : out std_logic;
      lcd_en_o    : out std_logic;
      lcd_data_o  : out std_logic_vector(7 downto 0)
	 );
  end component;
  
  signal s_wr_en : std_logic;
  signal s_decode : std_logic_vector(3 downto 0);
  signal s_set_rst : std_logic;
  signal s_clear : std_logic;
  signal s_div : std_logic;
  signal s_A : std_logic_vector(7 downto 0);
  signal s_B : std_logic_vector(7 downto 0);
  signal s_sel : std_logic_vector(1 downto 0);
  signal s_result : std_logic_vector(15 downto 0);
  signal s_row1 : row(15 downto 0);
  signal s_row2 : row(15 downto 0);
  
  signal s_50hz : std_logic;
  signal s_wr_en_delay : std_logic;
begin
  i_clk_50hz : clk_gen_50hz    --例化50hz模块
  port map(
    clk_i => clk_50mhz_i,
    rst_n_i => rst_n_i,
    clk_o => s_50hz
  );
    
  i_INPUT : Key4x4              --例化矩阵键盘模块
  port map(
    clk_50mhz_i => clk_50mhz_i,
	 rst_n_i => rst_n_i,
	 col_i => col_i,
	 wr_en => s_wr_en,
	 row_o => row_o,
	 rst_o => s_decode
  );
  
  process(s_50hz, rst_n_i, s_wr_en)  --wr_en信号延时输出
  begin
	 if(rst_n_i = '0')then
      s_wr_en_delay <= '0';
	 elsif rising_edge(s_50hz)then   --时钟信号上升沿
	   s_wr_en_delay <= s_wr_en; 
	 end if;
  end process;
  
  i_Beep : Beep            --例化Beep模块
  port map(
    rst_n_i => rst_n_i,
    clk_i => clk_50mhz_i,
    Beep_i => s_wr_en,
    Beep_o => Beep_o
  );
  
  i_CU : Manager         --例化CU模块
  port map(
    rst_n_i => rst_n_i,
    wr_en => s_wr_en,
	 decode => s_decode,
	 set_rst => s_set_rst,
	 clear => s_clear,
	 div => s_div,
	 A => s_A,
	 B => s_B,
	 sel => s_sel
  );

  i_ALU : ALU               --例化ALU模块
  port map(
    clk_i => clk_50mhz_i,
    A => s_A,
    B => s_B,
	 Sel => s_sel,
	 Div => s_div,
	 Result => s_result
  );
  
  i_STORE : RegBlock          --例化存储器模块
  port map(
    clk_i => clk_50mhz_i,
    clear => s_clear,
    wr_en => s_wr_en_delay,
    get_rst => s_set_rst,
    input => s_decode,
    rst => s_result,
    row1_o => s_row1,
    row2_o => s_row2
  );
  
  i_OUTPUT : LCD1602_Disp           --例化LCD1602输出模块
  port map(
    clk_50mhz_i => clk_50mhz_i,
    rst_n_i => rst_n_i,
    row1 => s_row1,
    row2 => s_row2,
    lcd_rs_o => lcd_rs_o,
    lcd_wr_o => lcd_wr_o,
    lcd_en_o => lcd_en_o,
    lcd_data_o => lcd_data_o
  );
end rtl;

