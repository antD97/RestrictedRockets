# Copyright © 2022-2023 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# 1t (0.1s) timer
schedule function __:timer/1t 1t

execute as @a run function __:timer/1t/all_players
{
    # flying
    execute as @s[nbt={FallFlying:1b}] run function __:timer/1t/all_players/flying
    {
        execute as @s[scores={__time_flying=..1}] run scoreboard players add @s __time_flying 1

        # display rocket count on start flying
        execute as @s[scores={__time_flying=1}] run function __:timer/1t/all_players/flying/start
        {
            # sets @s __temp3 as client's __rocket_tip
            function __:check_rocket_tip
            # rocket tip
            execute if score @s __temp3 matches 1 run function __:display_rocket_count
        }

        # on rocket use
        execute as @s[scores={__rockets_used=1..}] run function __:timer/1t/all_players/flying/rocket_used
        {
            # count rocket boost rockets
            scoreboard players add @s __rockets_used_while_flying 1
            
            # sets @s __temp3 as client's __rocket_tip
            function __:check_rocket_tip
            # rocket tip
            execute if score @s __temp3 matches 1 run function __:display_rocket_count
        }

        # @s __temp2 used as client's __max_rockets
        function __:calc_max_rockets

        # if rocket boost rockets > max rockets
        execute if score @s __rockets_used_while_flying > @s __temp2 run function __:timer/1t/all_players/flying/cancel_flight
        {
            #!sb @s __time_since_cancelled = 0

            # if the elytra is not already repairable
            execute store result score __ __temp1 run data get entity @s Inventory[{Slot:102b}].components.minecraft:custom_data.__repairable
            execute if score __ __temp1 matches 0 run function __:timer/1t/all_players/flying/cancel_flight/not_repairable
            {
                # temp break elytra
                execute store result storage __:elytra Damage int 1 run data get entity @s Inventory[{Slot:102b}].components.minecraft:damage
                item modify entity @s armor.chest __:save_prev_damage
                item modify entity @s armor.chest __:set_break_lore
                item modify entity @s armor.chest __:set_repairable

                # safe elytra break
                #!sb @s __slow_falling = 1
            }

            item modify entity @s armor.chest __:break_elytra
        }
    }

    #!sb @s __rockets_used = 0
}
