----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:17:34 05/26/2021 
-- Design Name: 
-- Module Name:    Display - Behavioral 
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

entity Display is
    Port ( D1 : in  STD_LOGIC_VECTOR (3 downto 0);
           D10 : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC;
           D0 : out  STD_LOGIC_VECTOR (6 downto 0));
end Display;

architecture Behavioral of Display is
	component MUX2_4bit
		port(D1,D2 : in std_logic_vector(3 downto 0);
		S:in std_logic;
		O : out std_logic_vector(3 downto 0));
	end component;
	component BCDto7seg
		port(O:out std_logic_vector(6 downto 0);
		I : in std_logic_vector(3 downto 0));
	end component;
	signal A:std_logic_vector(3 downto 0);
begin
IC1:MUX2_4bit port map(D1=>D1,D2=>D10,S=>S,O=>A);
IC2:BCDto7seg port map(I=>A,O=>D0);


end Behavioral;

