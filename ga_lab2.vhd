library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ga_lab2 is
	port (
		clk           : in std_logic ;
		reset         : in std_logic ; -- reset_n
		segu          : out std_logic_vector (6 downto 0);
		segd          : out std_logic_vector (6 downto 0);
		segc          : out std_logic_vector (6 downto 0)
	);
end entity ga_lab2;
	
architecture behav of ga_lab2 is
   component lab2_qs is
        port (
            clk_clk                          : in  std_logic                    := 'X'; -- clk
            pio_0_external_connection_export : out std_logic_vector(3 downto 0);        -- export
            pio_1_external_connection_export : out std_logic_vector(3 downto 0);        -- export
            pio_2_external_connection_export : out std_logic_vector(3 downto 0);        -- export
            reset_reset_n                    : in  std_logic                    := 'X'  -- reset_n
        );
	end component lab2_qs;
	
	component segdecod is
		PORT (
				Entree:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				Sortie:OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
		);
	end component segdecod;
	
	signal seguwire : std_logic_vector(3 downto 0);
	signal segdwire : std_logic_vector(3 downto 0);
	signal segcwire : std_logic_vector(3 downto 0);
	
	begin
	
	u0 : component lab2_qs
        port map (
            clk_clk                          => clk,                          --                       clk.clk
            pio_0_external_connection_export => seguwire, -- pio_0_external_connection.export
            pio_1_external_connection_export => segdwire, -- pio_1_external_connection.export
            pio_2_external_connection_export => segcwire, -- pio_2_external_connection.export
            reset_reset_n                    => reset                     --                     reset.reset_n
        );
		  
	u1 : component segdecod
		  port map (
				Entree									=> seguwire,
				Sortie									=> segu
		  );
		  
	u2 : component segdecod
		  port map (
				Entree									=> segdwire,
				Sortie									=> segd
		  );
		
	u3 : component segdecod
		  port map (
				Entree									=> segcwire,
				Sortie									=> segc
		  );
		
		

end architecture behav;
