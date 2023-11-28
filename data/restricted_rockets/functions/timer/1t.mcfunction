# Copyright © 2022 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# 1t (0.1s) timer
schedule function __:timer/1t 1t

execute as @a run function __:timer/1t/all_players
{
    # flying
    execute as @s[nbt={FallFlying:1b}] run function __:timer/1t/all_players/flying
    {
        # actionbar rocket count
        execute as @s[scores={__time_flying=..1}] run scoreboard players add @s __time_flying 1
        #!sb @s __rockets_remaining = global __max_rockets
        #!sb @s __rockets_remaining -= @s __rockets_used_while_flying
        execute as @s[scores={__time_flying=1}] run function __:display_rocket_count
        execute as @s[scores={__rockets_remaining=0}] run function __:display_rocket_count

        # count rocket boost rockets
        execute as @s[scores={__rockets_used=1..}] run function __:timer/1t/all_players/flying/rocket_used
        {
            scoreboard players add @s __rockets_used_while_flying 1

            # actionbar rocket count
            #!sb @s __rockets_remaining = global __max_rockets
            #!sb @s __rockets_remaining -= @s __rockets_used_while_flying
            execute as @s run function __:display_rocket_count
        }

        # if rocket boost rockets > max rockets
        execute if score @s __rockets_used_while_flying > global __max_rockets run function __:timer/1t/all_players/flying/cancel_flight
        {
            #!sb @s __time_since_cancelled = 0

            # if the elytra is not already repairable
            execute store result score global __temp1 run data get entity @s Inventory[{Slot:102b}].tag.__repairable
            execute if score global __temp1 matches 0 run function __:timer/1t/all_players/flying/cancel_flight/not_repairable
            {
                # temp break elytra
                execute store result storage __:elytra Damage int 1 run data get entity @s Inventory[{Slot:102b}].tag.Damage
                item modify entity @s armor.chest __:save_prev_damage
                item modify entity @s armor.chest __:set_break_lore
                item modify entity @s armor.chest __:set_repairable
            }

            item modify entity @s armor.chest __:break_elytra
        }
    }

    #!sb @s __rockets_used = 0
}
