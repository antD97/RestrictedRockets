# Copyright © 2022 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# 1t (0.05s) timer
schedule function __:timer/1t 1t

execute as @a run function __:timer/1t/all_players

execute as @e[type=armor_stand,tag=__player_lock] run function __:timer/1t/all_player_locks
{
    # tp player with matching id to the player lock
    #!sb global __temp1 = @s __id
    execute at @s as @a run execute rotated as @s if score @s __id = global __temp1 run tp ~ ~ ~
}
