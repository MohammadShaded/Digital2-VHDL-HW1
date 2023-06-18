-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
 use IEEE.std_logic_unsigned.all;

 entity TP is
 end TP;
 
 
 
architecture cct of TP is 
component Int_SQRT_Calculator 
       port( CLK, RESET, S : in std_logic;
	          X : in std_logic_vector(7 downto 0);
 	          Sqrt : out std_logic_vector(7 downto 0));
end component;

signal CLK : std_logic;
signal RESET : std_logic;
signal S : std_logic;
signal X: std_logic_vector(7 downto 0);
signal Sqrt :  std_logic_vector(7 downto 0);

constant clk_per : time := 4 ns;

 begin
 
 UU:Int_SQRT_Calculator
 port map (
 		CLK=>CLK,
        X=>X ,
        RESET=>RESET ,
        S=>S ,
        Sqrt=>Sqrt );
 
 RESET <='1';
 process
 begin
 	CLK<='0';
    wait for clk_per/2;
    CLK<='1';
    wait for clk_per/2;
end process;


process
begin

 wait for 0.5* clk_per ;
 X<=(others=>'0');
 
for i in 0 to 200 loop
	s<='1';
	wait for 2 * clk_per ;
	s<='0';
	wait for 20 * clk_per ;
	 X<=X+1;
end loop;
wait;

end process;
end cct;


	