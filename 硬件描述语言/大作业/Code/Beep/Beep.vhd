library ieee;
use ieee.std_logic_1164.all;

entity Beep is
  port(
    rst_n_i : in std_logic;  --复位信号有效
    clk_i : in std_logic;    --时钟输入
    Beep_i : in std_logic;   --输入
    Beep_o : out std_logic   --蜂鸣器输出
  );
end Beep;

architecture rtl of Beep is
  component clk_gen_1Hz is         --声明1Hz模块，修改其generic值
    generic(
		CNT_MAX  : positive := 6250000;
		CNT_HALF : positive := 3125000
	 );
    port(
      rst_n_i : in  std_logic;   
      clk_i   : in  std_logic;
      clk_o   : out std_logic
    );
  end component;
  
  type state is (s_idle, s_beep);     --两种状态，空闲和工作
  signal pr_state, nx_state : state;
  
  signal s_cnt_i : integer range 0 to 5 := 0;    --计数器
  signal s_cnt_max : integer range 0 to 5 := 0;  --计数器最大值
  signal s_clk_1Hz : std_logic;
  signal s_mid : std_logic;
begin
  U_Clk_gen_1Hz : clk_gen_1Hz --例化1Hz信号
  port map(
    rst_n_i => rst_n_i,
	 clk_i   => clk_i,
	 clk_o   => s_clk_1Hz
  );
  
  process(clk_i, rst_n_i)     
  begin
    if(rst_n_i = '0')then      --复位信号有效
	   pr_state <= s_idle;     --状态机处在空闲状态
    elsif(clk_i'event and clk_i = '1')then  --时钟上升沿
	   pr_state <= nx_state;   --下一个状态
	 end if;
  end process;
  
  process(pr_state, s_cnt_i, Beep_i)
  begin
    case pr_state is
	   when s_idle =>
		  s_cnt_max <= 0;
		  s_mid <= '1';
		  if(Beep_i'event and Beep_i = '1')then
			 nx_state <= s_beep;
		  end if;
		when s_beep =>
		  s_cnt_max <= 2;
		  if(s_cnt_i < 2)then
		    s_mid <= '0';
		    nx_state <= s_beep;   --转至工作状态
		  elsif(s_cnt_i = 2)then
		    s_mid <= '0';
		    nx_state <= s_idle;   --转至空闲状态
		  end if;
	 end case;
  end process;
  
  --时钟计数，决定蜂鸣器响的时长
  process(rst_n_i, s_cnt_i, s_clk_1Hz)
  
  begin
    if(rst_n_i = '0')then
      s_cnt_i <= 0;
    elsif(s_clk_1Hz'event and s_clk_1Hz = '1')then
      if(s_cnt_i < s_cnt_max)then
        s_cnt_i <= s_cnt_i + 1;
      elsif(s_cnt_i >= s_cnt_max)then
        s_cnt_i <= 0;
      end if;
    end if;
  end process;
  
  Beep_o <= s_mid;
end rtl;