library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Manager is
  Port(
    wr_en_i : in std_logic;
    rst_i   : in std_logic_vector(3 downto 0);
    delay_wr_en : out std_logic;
    real_rst_o : out std_logic_vector(3 downto 0);
    Beep_o : out std_logic;
    Stack_sel_o : out std_logic;
    Num_o : out std_logic(7 downto 0);
    Operator_o : out std_logic(1 downto 0);
    clear_o : out std_logic;
    calculate_o : out std_logic
  );
end Manager;

architecture rtl of Manager is
  function sng2integer (data : std_logic_vector(3 downto 0)) return integer is
    variable rlt : integer range 0 to 9;
  begin
    case data is
      when "0001" => rlt := 1;
      when "0010" => rlt := 2;
      when "0011" => rlt := 3;
      when "0100" => rlt := 4;
      when "0101" => rlt := 5;
      when "0110" => rlt := 6;
      when "0111" => rlt := 7;
      when "1000" => rlt := 8;
      when "1001" => rlt := 9;
      when "0000" => rlt := 0;
    end case;
    
    return rlt;
  end sng2integer;
  
  function judgeNum_OP (data : std_logic_vector(3 downto 0)) return boolean is
    variable rlt : boolean;
  begin
    case data is
      when "0001" => rlt := 1;
      when "0010" => rlt := 1;
      when "0011" => rlt := 1;
      when "0100" => rlt := 1;
      when "0101" => rlt := 1;
      when "0110" => rlt := 1;
      when "0111" => rlt := 1;
      when "1000" => rlt := 1;
      when "1001" => rlt := 1;
      when "0000" => rlt := 1;
      when others => rlt := 0;
    end case;
    
    return rlt;
  end judgeNum_OP;
  
  type state is	(BF_Operator, AF_Operator);
  signal pr_state, nx_state : state;
  
  signal s_input : std_logic_vector(3 downto 0);
  signal s_number : integer range 0 to 255;
  signal s_stack_sel : std_logic;
  signal s_operator : std_logic_vector(1 downto 0);
  signal s_Beep : std_logic;
  signal s_clear : std_logic;
begin
  s_input <= rst_i;
------------------lower section---------------------
  process(wr_en_i)
  begin
    if(wr_en_i'event and wr_en_i = '1')then
      pr_state <= nx_state;
    end if;
  end process;
-----------------upper section----------------------
  process(s_input, pr_state)
    variable enable : boolean;
    variable tmp : integer range 0 to 1000;
  begin
    case pr_state is
      when BF_Operator =>
        if(judgeNum_OP(s_input))then
          enable := 1;            
          tmp :=                  --这里要判断是否大于255,如果大于255，就不再接收数字
          if()then
          end if;
          s_number <= s_number + sng2integer(s_input);
          nx_state <= BF_Operator;
        else
          if(enable)then
            if(s_input = "1010")then
              s_operator <= "00";
              s_stack_sel <= '1';
            elsif(s_input = "1011")then
              s_operator <= "01";
              s_stack_sel <= '1';
            elsif(s_input = "1100")then
              s_operator <= "10";
              s_stack_sel <= '1';
            elsif(s_input = "1101")then
              s_operator <= "11";
              s_stack_sel <= '1';
            end if;
            enable := 0;
            nx_state <= AF_Operator;
          else
            s_Beep <= not s_Beep;    --这里要输出一个脉冲信号，触发蜂鸣器
            nx_state <= BF_Operator;
          end if;
        end if;
      when AF_Operator =>
        if(judgeNum_OP(s_input))then
          enable := 1;
        else
          if(enable)then
            enable := 0;
            nx_state <= 
          else
            s_Beep <= not s_Beep;
            nx_state <= AF_Operator;
          end if;
        end if;
    end case;
  end process;
  
  Beep_o <= s_Beep;
  Stack_sel_o <= s_stack_sel;
  Operator_o <= s_operator;
end rtl;