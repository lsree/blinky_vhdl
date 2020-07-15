----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2020 08:04:55 PM
-- Design Name: 
-- Module Name: blink_vhdl - blink_vhdl_arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity blink_vhdl is
    Port ( EN    : in STD_LOGIC;
           SW0   : in STD_LOGIC;
           SW1   : in STD_LOGIC;
           clk   : in STD_LOGIC;
           LD0   : out STD_LOGIC;
           LD1   : out STD_LOGIC;
           LD2   : out STD_LOGIC;
           LD3   : out STD_LOGIC;
           LD4   : out STD_LOGIC);
end blink_vhdl;

architecture blink_vhdl_arch of blink_vhdl is
    --constants IOT divide 100Mhz to relevant freqs
    constant CNT_100HZ  :   natural := 1000000;
    constant CNT_50HZ   :   natural := 2000000;
    constant CNT_10HZ   :   natural := 10000000;
    constant CNT_1HZ    :   natural := 100000000;

    --signals to count up to dividor value
    signal i_CNT_100HZ  :   natural range 0 to CNT_100HZ;
    signal i_CNT_50HZ   :   natural range 0 to CNT_50HZ; 
    signal i_CNT_10HZ   :   natural range 0 to CNT_10HZ; 
    signal i_CNT_1HZ    :   natural range 0 to CNT_1HZ;  

    signal ld_100HZ  :   std_logic := '0';
    signal ld_50HZ   :   std_logic := '0';
    signal ld_10HZ   :   std_logic := '0';
    signal ld_1HZ    :   std_logic := '0';

begin
    p_100Hz : process (clk) is
    begin
        if rising_edge(clk) then
            if i_CNT_100HZ < CNT_100HZ then
                i_CNT_100HZ <= i_CNT_100HZ + 1;
            else
                i_CNT_100HZ <= 0;
                ld_100HZ <= not ld_100HZ;
            end if;
        end if;   
    end process p_100Hz;

    p_50Hz : process (clk) is
    begin
        if rising_edge(clk) then
            if i_CNT_50HZ < CNT_50HZ then
                i_CNT_50HZ <= i_CNT_50HZ + 1;
            else
                i_CNT_50HZ <= 0;
                ld_50HZ <= not ld_50HZ;
            end if;
        end if;   
    end process p_50Hz;

    p_10Hz : process (clk) is
    begin
        if rising_edge(clk) then
            if i_CNT_10HZ < CNT_10HZ then
                i_CNT_10HZ <= i_CNT_10HZ + 1;
            else
                i_CNT_10HZ <= 0;
                ld_10HZ <= not ld_10HZ;
            end if;
        end if;   
    end process p_10Hz;

    p_1Hz : process (clk) is
    begin
        if rising_edge(clk) then
            if i_CNT_1HZ < CNT_1HZ then
                i_CNT_1HZ <= i_CNT_1HZ + 1;
            else
                i_CNT_1HZ <= 0;
                ld_1HZ <= not ld_1HZ;
            end if;
        end if;   
    end process p_1Hz;

    LD0 <= ld_100HZ;
    LD1 <= ld_50HZ;
    LD2 <= ld_10HZ;
    LD3 <= ld_1HZ; 

    LD4 <= EN and ((ld_100HZ and  (SW0 nor SW1)) or 
                   (ld_50HZ and (not SW0 and SW1)) or
                   (ld_10HZ and (SW0 and not SW1)) or
                   (ld_1HZ and (SW0 and SW1)));
end blink_vhdl_arch;
