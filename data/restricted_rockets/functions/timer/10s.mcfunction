# Copyright © 2022 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# 10s (200t) timer
schedule function __:timer/10s 10s

execute as @a run function __:timer/10s/all_players
{
    #!sb @s __id += 0
    execute as @s[scores={__id=0}] run function __:timer/10s/all_players/assign_id
    {
        #!sb global __id += 1
        #!sb @s __id = global __id
    }
}
