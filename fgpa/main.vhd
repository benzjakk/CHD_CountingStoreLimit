----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:56:45 05/26/2021 
-- Design Name: 
-- Module Name:    main - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( Sen1 : in  STD_LOGIC;
           Sen2 : in  STD_LOGIC;
           Data : out  STD_LOGIC_VECTOR (6 downto 0);
           seg : out  STD_LOGIC_VECTOR (1 downto 0);
           CLK : in  STD_LOGIC);
end main;

architecture Behavioral of main is
	component UP_DOWNCOUNT15
		port(Sen1,Sen2:in std_logic;
		D1 , D10: out std_logic_vector(3 downto 0));
	end component;
	component Display
		port(D1,D10 : in std_logic_vector(3 downto 0);
		s:in std_logic;
		D0:out std_logic_vector(6 downto 0));
	end component;
	component Decoder1to2
		port(I : in std_logic;
		O:out std_logic_vector(1 downto 0));
	end component;
	component ClockDivider
		port (clk,reset: in std_logic;
		clock_out: out std_logic);
	end component;
	signal A,B : std_logic_vector( 3 downto 0);
	signal C : std_logic;
	
begin
	IC1:UP_DOWNCOUNT15 port map(Sen1=>Sen1,Sen2=>Sen2,D1=>A,D10=>B);
	IC2:Display port map(D1=>A,D10=>B,S=>C,D0=>Data);
	IC3:Decoder1to2 port map(I=>C , O=>seg);
	IC4:ClockDivider port map(clk => CLK,reset=>'0',clock_out=>C);
	

end Behavioral;

