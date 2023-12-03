
# Copyright © 2022-2023 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# https://minecraft.tools/en/json_text.php

# hide command feedback
execute store result score __ __temp1 run gamerule sendCommandFeedback
gamerule sendCommandFeedback false

# horizontal line
tellraw @s ""
tellraw @s ["",{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"}]

# header
tellraw @s {"text":"Restricted Rockets Server Config","bold":true}
tellraw @s {"text":" \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 Click value to modify","italic":true}

tellraw @s ""

# max rockets
tellraw @s ["",{"text":"Max rockets: "},{"text":"[","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __max_rockets <value>"}},{"score":{"name":"__","objective":"__max_rockets"},"color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __max_rockets <value>"}},{"text":"]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __max_rockets <value>"}}]
# allow client override
execute if score __ __override_max_rockets matches 0 run tellraw @s ["",{"text":"Allow client override: "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_max_rockets 0"}},{"text":"false","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_max_rockets 0"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_max_rockets 0"}},{"text":" "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_max_rockets 1"}}]
execute if score __ __override_max_rockets matches 1 run tellraw @s ["",{"text":"Allow client override: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_max_rockets 0"}},{"text":" "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_max_rockets 1"}},{"text":"true","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_max_rockets 1"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_max_rockets 1"}}]

tellraw @s ""

# slow fall on elytra break
execute if score __ __safe_elytra_break matches 0 run tellraw @s ["",{"text":"Slow fall on elytra break: "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __safe_elytra_break 0"}},{"text":"false","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __safe_elytra_break 0"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __safe_elytra_break 0"}},{"text":" "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __safe_elytra_break 1"}}]
execute if score __ __safe_elytra_break matches 1 run tellraw @s ["",{"text":"Slow fall on elytra break: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __safe_elytra_break 0"}},{"text":" "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __safe_elytra_break 1"}},{"text":"true","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __safe_elytra_break 1"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __safe_elytra_break 1"}}]
# allow client override
execute if score __ __override_safe_elytra_break matches 0 run tellraw @s ["",{"text":"Allow client override: "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_safe_elytra_break 0"}},{"text":"false","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_safe_elytra_break 0"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_safe_elytra_break 0"}},{"text":" "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_safe_elytra_break 1"}}]
execute if score __ __override_safe_elytra_break matches 1 run tellraw @s ["",{"text":"Allow client override: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_safe_elytra_break 0"}},{"text":" "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_safe_elytra_break 1"}},{"text":"true","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_safe_elytra_break 1"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __override_safe_elytra_break 1"}}]

tellraw @s ""

# rockets tip
execute if score __ __rockets_tip matches 0 run tellraw @s ["",{"text":"Rockets tip: "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __rockets_tip 0"}},{"text":"false","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __rockets_tip 0"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __rockets_tip 0"}},{"text":" "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __rockets_tip 1"}}]
execute if score __ __rockets_tip matches 1 run tellraw @s ["",{"text":"Rockets tip: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __rockets_tip 0"}},{"text":" "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __rockets_tip 1"}},{"text":"true","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __rockets_tip 1"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __rockets_tip 1"}}]
# zero rockets tip always
execute if score __ __zero_rockets_tip_always matches 0 run tellraw @s ["",{"text":"Zero rockets tip persists: "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __zero_rockets_tip_always 0"}},{"text":"false","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __zero_rockets_tip_always 0"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __zero_rockets_tip_always 0"}},{"text":" "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __zero_rockets_tip_always 1"}}]
execute if score __ __zero_rockets_tip_always matches 1 run tellraw @s ["",{"text":"Zero rockets tip persists: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __zero_rockets_tip_always 0"}},{"text":" "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __zero_rockets_tip_always 1"}},{"text":"true","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __zero_rockets_tip_always 1"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set __ __zero_rockets_tip_always 1"}}]

# horizontal line
tellraw @s ["",{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"}]

# re-enable command feedback
execute if score __ __temp1 matches 1 run schedule function __:re-enable_command_feedback 1t
#! __:re-enable_command_feedback
{
    gamerule sendCommandFeedback true
}
