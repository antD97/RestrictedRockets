# Copyright © 2022 antD97
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
    execute if score @s __override_max_rockets matches 1 run function __:player_config/max_rockets_override_allowed/player_overridden
    {
        #!sb @s __max_rockets += 0
        tellraw @s ["",{"text":"Override server max rockets: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_max_rockets set 0"}}]
        tellraw @s ["",{"text":" \u0020 \u0020Override: "},{"text":"[","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __max_rockets set <value>"}},{"score":{"name":"@s","objective":"__max_rockets"},"color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __max_rockets set <value>"}},{"text":"]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __max_rockets set <value>"}}]
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
    execute if score @s __override_safe_elytra_break matches 1 run function __:player_config/safe_elytra_break_override_allowed/player_overridden
    {
        #!sb @s __safe_elytra_break += 0
        tellraw @s ["",{"text":"Override server safe elytra break: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_safe_elytra_break set 0"}}]
        execute if score @s __safe_elytra_break matches 0 run tellraw @s ["",{"text":" \u0020 \u0020Override: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __safe_elytra_break set 1"}}]
        execute if score @s __safe_elytra_break matches 1 run tellraw @s ["",{"text":" \u0020 \u0020Override: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __safe_elytra_break set 0"}}]
    }
}
tellraw @s ""

# display mode override
tellraw @s ["",{"text":"Server rocket display: "},{"score":{"name":"global","objective":"__display"},"bold":true}]
tellraw @s {"text":" \u0020 \u00200: off, 1: chat, 2: actionbar"}
#!sb @s __override_display += 0
execute if score @s __override_display matches 0 run tellraw @s ["",{"text":"Override server rocket display: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_display set 1"}}]
execute if score @s __override_display matches 1 run function __:player_config/display_mode_overriden
{
    tellraw @s ["",{"text":"Override server rocket display: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_display set 0"}}]
    #!sb @s __display += 0
    tellraw @s ["",{"text":" \u0020 \u0020Override: "},{"text":"[","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __display set <value>"}},{"score":{"name":"@s","objective":"__display"},"color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __display set <value>"}},{"text":"]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __display set <value>"}}]
}

# horizontal line
tellraw @s ["",{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"}]

# re-enable command feedback
execute if score global __temp1 matches 1 run schedule function __:re-enable_command_feedback 1t
