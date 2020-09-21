----------------------------------------------------------------------------------
-- Student: Fernando Homem da costa
-- 
-- Create Date:    03:28:58 09/19/2020 
-- Module Name:    maquina_estados - rtl 
-- Project Name:   LAB2-Elevador
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity elevator is
    port ( 
            CLK, RST, LIGHT, UP_DOWN : in  std_logic;
            FLOOR : out  std_logic
        );
    end elevator;

architecture rtl of elevator is

type floor_state_type is (ground, first_floor);

signal floor_state : floor_state_type;

begin
    floor_state_machine: process(CLK)
    begin
        if CLK'event and CLK = '1' then
            if RST = '1' then
                floor_state <= ground;
            else
                case floor_state is
                    when ground =>
                        if(UP_DOWN = '1' and LIGHT = '0') then
                            floor_state <= first_floor;
                        else
                            floor_state <= ground;
                        end if;

                    when first_floor =>
                        if(UP_DOWN = '1' and LIGHT = '0') then
                            floor_state <= ground;
                        else
                            floor_state <= first_floor;
                        end if;

                    when others =>
                        floor_state <= first_floor;
                end case;
            end if;
        end if;
end process;

floor <= "0" when (floor_state = ground) else
         "1" when (floor_state = first_floor);
end rtl;