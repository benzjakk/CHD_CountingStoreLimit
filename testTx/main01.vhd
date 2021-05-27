----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:59:59 05/27/2021 
-- Design Name: 
-- Module Name:    main01 - Behavioral 
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

entity main01 is
	port(tx: out std_logic;
		CLK : in std_logic;
		but1 : in std_logic;
		rx : in std_logic;
		sw1 : in std_logic;
		led1,led2 : out std_logic
		);
end main01;

architecture Behavioral of main01 is
	component UART_TX 
	port(i_Clk       : in  std_logic;
    i_TX_DV     : in  std_logic;
    i_TX_Byte   : in  std_logic_vector(7 downto 0);
    o_TX_Active : out std_logic;
    o_TX_Serial : out std_logic;
    o_TX_Done   : out std_logic);
	 end component;
	component Decoder1to4
	port( CLK : in std_logic;
			O : out std_logic_vector(3 downto 0));
	end component;
	component SwitchDis
	port(D1,D2,D3,D4 : in std_logic_vector(7 downto 0);
			DO : out std_logic_vector(7 downto 0);
			S : in std_logic_vector(3 downto 0));
	end component;
	component ClockDivider
	port ( clk,reset: in std_logic;
	clock_out: out std_logic);
	end component;
	component CountCurrent
	Port ( data : in  STD_LOGIC_vector( 7 downto 0);
				Max : in std_logic_vector( 7 downto 0);
           Trigger : in  STD_LOGIC;
			  Output : out std_logic_vector(7 downto 0));
	end component;
	component CountMax
	Port ( Sen : in  STD_LOGIC;
				Current : in std_logic_vector( 7 downto 0);
           CLK : in  STD_LOGIC;
			  Output : out std_logic_vector(7 downto 0));
	end component;
	component UART_RX
	port (
    i_Clk       : in  std_logic;
    i_RX_Serial : in  std_logic;
    o_RX_DV     : out std_logic;
    o_RX_Byte   : out std_logic_vector(7 downto 0)
    );
	end component;
	signal A : std_logic_vector( 3 downto 0);
	signal B : std_logic_vector(7 downto 0);
	signal C,Trigger : std_logic;
	signal Current,Max,Data_rx:std_logic_vector(7 downto 0);
begin
	IC1: UART_TX port map(i_Clk =>CLK,i_TX_DV=>'1',i_TX_Byte=>B,o_TX_Active=>led1,o_TX_Serial =>tx,o_TX_Done=>led2);
	IC2: Decoder1to4 port map(C,A);
	IC3: SwitchDis port map("01111110",Current,"01111111",Max,B,A);
	IC4: ClockDivider port map( CLK , '0',C);
	IC5: CountCurrent port map(Data_rx,Max,Trigger,Current);
	IC6: CountMax port map(sw1,Current,but1,Max);
	IC7: UART_RX port map(CLK,rx,Trigger,Data_rx);
	
	
end Behavioral;

