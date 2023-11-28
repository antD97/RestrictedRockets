
# Copyright © 2022 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# https://minecraft.tools/en/json_text.php

# hide command feedback
execute store result score global __temp1 run gamerule sendCommandFeedback
gamerule sendCommandFeedback false

# horizontal line
tellraw @s ""
tellraw @s ["",{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"}]

# header
tellraw @s {"text":"Restricted Rockets Server Config","bold":true}
tellraw @s {"text":" \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 Click value to modify","italic":true}

tellraw @s ""

# max rockets
tellraw @s ["",{"text":"Max rockets: "},{"text":"[","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set global __max_rockets <value>"}},{"score":{"name":"global","objective":"__max_rockets"},"color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set global __max_rockets <value>"}},{"text":"]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set global __max_rockets <value>"}}]

# max rockets player override
execute if score global __override_max_rockets matches 0 run \
    tellraw @s ["",{"text":"Allow client override: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set global __override_max_rockets 1"}}]
execute if score global __override_max_rockets matches 1 run \
    tellraw @s ["",{"text":"Allow client override: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set global __override_max_rockets 0"}}]

tellraw @s ""

# safe elytra break
execute if score global __safe_elytra_break matches 0 run \
    tellraw @s ["",{"text":"Safe elytra break: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set global __safe_elytra_break 1"}}]
execute if score global __safe_elytra_break matches 1 run \
    tellraw @s ["",{"text":"Safe elytra break: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set global __safe_elytra_break 0"}}]

# safe elytra break player override
execute if score global __override_safe_elytra_break matches 0 run \
    tellraw @s ["",{"text":"Allow client override: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set global __override_safe_elytra_break 1"}}]
execute if score global __override_safe_elytra_break matches 1 run \
    tellraw @s ["",{"text":"Allow client override: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set global __override_safe_elytra_break 0"}}]

tellraw @s ""

# rockets tip
execute if score global __rockets_tip matches 0 run \
    tellraw @s ["",{"text":"Rockets tip: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set global __rockets_tip 1"}}]
execute if score global __rockets_tip matches 1 run \
    tellraw @s ["",{"text":"Rockets tip: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set global __rockets_tip 0"}}]

# zero rockets tip always
execute if score global __zero_rockets_tip_always matches 0 run \
    tellraw @s ["",{"text":"Zero rockets tip always on: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set global __zero_rockets_tip_always 1"}}]
execute if score global __zero_rockets_tip_always matches 1 run \
    tellraw @s ["",{"text":"Zero rockets tip always on: "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set global __zero_rockets_tip_always 0"}}]

# horizontal line
tellraw @s ["",{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"}]

# re-enable command feedback
execute if score global __temp1 matches 1 run schedule function __:re-enable_command_feedback 1t
#! __:re-enable_command_feedback
{
    gamerule sendCommandFeedback true
}