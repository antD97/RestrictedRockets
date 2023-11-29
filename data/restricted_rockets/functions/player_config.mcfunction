# Copyright © 2022-2023 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# https://minecraft.tools/en/json_text.php

# https://minecraft.tools/en/json_text.php

# hide command feedback
execute store result score global __temp1 run gamerule sendCommandFeedback
gamerule sendCommandFeedback false

# horizontal line
tellraw @s ""
tellraw @s ["",{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"}]

# header
tellraw @s {"text":" Restricted Rockets Client Config","bold":true}
tellraw @s {"text":" \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 Click value to modify","italic":true}

tellraw @s ""

# max rockets override
tellraw @s ["",{"text":"Server max rockets: "},{"score":{"name":"global","objective":"__max_rockets"},"bold":true}]
execute if score global __override_max_rockets matches 1 run function __:player_config/max_rockets_override_allowed
{
    #!sb @s __override_max_rockets += 0
    execute if score @s __override_max_rockets matches 0 run tellraw @s ["",{"text":"Override server max rockets: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_max_rockets set 1"}}]
    execute if score @s __override_max_rockets matches 1 run function __:player_config/max_rockets_override_allowed/overridden
    {
        #!sb @s __max_rockets += 0
        tellraw @s ["",{"text":"Override server max rockets: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_max_rockets set 0"}}]
        tellraw @s ["",{"text":" \u0020 \u0020Override value: "},{"text":"[","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __max_rockets set <value>"}},{"score":{"name":"@s","objective":"__max_rockets"},"color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __max_rockets set <value>"}},{"text":"]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __max_rockets set <value>"}}]
    }
}

tellraw @s ""

# safe elytra break override
execute if score global __safe_elytra_break matches 0 run tellraw @s ["",{"text":"Server safe elytra break: "},{"text":"false","bold":true}]
execute if score global __safe_elytra_break matches 1 run tellraw @s ["",{"text":"Server safe elytra break: "},{"text":"true","bold":true}]
execute if score global __override_safe_elytra_break matches 1 run function __:player_config/safe_elytra_break_override_allowed
{
    #!sb @s __override_safe_elytra_break += 0
    execute if score @s __override_safe_elytra_break matches 0 run tellraw @s ["",{"text":"Override server safe elytra break: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_safe_elytra_break set 1"}}]
    execute if score @s __override_safe_elytra_break matches 1 run function __:player_config/safe_elytra_break_override_allowed/overridden
    {
        #!sb @s __safe_elytra_break += 0
        tellraw @s ["",{"text":"Override server safe elytra break: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_safe_elytra_break set 0"}}]
        execute if score @s __safe_elytra_break matches 0 run tellraw @s ["",{"text":" \u0020 \u0020Override value: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __safe_elytra_break set 1"}}]
        execute if score @s __safe_elytra_break matches 1 run tellraw @s ["",{"text":" \u0020 \u0020Override value: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __safe_elytra_break set 0"}}]
    }
}

tellraw @s ""

# rockets tip override
execute if score global __rockets_tip matches 0 run tellraw @s ["",{"text":"Server rockets tip: "},{"text":"false","bold":true}]
execute if score global __rockets_tip matches 1 run tellraw @s ["",{"text":"Server rockets tip: "},{"text":"true","bold":true}]
execute if score @s __override_rockets_tip matches 0 run tellraw @s ["",{"text":"Override server rockets tip: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_rockets_tip set 1"}}]
execute if score @s __override_rockets_tip matches 1 run function __:player_config/rockets_tip_overridden
{
    tellraw @s ["",{"text":"Override server rockets tip: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_rockets_tip set 0"}}]
    execute if score @s __rockets_tip matches 0 run tellraw @s ["",{"text":" \u0020 \u0020Override value: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __rockets_tip set 1"}}]
    execute if score @s __rockets_tip matches 1 run tellraw @s ["",{"text":" \u0020 \u0020Override value: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __rockets_tip set 0"}}]
}

tellraw @s ""

# zero rockets tip always
execute if score global __zero_rockets_tip_always matches 0 run tellraw @s ["",{"text":"Server zero rockets tip persists: "},{"text":"false","bold":true}]
execute if score global __zero_rockets_tip_always matches 1 run tellraw @s ["",{"text":"Server zero rockets tip persists: "},{"text":"true","bold":true}]
#!sb @s __override_zero_rockets_tip_always += 0
execute if score @s __override_zero_rockets_tip_always matches 0 run tellraw @s ["",{"text":"Override server zero rockets tip persists: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_zero_rockets_tip_always set 1"}}]
execute if score @s __override_zero_rockets_tip_always matches 1 run function __:player_config/zero_rockets_tip_always_overridden
{
    tellraw @s ["",{"text":"Override server zero rockets tip persists: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_zero_rockets_tip_always set 0"}}]
    #!sb @s __zero_rockets_tip_always += 0
    execute if score @s __zero_rockets_tip_always matches 0 run tellraw @s ["",{"text":" \u0020 \u0020Override value: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __zero_rockets_tip_always set 1"}}]
    execute if score @s __zero_rockets_tip_always matches 1 run tellraw @s ["",{"text":" \u0020 \u0020Override value: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __zero_rockets_tip_always set 0"}}]
}

# horizontal line
tellraw @s ["",{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"}]

# re-enable command feedback
execute if score global __temp1 matches 1 run schedule function __:re-enable_command_feedback 1t
