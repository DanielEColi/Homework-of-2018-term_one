----------------------------------------------------------------------------------------------------------
--ģ������: water_led
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

entity water_led is
	port(
		clk_50mhz_i : in std_logic;
		rst_n_i		: in std_logic;
		water_led_o : out std_logic_vector(3 downto 0)
	);
end water_led;

----------------------------------------------------------------------------------------------------------

---------------------------------------ARCHITECTURE STRUCTURAL--------------------------------------------
architecture structural of water_led is

component clk_gen_1hz is
	port(
    rst_n_i : in  std_logic;
    clk_i   : in  std_logic;
    clk_o   : out std_logic
	);
end component;

----------------------------------------------------------------------------------------------------------  
component counter is
	port(
		clk 	: in 	std_logic;
		rst_n : in 	std_logic;
		c_out : out std_logic_vector(1 downto 0)
	);
end component;

----------------------------------------------------------------------------------------------------------
component mux4 is
	port(
		sel : in    std_logic_vector(1 downto 0);
		y   : out 	std_logic_vector(3 downto 0)
	);
end component;
----------------------------------------------------------------------------------------------------------

signal mid_1hz_o : std_logic;
signal sel_signal_o : std_logic_vector(1 downto 0);
begin
	U1 : clk_gen_1hz port map(rst_n_i, clk_50mhz_i, mid_1hz_o);
	U2 : counter     port map(mid_1hz_o, rst_n_i, sel_signal_o);
	U3 : mux4        port map(sel_signal_o, water_led_o);
end structural;
