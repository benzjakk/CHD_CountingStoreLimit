----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:01:00 05/26/2021 
-- Design Name: 
-- Module Name:    BCDto7seg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCDto7seg is
    Port ( I : in  STD_LOGIC_VECTOR (3 downto 0);
           O : out  STD_LOGIC_VECTOR (6 downto 0));
end BCDto7seg;

architecture Behavioral of BCDto7seg is
begin
process(I)
begin 
case I is
when "0000" => O <= "0000001"; 
when "0001" => O <= "1001111"; 
when "0010" => O <= "0010010";
when "0011" => O <= "0000110"; 
when "0100" => O <= "1001100"; 
when "0101" => O <= "0100100"; 
when "0110" => O <= "0100000"; 
when "0111" => O <= "0001111"; 
when "1000" => O <= "0000000"; 
when "1001" => O <= "0000100"; 
when others => O <= "1111111"; 
end case;
end process;


end Behavioral;

