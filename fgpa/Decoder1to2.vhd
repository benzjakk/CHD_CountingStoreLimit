----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:58:14 05/26/2021 
-- Design Name: 
-- Module Name:    Decoder1to2 - Behavioral 
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

entity Decoder1to2 is
    Port ( I : in  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (1 downto 0));
end Decoder1to2;

architecture Behavioral of Decoder1to2 is

begin
	process(I)
	begin
	case I is
		when "0" => O <= "01"; when "01" => O <= "10";
	end case;
	end process;

end Behavioral;

