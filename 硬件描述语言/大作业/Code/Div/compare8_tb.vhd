--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:03:28 12/13/2018
-- Design Name:   
-- Module Name:   D:/FPGALab/product/BigHomework/Code/Div/compare8_tb.vhd
-- Project Name:  Div
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: compare8
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
 
ENTITY compare8_tb IS
END compare8_tb;
 
ARCHITECTURE behavior OF compare8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT compare8
    PORT(
         IA_more_than_B : IN  std_logic;
         IB_more_than_A : IN  std_logic;
         IA_equal_B : IN  std_logic;
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         OA_more_than_B : OUT  std_logic;
         OB_more_than_A : OUT  std_logic;
         OA_equal_B : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IA_more_than_B : std_logic := '1';
   signal IB_more_than_A : std_logic := '0';
   signal IA_equal_B : std_logic := '0';
   signal A : std_logic_vector(7 downto 0) := "11010011";
   signal B : std_logic_vector(7 downto 0) := "01010011";

 	--Outputs
   signal OA_more_than_B : std_logic;
   signal OB_more_than_A : std_logic;
   signal OA_equal_B : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: compare8 PORT MAP (
          IA_more_than_B => IA_more_than_B,
          IB_more_than_A => IB_more_than_A,
          IA_equal_B => IA_equal_B,
          A => A,
          B => B,
          OA_more_than_B => OA_more_than_B,
          OB_more_than_A => OB_more_than_A,
          OA_equal_B => OA_equal_B
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
      -- insert stimulus here 

      wait;
   end process;

END;
