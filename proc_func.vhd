library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



package proc_func is
    type reg_array is array (7 downto 0) of signed (7 downto 0);
    
    -- Declaração do procedimento
    procedure media (signal a, b, c, d, e, f, g, h: in  signed (7 downto 0); 
                     signal max, min:               out signed (7 downto 0);
                     signal ave :                   out signed (7 downto 0));
    
    -- Declaração da função
    function div (dividendo:    signed (7 downto 0); 
                  divisor:      signed (7 downto 0);
                  tipo :        std_logic
    ) return signed;
end package proc_func;

package body proc_func is

    -- Corpo do procedimento
    --recebe 8 sinais inteiros sinalizados (signed) e retorne a média, o maior valor e o menor valor desses 8 números
    procedure media (signal a, b, c, d, e, f, g, h: in  signed (7 downto 0); 
                     signal max, min :              out signed (7 downto 0);
                     signal ave :                   out signed (7 downto 0)) is 
                     variable max_aux :             signed (7 downto 0);
                     variable min_aux :             signed (7 downto 0);
                     variable sum :                 signed (7 downto 0);
                     variable aux :                 reg_array;
            
    --parametro de funcao        
    begin
        aux(0) := a;
        aux(1) := b;
        aux(2) := c;
        aux(3) := d;
        aux(4) := e;
        aux(5) := f;
        aux(6) := g;
        aux(7) := h;
        
        --7 downto 0
        max_aux := aux(7);
        min_aux := aux(7);
        
        for i in aux'range loop
            if (aux(i)>max_aux) then
                max_aux := aux(i);
            end if;            
        
            if (aux(i)<min_aux) then
                min_aux := aux(i);
            end if;                               
        end loop;
        max <= max_aux;
        min <= min_aux;
        
        --ave = (a+b+c+d+e+f+g+h)/8;
        sum := a+b+c+d+e+f+g+h;
        --bit slicing (dividido por um multiplo de 2)
        --3 shifts p direita = 2^3 = 8
        -- 000 & 0000 0100 = 0100 = 8
        ave <= "000" & sum(7 downto 3);
    
    end;
    
    --função que implementa a divisão entre números inteiros sinalizados (signed)
    function div(dividendo:  signed (7 downto 0); 
                 divisor :   signed (7 downto 0);
                 tipo :      std_logic
    ) return signed is     
        variable res :      signed (dividendo'length-1 downto 0);
        variable aux_div :  signed (7 downto 0);
        variable aux_quo :  signed (7 downto 0);
        variable aux_res :  signed (7 downto 0);
        
    begin
        res := "00000000";
        aux_quo := "00000000";
        aux_res := "00000000";
        
        --func impede a modificacao da variavel
        aux_div := abs(dividendo);

        for i in 0 to 2**(aux_div'length-1) loop
            if(aux_div>= abs(divisor)) then
                aux_div := aux_div - abs(divisor);
                aux_quo := aux_quo + "00000001";
                aux_res := aux_div;
            end if;    
        end loop; 
        
        -- quociente
        if tipo = '1' then
            res := aux_quo;   
        --resto
        else
            res := aux_res;        
        end if;            
        return res;       
    end div;
end package body proc_func;            
            
            