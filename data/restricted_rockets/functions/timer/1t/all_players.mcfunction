# Copyright © 2022 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# execute as each player every 1t (0.05s)

# cancel previous tick levitation
execute as @s[scores={__clear_levitation=1}] run function __:timer/1t/all_players/clear_levitation
{
    effect clear @s levitation
    #!sb @s __clear_levitation = 0
}

# flying
execute as @s[nbt={FallFlying:1b}] run function __:timer/1t/all_players/flying
{
    # count rocket boost rockets
    execute as @s[scores={__rockets_used=1..}] run scoreboard players add @s __rockets_used_while_flying 1

    # if rocket boost rockets > max rockets
    execute if score @s __rockets_used_while_flying > global __max_rockets run function __:timer/1t/all_players/flying/cancel_flight
    {
        # apply levitation for 1t to cancel flight
        effect give @s levitation 1 0 true
        #!sb @s __clear_levitation = 1

        # summon player lock
        #!sb @s __summoned_player_lock += 0
        execute as @s[scores={__summoned_player_lock=0}] run function __:timer/1t/all_players/flying/cancel_flight/create_player_lock
        {
            execute at @s run summon armor_stand ~ ~ ~ {Tags:["__player_lock","__new"],Invulnerable:1b,Invisible:1b}
            data modify entity @e[type=armor_stand,tag=__new,limit=1] Motion set from entity @s Motion

            # set player lock id
            #!sb global __temp1 = @s __id
            execute as @e[type=armor_stand,tag=__new] run function __:timer/1t/all_players/flying/cancel_flight/create_player_lock/new_player_lock
            {
                #!sb @s __id = global __temp1
                tag @s remove __new
            }

            #!sb @s __summoned_player_lock = 1
        }
    }
}

#!sb @s __rockets_used = 0
