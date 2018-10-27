--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:57:13 09/14/2018
-- Design Name:   
-- Module Name:   D:/FPGALab/product/lab1_test/code/adder_tb.vhd
-- Project Name:  adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY adder_tb IS
END adder_tb;
 
ARCHITECTURE behavior OF adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder
    PORT(
         a_i : IN  std_logic_vector(1 downto 0);
         b_i : IN  std_logic_vector(1 downto 0);
         cin_i : IN  std_logic;
         sum_o : OUT  std_logic_vector(1 downto 0);
         cout_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a_i : std_logic_vector(1 downto 0) := (others => '0');
   signal b_i : std_logic_vector(1 downto 0) := (others => '0');
   signal cin_i : std_logic := '0';

 	--Outputs
   signal sum_o : std_logic_vector(1 downto 0);
   signal cout_o : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adder PORT MAP (
          a_i => a_i,
          b_i => b_i,
          cin_i => cin_i,
          sum_o => sum_o,
          cout_o => cout_o
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      
      a_i <= "10";
      b_i <= "00";
      cin_i <= '1';
      
      wait for 100 ns;	
      
      a_i <= "11";
      b_i <= "00";
      cin_i <= '1';
      
      wait for 100 ns;	
      
      a_i <= "10";
      b_i <= "10";
      cin_i <= '1';
      
      wait for 100 ns;	
      
      a_i <= "00";
      b_i <= "00";
      cin_i <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
