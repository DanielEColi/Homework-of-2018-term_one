library ieee;
use ieee.std_logic_1164.all;

entity calculator is
  port(
	
  );
end calculator;

architecture rtl of calculator is
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
	
	component MyStack is
		port(
			clk : in std_logic;
			operation : in std_logic_vector(8 downto 0);
			my_result : in std_logic_vector(7 downto 0);
			din : in std_logic_vector(7 downto 0);
			empty : out std_logic;
			full : out std_logic;
			stack_singledata : out std_logic;
			dout1 : out std_logic_vector(7 downto 0);
			dout2 : out std_logic_vector(7 downto 0);
			output_sel : out std_logic_vector(2 downto 0)
		);
	end component;
	
	component Adder is
		port(
			A : in std_logic_vector(7 downto 0);
			B : in std_logic_vector(7 downto 0);
			S : out std_logic_vector(8 downto 0)
		);
	end component;
	
	component Subtracter is
		port(
			A : in std_logic_vector(7 downto 0);
			B : in std_logic_vector(7 downto 0);
			Dif : out std_logic_vector(9 downto 0)
		);
	end component;
	
	component Mutiply is
		port(
			A : in std_logic_vector(7 downto 0);
			B : in std_logic_vector(7 downto 0);
			Prod : out std_logic_vector(15 downto 0)
		);
	end component;
	
	component Divider is
		port(
			clk : in std_logic;
			start : in std_logic;
			A : in std_logic_vector(7 downto 0);
			B : in std_logic_vector(7 downto 0);
			QL : out std_logic_vector(7 downto 0);
			QH : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component mux is
		port(
			
		);
	end component;
begin

end rtl;