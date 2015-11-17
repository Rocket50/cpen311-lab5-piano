library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.sample_generator_decs.all;

entity sample_generator_TB is
end sample_generator_TB;

architecture impl of sample_generator_TB is
  
    signal CLOCK_50 : std_logic := '0';
    signal SW : std_logic_vector(17 downto 0);
    signal KEY : std_logic_vector(3 downto 0);
    signal write_ready : std_logic;
    signal write_s : std_logic;
    signal reset : std_logic;
    signal writedata_left, writedata_right: std_logic_vector(23 downto 0);
    
  begin
    DUT : sample_generator port map(CLOCK_50, SW, KEY, write_ready, write_s, reset, writedata_left, writedata_right);
    process begin
      write_ready <= '1';
      reset <= '1';
      
      wait for 10 ps;
      
      reset <= '0';
      wait for 50 ps;
      
      for I in 0 to 1000 loop
        
        wait for 50 ps;
        
        if(I = 50) then
          write_ready <= '0';
        end if;
        
        if(I = 70) then
          write_ready <= '1';
        end if;
        CLOCK_50 <= not CLOCK_50;
        
      end loop;
      
      wait;
    end process;
end impl;