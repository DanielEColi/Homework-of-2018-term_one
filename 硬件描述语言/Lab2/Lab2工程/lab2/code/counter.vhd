----------------------------------------------------------------------------------------------------------
--ģ������: counter
--ժҪ��ʾ: 
--��ǰ�汾: 1.0.0
--ģ������: 
--�������: 20XX��XX��XX�� 
--������Ҫ:
--��Ҫע��:                                                                   
----------------------------------------------------------------------------------------------------------
--ȡ���汾: 
--ģ������:
--�������: 
--�޸�����:
--�޸��ļ�: 
----------------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

---------------------------------------ENTITY DECLARATION-------------------------------------------------
entity counter is
	port(
		clk 	: in 	std_logic;
		rst_n : in 	std_logic;
		c_out : out std_logic_vector(1 downto 0)
	);
end counter;

----------------------------------------------------------------------------------------------------------

---------------------------------------ARCHITECTURE STRUCTURAL--------------------------------------------
architecture rtl of counter is
signal s_cnt : std_logic_vector(1 downto 0);
begin
	process(rst_n, clk)
	begin
		if(rst_n = '0')then
			s_cnt <= "00";
		elsif rising_edge(clk)then
			s_cnt <= s_cnt + "01";
		end if;
		c_out <= s_cnt;
	end process;
end rtl;

