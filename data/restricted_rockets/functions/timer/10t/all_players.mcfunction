# Copyright © 2022 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# execute as each player every 10t (0.5s)

# --- dead --- #

execute as @s[scores={__time_alive=0}] run function __:timer/1t/all_players/dead
{
    # reset rockets
    scoreboard players set @s __rockets_used_while_flying 0

    # kill player lock
    #!sb global __temp1 = @s __id
    execute as @e[type=armor_stand,tag=__player_lock] run execute if score @s __id = global __temp1 run kill @s
    scoreboard players set @s __summoned_player_lock 0
}

# --- reset rockets used counter --- #

execute as @s[scores={__rockets_used_while_flying=1..}] run function __:timer/1t/all_players/resettable
{
    # on ground
    execute as @s[nbt={OnGround:1b}] run function __:timer/1t/all_players/resettable/reset_flight
    {
        # set temp2 to 1 if player lock age is old enough, 0 otherwise
        #!sb global __temp1 = @s __id
        #!sb global __temp2 = 0
        execute as @s[scores={__summoned_player_lock=1}] run execute as @e[type=armor_stand,tag=__player_lock] run execute if score @s __id = global __temp1 as @s[scores={__age=4..}] run scoreboard players set global __temp2 1
        # set temp2 to 1 if there is no player lock
        execute as @s[scores={__summoned_player_lock=0}] run scoreboard players set global __temp2 1

        # reset flight if player lock is old enough
        execute if score global __temp2 matches 1 run function __:timer/1t/all_players/resettable/reset_flight/old_player_lock
        {
            # sound
            execute at @s run playsound item.armor.equip_elytra player @s
            # reset rockets
            scoreboard players set @s __rockets_used_while_flying 0

            # kill player lock
            execute as @s[scores={__summoned_player_lock=1}] run function __:timer/1t/all_players/resettable/reset_flight/old_player_lock/clear_player_locks
            {
                #!sb global __temp1 = @s __id
                execute as @e[type=armor_stand,tag=__player_lock] run execute if score @s __id = global __temp1 run kill @s
                scoreboard players set @s __summoned_player_lock 0
            }
        }
    }

    # in liquid
    #!sb @s __in_liquid = 0
    execute at @s if block ~ ~ ~ water run scoreboard players set @s __in_liquid 1
    execute at @s if block ~ ~ ~ lava run scoreboard players set @s __in_liquid 1

    execute as @s[scores={__in_liquid=1}] run function __:timer/1t/all_players/resettable/in_liquid
    {
        # has a player lock
        execute as @s[scores={__summoned_player_lock=1}] run function __:timer/1t/all_players/resettable/reset_flight

        # has no player lock
        execute as @s[scores={__summoned_player_lock=0}] run function __:timer/1t/all_players/resettable/in_liquid/no_player_lock
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
            execute if score global __temp3 < global __temp1 run function __:timer/1t/all_players/resettable/in_liquid/no_player_lock/x_passed
            {
                # find y speed
                execute store result score global temp3 run data get entity @s Pos[1] 1000
                #!sb global temp3 -= @s __y_pos
                # absolute value
                execute if score global __temp3 matches ..0 run scoreboard players operation global __temp3 *= global __temp2

                # y speed limit check
                execute if score global __temp3 < global __temp1 run function __:timer/1t/all_players/resettable/in_liquid/no_player_lock/x_passed/y_passed
                {
                    # find z speed
                    execute store result score global temp3 run data get entity @s Pos[2] 1000
                    #!sb global temp3 -= @s __z_pos
                    # absolute value
                    execute if score global __temp3 matches ..0 run scoreboard players operation global __temp3 *= global __temp2

                    # z speed limit check
                    execute if score global __temp3 < global __temp1 run function __:timer/1t/all_players/resettable/reset_flight
                }
            }
        }
    }
}

execute store result score @s __x_pos run data get entity @s Pos[0] 1000
execute store result score @s __y_pos run data get entity @s Pos[1] 1000
execute store result score @s __z_pos run data get entity @s Pos[2] 1000
