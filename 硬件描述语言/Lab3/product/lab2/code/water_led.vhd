----------------------------------------------------------------------------------------------------------
--模块名称: water_led
--摘要提示: 
--当前版本: 1.0.0
--模块作者: 
--完成日期: 20XX年XX月XX日 
--内容提要:
--需要注意:                                                                   
----------------------------------------------------------------------------------------------------------
--取代版本: 
--模块作者:
--完成日期: 
--修改内容:
--修改文件: 
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
architecture rtl of water_led is

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
		sel_i : in    std_logic_vector(1 downto 0);
		y_o   : out 	std_logic_vector(3 downto 0)
	);
end component;
----------------------------------------------------------------------------------------------------------

signal mid_1hz : std_logic;
signal sel_signal : std_logic_vector(1 downto 0);
begin
	U1 : clk_gen_1hz port map(
										rst_n_i => rst_n_i, 
										clk_i => clk_50mhz_i, 
										clk_o => mid_1hz
										);
										
	U2 : counter     port map(
										clk => mid_1hz, 
										rst_n => rst_n_i, 
										c_out => sel_signal);
										
	U3 : mux4        port map(
										sel_i => sel_signal, 
										y_o => water_led_o);
end rtl;
