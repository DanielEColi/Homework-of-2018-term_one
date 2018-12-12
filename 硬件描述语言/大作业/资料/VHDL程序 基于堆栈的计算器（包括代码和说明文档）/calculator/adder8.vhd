-- Copyright (C) 1991-2006 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM "Quartus II"
-- VERSION "Version 6.0 Build 178 04/27/2006 SJ Web Edition"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY adder8 IS 
	port
	(
		A :  IN  STD_LOGIC_VECTOR(7 downto 0);
		B :  IN  STD_LOGIC_VECTOR(7 downto 0);
		COUT :  OUT  STD_LOGIC;
		SUM :  OUT  STD_LOGIC_VECTOR(7 downto 0)
	);
END adder8;

ARCHITECTURE bdf_type OF adder8 IS 

attribute black_box : boolean;
attribute noopt : boolean;

component \74283_0\
	PORT(CIN : IN STD_LOGIC;
		 A1 : IN STD_LOGIC;
		 A2 : IN STD_LOGIC;
		 B2 : IN STD_LOGIC;
		 A3 : IN STD_LOGIC;
		 A4 : IN STD_LOGIC;
		 B4 : IN STD_LOGIC;
		 B1 : IN STD_LOGIC;
		 B3 : IN STD_LOGIC;
		 SUM4 : OUT STD_LOGIC;
		 COUT : OUT STD_LOGIC;
		 SUM1 : OUT STD_LOGIC;
		 SUM2 : OUT STD_LOGIC;
		 SUM3 : OUT STD_LOGIC);
end component;
attribute black_box of \74283_0\: component is true;
attribute noopt of \74283_0\: component is true;

component \74283_1\
	PORT(CIN : IN STD_LOGIC;
		 A1 : IN STD_LOGIC;
		 A2 : IN STD_LOGIC;
		 B2 : IN STD_LOGIC;
		 A3 : IN STD_LOGIC;
		 A4 : IN STD_LOGIC;
		 B4 : IN STD_LOGIC;
		 B1 : IN STD_LOGIC;
		 B3 : IN STD_LOGIC;
		 SUM4 : OUT STD_LOGIC;
		 COUT : OUT STD_LOGIC;
		 SUM1 : OUT STD_LOGIC;
		 SUM2 : OUT STD_LOGIC;
		 SUM3 : OUT STD_LOGIC);
end component;
attribute black_box of \74283_1\: component is true;
attribute noopt of \74283_1\: component is true;

signal	SUM_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 downto 0);
signal	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_4 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_0 <= '0';



b2v_inst : 74283_0
PORT MAP(CIN => SYNTHESIZED_WIRE_0,
		 A1 => A(0),
		 A2 => A(1),
		 B2 => B(1),
		 A3 => A(2),
		 A4 => A(3),
		 B4 => B(3),
		 B1 => B(0),
		 B3 => B(2),
		 SUM4 => SUM_ALTERA_SYNTHESIZED(3),
		 COUT => SYNTHESIZED_WIRE_1,
		 SUM1 => SUM_ALTERA_SYNTHESIZED(0),
		 SUM2 => SUM_ALTERA_SYNTHESIZED(1),
		 SUM3 => SUM_ALTERA_SYNTHESIZED(2));

b2v_inst1 : 74283_1
PORT MAP(CIN => SYNTHESIZED_WIRE_1,
		 A1 => A(4),
		 A2 => A(5),
		 B2 => B(5),
		 A3 => A(6),
		 A4 => A(7),
		 B4 => B(7),
		 B1 => B(4),
		 B3 => B(6),
		 SUM4 => SUM_ALTERA_SYNTHESIZED(7),
		 COUT => SYNTHESIZED_WIRE_3,
		 SUM1 => SUM_ALTERA_SYNTHESIZED(4),
		 SUM2 => SUM_ALTERA_SYNTHESIZED(5),
		 SUM3 => SUM_ALTERA_SYNTHESIZED(6));

SYNTHESIZED_WIRE_2 <= A(7) XOR B(7);

SYNTHESIZED_WIRE_4 <= SYNTHESIZED_WIRE_2 XOR SUM_ALTERA_SYNTHESIZED(7);

COUT <= SYNTHESIZED_WIRE_3 XOR SYNTHESIZED_WIRE_4;
SUM <= SUM_ALTERA_SYNTHESIZED;

END; 