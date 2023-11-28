# Copyright © 2022 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# 10t (0.5s) timer
schedule function __:timer/10t 10t

execute as @a run function __:timer/10t/all_players
{
    # enable triggers
    #!sb enable @s __max_rockets
    #!sb enable @s __override_max_rockets
    #!sb enable @s __safe_elytra_break
    #!sb enable @s __override_safe_elytra_break
    #!sb enable @s __display
    #!sb enable @s __override_display

    # config trigger
    execute if score @s __config matches 1 run function __:player_config
    #!sb enable @s __config
    #!sb @s __config = 0

    # on ground
    execute as @s[nbt={OnGround:1b}] run function __:reset_flight

    # in liquid
    #!sb @s __in_liquid = 0
    execute at @s if block ~ ~ ~ water run scoreboard players set @s __in_liquid 1
    execute at @s if block ~ ~ ~ lava run scoreboard players set @s __in_liquid 1

    execute as @s[scores={__in_liquid=1}] run function __:timer/10t/all_players/in_liquid
    {
        # speed limit
        #!sb global __temp1 = 50
        # constant -1
        #!sb global __temp2 = -1

        # find x speed
        execute store result score global __temp3 run data get entity @s Pos[0] 1000
        #!sb global __temp3 -= @s __x_pos
        # absolute value
        execute if score global __temp3 matches ..0 run scoreboard players operation global __temp3 *= global __temp2

        # x speed limit check
        execute if score global __temp3 < global __temp1 run function __:timer/10t/all_players/in_liquid/no_player_lock/x_passed
        {
            # find y speed
            execute store result score global temp3 run data get entity @s Pos[1] 1000
            #!sb global temp3 -= @s __y_pos
            # absolute value
            execute if score global __temp3 matches ..0 run scoreboard players operation global __temp3 *= global __temp2

            # y speed limit check
            execute if score global __temp3 < global __temp1 run function __:timer/10t/all_players/in_liquid/no_player_lock/x_passed/y_passed
            {
                # find z speed
                execute store result score global temp3 run data get entity @s Pos[2] 1000
                #!sb global temp3 -= @s __z_pos
                # absolute value
                execute if score global __temp3 matches ..0 run scoreboard players operation global __temp3 *= global __temp2

                # z speed limit check
                execute if score global __temp3 < global __temp1 run function __:reset_flight
            }
        }
    }

    #!sb @s __time_since_cancelled += 1

    execute store result score @s __x_pos run data get entity @s Pos[0] 1000
    execute store result score @s __y_pos run data get entity @s Pos[1] 1000
    execute store result score @s __z_pos run data get entity @s Pos[2] 1000
}
