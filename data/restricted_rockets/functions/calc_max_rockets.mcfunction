# Copyright © 2022-2023 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# set @s __temp2 as client's __max_rockets

# client cannot override, use global value
execute if score global __override_max_rockets matches 0 run \
    scoreboard players operation @s __temp2 = global __max_rockets

# client overridable
execute if score global __override_max_rockets matches 1 run function __:calc_max_rockets/overridable
{
    # not overriden, use global value
    execute if score @s __override_max_rockets matches 0 run \
        scoreboard players operation @s __temp2 = global __max_rockets

    # overriden, use client value
    execute if score @s __override_max_rockets matches 1 run \
        scoreboard players operation @s __temp2 = @s __max_rockets
}
