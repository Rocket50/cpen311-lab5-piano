library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package sample_generator_decs is
  component sample_generator is
    port(
       NOTES : in std_logic_vector(14 downto 0); 
       CLOCK_50 : in std_logic;
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
use work.NbitRegDecs.all;

entity sample_generator is
  port(CLOCK_50 : in std_logic;
       NOTES : in std_logic_vector(14 downto 0); 
       KEY : in std_logic_vector(3 downto 0);
       write_ready : in std_logic;
       write_s : out std_logic;
       reset : in std_logic;
       writedata_left, writedata_right: out std_logic_vector(23 downto 0));
       
end entity; 

architecture impl of sample_generator is
  
  constant C_CounterLen : integer := 8;
  constant AMP : integer := 16384;
  constant AMPPOS : unsigned(writedata_left'LENGTH-1 downto 0) := to_unsigned(AMP,writedata_left'LENGTH); 
  constant AMPNEG : unsigned(writedata_left'LENGTH-1 downto 0) := (unsigned(not(AMPPOS)) + 1); 
  signal writedata : std_logic_vector(writedata_left'LENGTH-1 downto 0) := (others => '0');
  
  constant Csamps : integer := 180;
  constant Dsamps : integer := 161;
  constant Esamps : integer := 143;
  constant Fsamps : integer := 135;
  constant Gsamps : integer := 120;
  constant Asamps : integer := 107; 
  constant Bsamps : integer := 95; 
  constant C2samps : integer := 90; 
  constant D2samps : integer := 80; 
  
  constant Cshsamps : integer := 170;
  constant Eflsamps : integer := 152;
  constant Fshsamps : integer := 127;
  constant Gshsamps : integer := 113;
  constant Bflsamps : integer := 101; 
  
  signal C,D,E,F,G,A,B,C2,D2 : unsigned(writedata_left'LENGTH-1 downto 0) := (others => '0');
  signal Csh,Efl,Fsh,GSh,Bfl : unsigned(writedata_left'LENGTH-1 downto 0) := (others => '0');
  
  
  
  begin
    --C NOTE--
    process(CLOCK_50) 
      
      variable note_counter : integer := 0;
      variable note_highLow : std_logic := '0';
      
      begin
        if(rising_edge(CLOCK_50)) then
          if(write_ready = '1') then
            if(note_counter = Csamps) then --no clue why 181 in particular works, even though it should be half that.
              note_highLow := not note_highLow;
              note_counter := 0;
            else
              note_counter := note_counter + 1;
            end if;
            
            else
  
          end if;
        
        if(NOTES(13) = '1') then  
          if(note_highLow = '1') then
            C <= AMPPOS;
          else
            C <= AMPNEG;
          end if;
        else
          C <= (others => '0');
        end if;
        
      end if;
        
    end process; 
    --C# NOTE--
    process(CLOCK_50) 
      
      variable note_counter : integer := 0;
      variable note_highLow : std_logic := '0';
      
      begin
        if(rising_edge(CLOCK_50)) then
          if(write_ready = '1') then
            if(note_counter = Cshsamps) then
              note_highLow := not note_highLow;
              note_counter := 0;
            else
              note_counter := note_counter + 1;
            end if;     
            else
          end if;
        
        if(NOTES(12) = '1') then  
          if(note_highLow = '1') then
            Csh <= AMPPOS;
          else
            Csh <= AMPNEG;
          end if;
        else
          Csh <= (others => '0');
        end if;
      end if;
    end process;
    
    --D NOTE--
    process(CLOCK_50) 
      
      variable note_counter : integer := 0;
      variable note_highLow : std_logic := '0';
      
      begin
        if(rising_edge(CLOCK_50)) then
          if(write_ready = '1') then
            if(note_counter = Dsamps) then
              note_highLow := not note_highLow;
              note_counter := 0;
            else
              note_counter := note_counter + 1;
            end if;     
            else
          end if;
        
        if(NOTES(11) = '1') then  
          if(note_highLow = '1') then
            D <= AMPPOS;
          else
            D <= AMPNEG;
          end if;
        else
          D <= (others => '0');
        end if;
      end if;
    end process;

    
    --Eb NOTE--
    process(CLOCK_50) 
      
      variable note_counter : integer := 0;
      variable note_highLow : std_logic := '0';
      
      begin
        if(rising_edge(CLOCK_50)) then
          if(write_ready = '1') then
            if(note_counter = Eflsamps) then
              note_highLow := not note_highLow;
              note_counter := 0;
            else
              note_counter := note_counter + 1;
            end if;     
            else
          end if;
        
        if(NOTES(10) = '1') then  
          if(note_highLow = '1') then
            Efl <= AMPPOS;
          else
            Efl <= AMPNEG;
          end if;
        else
          Efl <= (others => '0');
        end if;
      end if;
    end process;
    
    --E NOTE--
    process(CLOCK_50) 
      
      variable note_counter : integer := 0;
      variable note_highLow : std_logic := '0';
      
      begin
        if(rising_edge(CLOCK_50)) then
          if(write_ready = '1') then
            if(note_counter = Esamps) then
              note_highLow := not note_highLow;
              note_counter := 0;
            else
              note_counter := note_counter + 1;
            end if;     
            else
          end if;
        
        if(NOTES(9) = '1') then  
          if(note_highLow = '1') then
            E <= AMPPOS;
          else
            E <= AMPNEG;
          end if;
        else
          E <= (others => '0');
        end if;
      end if;
    end process;
    
    --F NOTE--
    process(CLOCK_50) 
      
      variable note_counter : integer := 0;
      variable note_highLow : std_logic := '0';
      
      begin
        if(rising_edge(CLOCK_50)) then
          if(write_ready = '1') then
            if(note_counter = Fsamps) then
              note_highLow := not note_highLow;
              note_counter := 0;
            else
              note_counter := note_counter + 1;
            end if;     
            else
          end if;
        
        if(NOTES(8) = '1') then  
          if(note_highLow = '1') then
            F <= AMPPOS;
          else
            F <= AMPNEG;
          end if;
        else
          F <= (others => '0');
        end if;
      end if;
    end process;
    
    --F# NOTE--
    process(CLOCK_50) 
      
      variable note_counter : integer := 0;
      variable note_highLow : std_logic := '0';
      
      begin
        if(rising_edge(CLOCK_50)) then
          if(write_ready = '1') then
            if(note_counter = Fshsamps) then
              note_highLow := not note_highLow;
              note_counter := 0;
            else
              note_counter := note_counter + 1;
            end if;     
            else
          end if;
        
        if(NOTES(7) = '1') then  
          if(note_highLow = '1') then
            Fsh <= AMPPOS;
          else
            Fsh <= AMPNEG;
          end if;
        else
          Fsh <= (others => '0');
        end if;
      end if;
    end process;
    
      --G NOTE--
    process(CLOCK_50) 
      
      variable note_counter : integer := 0;
      variable note_highLow : std_logic := '0';
      
      begin
        if(rising_edge(CLOCK_50)) then
          if(write_ready = '1') then
            if(note_counter = Gsamps) then
              note_highLow := not note_highLow;
              note_counter := 0;
            else
              note_counter := note_counter + 1;
            end if;     
            else
          end if;
        
        if(NOTES(6) = '1') then  
          if(note_highLow = '1') then
            G <= AMPPOS;
          else
            G <= AMPNEG;
          end if;
        else
          G <= (others => '0');
        end if;
      end if;
    end process;
    --G# NOTE--
    process(CLOCK_50) 
      
      variable note_counter : integer := 0;
      variable note_highLow : std_logic := '0';
      
      begin
        if(rising_edge(CLOCK_50)) then
          if(write_ready = '1') then
            if(note_counter = Gshsamps) then
              note_highLow := not note_highLow;
              note_counter := 0;
            else
              note_counter := note_counter + 1;
            end if;     
            else
          end if;
        
        if(NOTES(5) = '1') then  
          if(note_highLow = '1') then
            Gsh <= AMPPOS;
          else
            Gsh <= AMPNEG;
          end if;
        else
          Gsh <= (others => '0');
        end if;
      end if;
    end process;
    --A NOTE--
    process(CLOCK_50) 
      
      variable note_counter : integer := 0;
      variable note_highLow : std_logic := '0';
      
      begin
        if(rising_edge(CLOCK_50)) then
          if(write_ready = '1') then
            if(note_counter = Asamps) then
              note_highLow := not note_highLow;
              note_counter := 0;
            else
              note_counter := note_counter + 1;
            end if;     
            else
          end if;
        
        if(NOTES(4) = '1') then  
          if(note_highLow = '1') then
            A <= AMPPOS;
          else
            A <= AMPNEG;
          end if;
        else
          A <= (others => '0');
        end if;
      end if;
    end process;
    --Bb NOTE--
    process(CLOCK_50) 
      
      variable note_counter : integer := 0;
      variable note_highLow : std_logic := '0';
      
      begin
        if(rising_edge(CLOCK_50)) then
          if(write_ready = '1') then
            if(note_counter = Bflsamps) then
              note_highLow := not note_highLow;
              note_counter := 0;
            else
              note_counter := note_counter + 1;
            end if;     
            else
          end if;
        
        if(NOTES(3) = '1') then  
          if(note_highLow = '1') then
            Bfl <= AMPPOS;
          else
            Bfl <= AMPNEG;
          end if;
        else
          Bfl <= (others => '0');
        end if;
      end if;
    end process;
    --B note
    process(CLOCK_50) 
      
      variable note_counter : integer := 0;
      variable note_highLow : std_logic := '0';
      
      begin
        if(rising_edge(CLOCK_50)) then
          if(write_ready = '1') then
            if(note_counter = Bsamps) then
              note_highLow := not note_highLow;
              note_counter := 0;
            else
              note_counter := note_counter + 1;
            end if;     
            else
          end if;
        
        if(NOTES(2) = '1') then  
          if(note_highLow = '1') then
            B <= AMPPOS;
          else
            B <= AMPNEG;
          end if;
        else
          B <= (others => '0');
        end if;
      end if;
    end process;
    
    --C2 note
    process(CLOCK_50) 
      
      variable note_counter : integer := 0;
      variable note_highLow : std_logic := '0';
      
      begin
        if(rising_edge(CLOCK_50)) then
          if(write_ready = '1') then
            if(note_counter = C2samps) then
              note_highLow := not note_highLow;
              note_counter := 0;
            else
              note_counter := note_counter + 1;
            end if;     
            else
          end if;
        
        if(NOTES(1) = '1') then  
          if(note_highLow = '1') then
            C2 <= AMPPOS;
          else
            C2 <= AMPNEG;
          end if;
        else
          C2 <= (others => '0');
        end if;
      end if;
    end process;
    
    process(CLOCK_50) 
      
      variable note_counter : integer := 0;
      variable note_highLow : std_logic := '0';
      
      begin
        if(rising_edge(CLOCK_50)) then
          if(write_ready = '1') then
            if(note_counter = D2samps) then
              note_highLow := not note_highLow;
              note_counter := 0;
            else
              note_counter := note_counter + 1;
            end if;     
            else
          end if;
        
        if(NOTES(0) = '1') then  
          if(note_highLow = '1') then
            D2 <= AMPPOS;
          else
            D2 <= AMPNEG;
          end if;
        else
          D2 <= (others => '0');
        end if;
      end if;
    end process;
    
    write_s <= write_ready;
    writedata <= std_logic_vector(C + Csh + D + Efl + E + F + Fsh + G + Gsh + A + Bfl + B + C2 + D2);
    writedata_left <= writedata;
    writedata_right <= writedata;
    
end impl; 