----------------------------------------------------------------------------------
-- Student: Fernando Homem da costa
-- 
-- Create Date:    03:28:58 09/19/2020 
-- Module Name:    maquina_estados - rtl 
-- Project Name:   LAB3-Elevador
--
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY elevator_tb IS
END elevator_tb;
 
ARCHITECTURE behavior OF elevator_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT elevator
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         LIGHT : IN  std_logic;
         UP_DOWN : IN  std_logic;
         FLOOR : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal LIGHT : std_logic := '0';
   signal UP_DOWN : std_logic := '0';

 	--Outputs
   signal FLOOR : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: elevator PORT MAP (
          CLK => CLK,
          RST => RST,
          LIGHT => LIGHT,
          UP_DOWN => UP_DOWN,
          FLOOR => FLOOR
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

	-- Stimulus process
	stim_proc: process
	begin
		wait for 100 ns;
		RST <= '1';
		LIGHT <= '0';
		UP_DOWN <= '0';

		wait for CLK_PERIOD;

		RST <= '0';
		LIGHT <= '0';
		UP_DOWN <='1';

		wait for CLK_PERIOD;

		RST <= '0';
		LIGHT <= '1';
		UP_DOWN <='1';

		wait for CLK_PERIOD*2;

		RST <= '0';
		LIGHT <= '0';
		UP_DOWN <='0';
		wait for CLK_PERIOD;

		wait;
end process;

END;
