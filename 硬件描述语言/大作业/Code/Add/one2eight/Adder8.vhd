library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder8 is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC);
end Adder8;

architecture rtl of Adder8 is
	component Adder1 is
		port(
			a : in  STD_LOGIC;
			b : in  STD_LOGIC;
			cin : in  STD_LOGIC;
			cout : out  STD_LOGIC;
			sum : out  STD_LOGIC
		);
	end component;
	
	signal s_carry : std_logic_vector(6 downto 0);
begin
	U0	:	Adder1
	port map(
		a => a(0),
		b => b(0),
		cin => cin,
		sum => sum(0),
		cout => s_carry(0)
	);
	
	U1	:	Adder1
	port map(
		a => a(1),
		b => b(1),
		cin => s_carry(0),
		sum => sum(1),
		cout => s_carry(1)
	);
	
	U2	:	Adder1
	port map(
		a => a(2),
		b => b(2),
		cin => s_carry(1),
		sum => sum(2),
		cout => s_carry(2)
	);
	
	U3	:	Adder1
	port map(
		a => a(3),
		b => b(3),
		cin => s_carry(2),
		sum => sum(3),
		cout => s_carry(3)
	);
	
	U4	:	Adder1
	port map(
		a => a(4),
		b => b(4),
		cin => s_carry(3),
		sum => sum(4),
		cout => s_carry(4)
	);
	
	U5	:	Adder1
	port map(
		a => a(5),
		b => b(5),
		cin => s_carry(4),
		sum => sum(5),
		cout => s_carry(5)
	);
	
	U6	:	Adder1
	port map(
		a => a(6),
		b => b(6),
		cin => s_carry(5),
		sum => sum(6),
		cout => s_carry(6)
	);
	
	U7	:	Adder1
	port map(
		a => a(7),
		b => b(7),
		cin => s_carry(6),
		sum => sum(7),
		cout => cout
	);

end rtl;

