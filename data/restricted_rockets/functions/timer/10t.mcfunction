# Copyright © 2022-2023 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# 10t (0.5s) timer
schedule function __:timer/10t 10t

execute as @a run function __:timer/10t/all_players
{
    # config trigger
    execute if score @s __config matches 1 run function __:player_config
    #!sb @s __config = 0
    # enable triggers
    #!sb enable @s __config
    #!sb enable @s __max_rockets
    #!sb enable @s __override_max_rockets
    #!sb enable @s __safe_elytra_break
    #!sb enable @s __override_safe_elytra_break
    #!sb enable @s __rockets_tip
    #!sb enable @s __override_rockets_tip
    #!sb enable @s __zero_rockets_tip_always
    #!sb enable @s __override_zero_rockets_tip_always

    # on ground
    execute as @s[nbt={OnGround:1b}] run function __:reset_flight

    # in liquid
    #!sb @s __in_liquid = 0
    execute at @s if block ~ ~ ~ water run scoreboard players set @s __in_liquid 1
    execute at @s if block ~ ~ ~ lava run scoreboard players set @s __in_liquid 1

    execute as @s[scores={__in_liquid=1}] run function __:timer/10t/all_players/in_liquid
    {
        # speed limit
        #!sb global __temp1 = 100
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
            execute store result score global __temp3 run data get entity @s Pos[1] 1000
            #!sb global __temp3 -= @s __y_pos
            # absolute value
            execute if score global __temp3 matches ..0 run scoreboard players operation global __temp3 *= global __temp2

            # y speed limit check
            execute if score global __temp3 < global __temp1 run function __:timer/10t/all_players/in_liquid/no_player_lock/x_passed/y_passed
            {
                # find z speed
                execute store result score global __temp3 run data get entity @s Pos[2] 1000
                #!sb global __temp3 -= @s __z_pos
                # absolute value
                execute if score global __temp3 matches ..0 run scoreboard players operation global __temp3 *= global __temp2

                # z speed limit check
                execute if score global __temp3 < global __temp1 run function __:reset_flight
            }
        }
    }

    # safe elytra break slow falling
    execute as @s[scores={__slow_falling=1}] run function __:timer/10t/all_players/safe_elytra_break
    {
        # client cannot override & global rule is set to true
        execute if score global __override_safe_elytra_break matches 0 run \
            execute if score global __safe_elytra_break matches 1 run \
            effect give @s slow_falling 2

        # client overridable
        execute if score global __override_safe_elytra_break matches 1 run function __:timer/10t/all_players/safe_elytra_break/overridable
        {
            # not overridden & server is set to true
            execute if score @s __override_safe_elytra_break matches 0 run \
                execute if score global __safe_elytra_break matches 1 run \
                effect give @s slow_falling 2

            # overridden & client is set to true
            execute if score @s __override_safe_elytra_break matches 1 run \
                execute if score @s __safe_elytra_break matches 1 run \
                effect give @s slow_falling 2
        }
    }

    # set @s __temp2 as client's __max_rockets
    function __:calc_max_rockets
    # calc @s __rockets_remaining
    #!sb @s __rockets_remaining = @s __temp2
    #!sb @s __rockets_remaining -= @s __rockets_used_while_flying

    execute as @s[scores={__rockets_remaining=0}] run function __:player_config/no_rockets
    {
        #!sb @s __zero_rockets_tip_always += 0
        #!sb @s __override_zero_rockets_tip_always += 0

        # @s __temp3 persistent zero rockets tip
        #!sb @s __temp3 = 0
        # not overridden & server is set to true
        execute as @s[scores={__override_zero_rockets_tip_always=0}] run \
            execute if score global __zero_rockets_tip_always matches 1 run \
            scoreboard players set @s __temp3 1
        # overridden & client is set to true
        execute as @s[scores={__override_zero_rockets_tip_always=1,__zero_rockets_tip_always=1}] run \
            scoreboard players set @s __temp3 1

        # persistent zero rockets tip (double updates __temp2 as __max_rockets & __rockets_remaining but oh well)
        execute as @s[scores={__temp3=1}] run \
            execute as @s[nbt={FallFlying:1b}] run function __:display_rocket_count
    }

    #!sb @s __time_since_cancelled += 1

    execute store result score @s __x_pos run data get entity @s Pos[0] 1000
    execute store result score @s __y_pos run data get entity @s Pos[1] 1000
    execute store result score @s __z_pos run data get entity @s Pos[2] 1000
}
