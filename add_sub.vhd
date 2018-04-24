library ieee;
use ieee.std_logic_1164.all;
 

 entity full_adder is
 Port ( 	i1 : in STD_LOGIC;
 			i2 : in STD_LOGIC;
 			m : in STD_LOGIC;
 			Cin : in STD_LOGIC;
 			sum : out STD_LOGIC;
 			Cout : out STD_LOGIC);
end full_adder;
 
architecture behav of full_adder is

	signal x: std_logic;
 
begin
 	x <= i2 xor m; 
 	sum <= i1 XOR x XOR Cin;
 	Cout <= (i1 AND x) OR (Cin AND i1) OR (Cin AND x);
 
end behav;


library ieee;
use ieee.std_logic_1164.all;
-- library STD;
-- use STD.textio.all;
-- use IEEE.std_logic_textio.all;

entity add_sub is
port(	A:	in std_logic_vector (7 downto 0);
		B:	in std_logic_vector (7 downto 0);
		mode: in std_logic;
		flow: out std_logic;        
		S:	out std_logic_vector(7 downto 0)
);
end add_sub;

architecture behav of add_sub is

	component full_adder is
		port (	i1 : in STD_LOGIC;
 				i2 : in STD_LOGIC;
 				Cin : in STD_LOGIC;
 				m : in STD_LOGIC;
 				sum : out STD_LOGIC;
 				Cout : out STD_LOGIC
		);
	end component;

	signal c : std_logic_vector(7 downto 0);

begin 
FA1: component full_adder 
	port map(i1 => A(0),
				 i2 => B(0) ,
				 m=> mode,
				 Cin => mode,
				 sum => S(0),
				 Cout => c(0)
	);

FA2: component full_adder 
	port map(i1 => A(1),
				 i2 => B(1),
				 m=> mode,
				 Cin => c(0),
				 sum => S(1),
				 Cout => c(1)
	);

FA3: component full_adder 
	port map(i1 => A(2),
				 i2 => B(2),
				 m=> mode,
				 Cin => c(1),
				 sum => S(2),
				 Cout => c(2)
		
	);

FA4: component full_adder 
	port map(i1 => A(3),
				 i2 => B(3),
				 m=> mode,
				 Cin => c(2),
				 sum => S(3),
				 Cout => c(3)
		
	);

FA5: component full_adder 
	port map(i1 => A(4),
				 i2 => B(4),
				 m=> mode,
				 Cin => c(3),
				 sum => S(4),
				 Cout => c(4)
		
	);

FA6: component full_adder 
	port map(i1 => A(5),
				 i2 => B(5),
				 m=> mode,
				 Cin => c(4),
				 sum => S(5),
				 Cout => c(5)
		
	);

FA7: component full_adder 
	port map(i1 => A(6),
				 i2 => B(6),
				 m=> mode,
				 Cin => c(5),
				 sum => S(6),
				 Cout => c(6)
		
	);

FA8: component full_adder 
	port map(i1 => A(7),
				 i2 => B(7),
				 m=> mode,
				 Cin => c(6),
				 sum => S(7),
				 Cout => c(7)
		
	);

	flow <= c(7) xor c(6);
end behav;