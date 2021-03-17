
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Utilização das funções e procedimentos de my_package
use work.proc_func.all;

entity testbench is

end entity testbench;

architecture RTL of testbench is
	signal a :         signed (7 downto 0);
	signal b :         signed (7 downto 0);
	signal c :         signed (7 downto 0);
	signal d :         signed (7 downto 0);
	signal e :         signed (7 downto 0);
	signal f :         signed (7 downto 0);
	signal g :         signed (7 downto 0);
	signal h :         signed (7 downto 0);
	
	signal max :       signed (7 downto 0);
	signal min :       signed (7 downto 0);
	signal ave :       signed (7 downto 0);
	
	signal dividendo : signed (7 downto 0); 
	signal divisor :   signed (7 downto 0);
	signal tipo :      std_logic;
    signal res :       signed (7 downto 0);
    
	 
begin

    a <= "00000111"; --7
    b <= "00001010"; --10
    c <= "00000110"; --6
    d <= "00000001"; --1
    e <= "00000011"; --3
    f <= "00010101"; --21
    g <= "00010010"; --18
    h <= "00000100"; --4
    
    dividendo <= "01010101"; --85
    divisor <= "00000100"; --4
    --1 -> quociente, 0 -> resto
    tipo <= '1';
    
    media(a, b, c, d, e, f, g, h, max, min, ave);
    
    res <= div(dividendo, divisor, tipo);
 
end architecture RTL;
