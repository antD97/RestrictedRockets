# Copyright © 2022 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# 10t (0.5s) timer
schedule function __:timer/10t 10t

execute as @a run function __:timer/10t/all_players

execute as @e[type=armor_stand,tag=__player_lock] run function __:timer/10t/all_player_locks
{
    # in liquid
    #!sb @s __in_liquid = 0
    execute at @s if block ~ ~ ~ water run scoreboard players set @s __in_liquid 1
    execute at @s if block ~ ~ ~ lava run scoreboard players set @s __in_liquid 1

    # disable gravity in liquid
    execute as @s[scores={__in_liquid=0}] run data modify entity @s NoGravity set value 0b
    execute as @s[scores={__in_liquid=1}] run data modify entity @s NoGravity set value 1b

    #!sb @s __age += 1
}
