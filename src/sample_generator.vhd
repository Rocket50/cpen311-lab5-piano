library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package sample_generator_decs is
  component sample_generator is
    port(CLOCK_50 : in std_logic;
       SW : in std_logic_vector(17 downto 0);
       KEY : in std_logic_vector(3 downto 0);
       write_ready : in std_logic;
       write_s : out std_logic;
       reset : in std_logic;
       writedata_left, writedata_right: out std_logic_vector(23 downto 0));
  end component; 
end package; 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sample_generator is
  port(CLOCK_50 : in std_logic;
       SW : in std_logic_vector(17 downto 0);
       KEY : in std_logic_vector(3 downto 0);
       write_ready : in std_logic;
       write_s : out std_logic;
       reset : in std_logic;
       writedata_left, writedata_right: out std_logic_vector(23 downto 0));
       
end entity; 

architecture impl of sample_generator is
  begin
    process(all) begin
    end process; 
end impl; 