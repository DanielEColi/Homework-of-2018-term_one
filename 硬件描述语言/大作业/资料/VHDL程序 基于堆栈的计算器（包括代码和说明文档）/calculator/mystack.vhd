library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
Entity mystack is
   port(clk:in std_logic;
        operation:in std_logic_vector(8 downto 0);
        my_result:in std_logic_vector(7 downto 0);
        din:in std_logic_vector(7 downto 0);
        empty,full,stack_singledata:out std_logic;
        dout1:out std_logic_vector(7 downto 0);
        dout2:out std_logic_vector(7 downto 0);
        output_sel:out std_logic_vector(2 downto 0));
end mystack;



architecture a1 of mystack is
      type stack is array (3 downto 0) of std_logic_vector(7 downto 0);

      constant clear_state : integer := 0;
      constant add_state : integer := 1;
      constant sub_state : integer := 2;
      constant mul_state : integer := 3;
      constant div_state : integer := 4;
      constant xchg_state : integer := 5;
      constant neg_state : integer := 6;
      constant push_state : integer := 7;
      constant pop_state : integer := 8;
      constant idle_state : integer := 9;    
      

      
      begin
process(clk)
      variable s:  stack;
      variable x: std_logic;  -- 标记堆栈是否满
      variable cnt: integer range 0 to 15; -- 堆栈指针
      variable mystack_state:integer range 0 to 9; --标记运算器的状态
      variable last_state:integer range 0 to 9; --标记上一次运算器的状态
      variable temp:std_logic_vector(7 downto 0);
      

      begin
         if clk'event and clk='1' then  
            if operation="100000000" then      mystack_state:=clear_state;stack_singledata<='0';empty<='0';full<='0';
            elsif operation="010000000" then   mystack_state:=push_state;stack_singledata<='0';empty<='0';full<='0';
            elsif operation="001000000" then   mystack_state:=pop_state;stack_singledata<='0';empty<='0';full<='0';
            elsif operation="000100000" then   mystack_state:=add_state;stack_singledata<='0';empty<='0';full<='0';
            elsif operation="000010000" then   mystack_state:=sub_state;stack_singledata<='0';empty<='0';full<='0';
            elsif operation="000001000" then   mystack_state:=mul_state;stack_singledata<='0';empty<='0';full<='0';
            elsif operation="000000100" then   mystack_state:=div_state;stack_singledata<='0';empty<='0';full<='0';
            elsif operation="000000010" then   mystack_state:=xchg_state;stack_singledata<='0';empty<='0';full<='0';
            elsif operation="000000001" then   mystack_state:=neg_state;stack_singledata<='0';
            end if;
            
            case last_state is
                 when add_state=>
                      output_sel<="001";
                      s(cnt-1):= my_result;
                      s(cnt):="00000000";
                      last_state:=idle_state;
                 when sub_state=> 
                      output_sel<="010";
                      s(cnt-1):= my_result;
                      s(cnt):="00000000";
                      last_state:=idle_state;
                 when mul_state=>  
                      output_sel<="011"; 
                      s(cnt-1):= my_result;
                      s(cnt):="00000000";
                      last_state:=idle_state;
                 when div_state=>  
                      output_sel<="100";
                      s(cnt-1):= my_result;  
                      s(cnt):="00000000";
                      last_state:=idle_state;
                 when others =>
                      null;
            end case;

            case mystack_state is
                 when clear_state=>
                      dout1<="00000000";
                      dout2<="00000000";
                      x:='0';
                      cnt:=0; 
                      empty<='1';
                      full<='0';

                      s(0):="00000000";
                      s(1):="00000000";
                      s(2):="00000000";
                      s(3):="00000000";
                      stack_singledata<='0';
                      output_sel<="000";
                      mystack_state:=idle_state;

                 when add_state=>
                      if (cnt<2 or cnt>4) then
                         stack_singledata<='1';
                      end if;
                      if (cnt>=2  and cnt <=4) then
                         dout1<=s(cnt-1);
                         dout2<=s(cnt-2);
                         cnt := cnt -1;
                         last_state:=add_state;
                      end if;
                      output_sel<="001";
                      mystack_state:=idle_state;

                 when sub_state=>                      
                      if (cnt<2 or cnt>4) then
                         stack_singledata<='1';
                      end if;
                      if (cnt>=2  and cnt <=4) then
                         dout1<=s(cnt-1);
                         dout2<=s(cnt-2);
                         cnt := cnt -1;
                         last_state:=sub_state;
                      end if;
                      output_sel<="010";
                      mystack_state:=idle_state;       
      
                 when mul_state=>
                      if (cnt<2 or cnt>4) then
                         stack_singledata<='1';
                      end if;
                      if (cnt>=2  and cnt <=4) then
                         dout1<=s(cnt-1);
                         dout2<=s(cnt-2);
                         cnt := cnt -1;
                         last_state:=mul_state;
                      end if;
                      output_sel<="011";
                      mystack_state:=idle_state;

                 when div_state=>
                      if (cnt<2 or cnt>4) then
                         stack_singledata<='1';
                      end if;
                      if (cnt>=2  and cnt <=4) then
                         dout1<=s(cnt-1);
                         dout2<=s(cnt-2);
                         cnt := cnt -1;
                         last_state:=div_state;
                      end if;
                      output_sel<="100";                     
                      mystack_state:=idle_state;

                 when xchg_state=>
                      if (cnt<2 or cnt>4) then
                         stack_singledata<='1';
                      end if;
                      if (cnt>=2  and cnt <=4) then
                         temp:=s(cnt-1);
                         s(cnt-1):=s(cnt-2);
                         s(cnt-2):=temp;
                         dout1<=s(cnt-1);
                         dout2<=s(cnt-2);
                         output_sel<="000";
                      end if;                      
                      mystack_state:=idle_state;

                 when neg_state=>
                      if (cnt<2 or cnt>4) then
                         stack_singledata<='1';
                      end if;
                      if (cnt>=2  or cnt <=4) then
                          temp:=s(cnt-1);
                          if(temp(7)='1') then
                             s(cnt-1):=((temp XOR "01111111")+1);
                          else
                             s(cnt-1):=temp;
                          end if;
                          temp:=s(cnt-2);
                          if(temp(7)='1') then
                             s(cnt-2):=(temp XOR "01111111")+1;
                          else
                             s(cnt-2):=temp;
                          end if;
                          dout1<=s(cnt-1);
                          dout2<=s(cnt-2);
                          output_sel<="000";
                      end if;
                      mystack_state:=idle_state;

                 when push_state=>
                    if x='0' then
                      if cnt<3 then  
                         empty<='0'; 
                         s(cnt):=din; 
                         cnt:=cnt+1;
                      elsif cnt=3 then  
                         s(3):=din;
                         cnt:=cnt+1;
                         x:='1';
                         full<='1'; 
                      end if;
                    elsif x='1' then
                         full<='1';
                    end if;
                      dout1<=s(cnt-1);
                      output_sel<="000";
                      mystack_state:=idle_state;

                 when pop_state=>
                    if cnt>1 then
                      cnt:=cnt-1; 
                      s(cnt):="00000000";
                      dout1<=s(cnt-1);
                      output_sel<="000";
                      empty<='0';
                    elsif cnt=1 then
                      cnt:=cnt-1; 
                      s(cnt):="00000000";
                      dout1<=s(cnt);
                      output_sel<="000";
                      empty<='1'; 
                      full<='0';  
                    elsif cnt=0 then
                      empty<='1'; 
                      full<='0';                                     
                    end if;
                      mystack_state:=idle_state;

                 when idle_state=>
                      if cnt=0 then
                         empty<='1';
                         full<='0';
                         x:='0';
                         stack_singledata<='0';
                      elsif cnt=1  then
                         empty<='0';
                         full<='0';
                         x:='0';
                         stack_singledata<='1';
                      elsif cnt=2 then
                         empty<='0';
                         full<='0';
                         x:='0';
                         stack_singledata<='0'; 
                      elsif cnt=3 then
                         empty<='0';
                         full<='0';
                         x:='0';
                         stack_singledata<='0';                                  
                      elsif cnt=4  then
                         empty<='0';
                         full<='1';
                         x:='1';
                         stack_singledata<='0';
                      end if;  
                      if cnt>1 then                   
                        dout1<=s(cnt-1);
                        empty<='0';
                        dout2<=s(cnt-2);                        
                      end if;
                      output_sel<="000";
                when others =>
                     null;

            end case;
         end if;  
         if cnt=0 then  
           empty<='1';
         end if;     
         full<=x;
end process;
end a1;
