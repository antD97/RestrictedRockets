# Copyright © 2022-2023 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# https://minecraft.tools/en/json_text.php

#!sb @s __override_max_rockets += 0
#!sb @s __max_rockets += 0
#!sb @s __override_safe_elytra_break += 0
#!sb @s __safe_elytra_break += 0
#!sb @s __override_rockets_tip += 0
#!sb @s __rockets_tip += 0
#!sb @s __override_zero_rockets_tip_always += 0
#!sb @s __zero_rockets_tip_always += 0

# horizontal line
tellraw @s ""
tellraw @s ["",{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"}]

# header
tellraw @s {"text":" Restricted Rockets Client Config","bold":true}
tellraw @s {"text":" \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 Click value to modify","italic":true}

tellraw @s ""

# server max rockets
tellraw @s ["",{"text":"Server max rockets: "},{"score":{"name":"__","objective":"__max_rockets"}}]
# overrides
execute if score __ __override_max_rockets matches 1 run function __:player_config/override_max_rockets
{
    # client value
    execute as @s[scores={__override_max_rockets=0}] run tellraw @s ["",{"text":"    Client value: "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_max_rockets set 0"}},{"text":"server","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_max_rockets set 0"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_max_rockets set 0"}},{"text":" "},{"text":"[custom]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_max_rockets set 1"}}]
    execute as @s[scores={__override_max_rockets=1}] run tellraw @s ["",{"text":"    Client value: "},{"text":"[server]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_max_rockets set 0"}},{"text":" "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_max_rockets set 1"}},{"text":"custom","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_max_rockets set 1"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_max_rockets set 1"}}]
    # custom value
    tellraw @s ["",{"text":" \u0020 \u0020Custom value: "},{"text":"[","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __max_rockets set <value>"}},{"score":{"name":"@s","objective":"__max_rockets"},"color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __max_rockets set <value>"}},{"text":"]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __max_rockets set <value>"}}]
}
tellraw @s ""

# server slow fall on elytra break
execute if score __ __safe_elytra_break matches 0 run tellraw @s ["",{"text":"Server slow fall on elytra break: "},{"text":"false","bold":true}]
execute if score __ __safe_elytra_break matches 1 run tellraw @s ["",{"text":"Server slow fall on elytra break: "},{"text":"true","bold":true}]
# overrides
execute if score __ __override_safe_elytra_break matches 1 run function __:player_config/override_safe_elytra_break
{
    # client value
    execute as @s[scores={__override_safe_elytra_break=0}] run tellraw @s ["",{"text":"    Client value: "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_safe_elytra_break set 0"}},{"text":"server","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_safe_elytra_break set 0"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_safe_elytra_break set 0"}},{"text":" "},{"text":"[custom]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_safe_elytra_break set 1"}}]
    execute as @s[scores={__override_safe_elytra_break=1}] run tellraw @s ["",{"text":"    Client value: "},{"text":"[server]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_safe_elytra_break set 0"}},{"text":" "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_safe_elytra_break set 1"}},{"text":"custom","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_safe_elytra_break set 1"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_safe_elytra_break set 1"}}]
    # custom value
    execute as @s[scores={__safe_elytra_break=0}] run tellraw @s ["",{"text":"    Custom value: "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __safe_elytra_break set 0"}},{"text":"false","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __safe_elytra_break set 0"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __safe_elytra_break set 0"}},{"text":" "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __safe_elytra_break set 1"}}]
    execute as @s[scores={__safe_elytra_break=1}] run tellraw @s ["",{"text":"    Custom value: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __safe_elytra_break set 0"}},{"text":" "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __safe_elytra_break set 1"}},{"text":"true","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __safe_elytra_break set 1"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __safe_elytra_break set 1"}}]
}

tellraw @s ""

# server rockets tip
execute if score __ __rockets_tip matches 0 run tellraw @s ["",{"text":"Server rockets tip: "},{"text":"false","bold":true}]
execute if score __ __rockets_tip matches 1 run tellraw @s ["",{"text":"Server rockets tip: "},{"text":"true","bold":true}]
# client value
execute as @s[scores={__override_rockets_tip=0}] run tellraw @s ["",{"text":"    Client value: "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_rockets_tip set 0"}},{"text":"server","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_rockets_tip set 0"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_rockets_tip set 0"}},{"text":" "},{"text":"[custom]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_rockets_tip set 1"}}]
execute as @s[scores={__override_rockets_tip=1}] run tellraw @s ["",{"text":"    Client value: "},{"text":"[server]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_rockets_tip set 0"}},{"text":" "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_rockets_tip set 1"}},{"text":"custom","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_rockets_tip set 1"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_rockets_tip set 1"}}]
# custom value
execute as @s[scores={__rockets_tip=0}] run tellraw @s ["",{"text":"    Custom value: "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __rockets_tip set 0"}},{"text":"false","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __rockets_tip set 0"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __rockets_tip set 0"}},{"text":" "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __rockets_tip set 1"}}]
execute as @s[scores={__rockets_tip=1}] run tellraw @s ["",{"text":"    Custom value: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __rockets_tip set 0"}},{"text":" "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __rockets_tip set 1"}},{"text":"true","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __rockets_tip set 1"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __rockets_tip set 1"}}]

tellraw @s ""

# server zero rockets tip persists
execute if score __ __zero_rockets_tip_always matches 0 run tellraw @s ["",{"text":"Server zero rockets tip persists: "},{"text":"false","bold":true}]
execute if score __ __zero_rockets_tip_always matches 1 run tellraw @s ["",{"text":"Server zero rockets tip persists: "},{"text":"true","bold":true}]
# client value
execute as @s[scores={__override_zero_rockets_tip_always=0}] run tellraw @s ["",{"text":"    Client value: "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_zero_rockets_tip_always set 0"}},{"text":"server","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_zero_rockets_tip_always set 0"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_zero_rockets_tip_always set 0"}},{"text":" "},{"text":"[custom]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_zero_rockets_tip_always set 1"}}]
execute as @s[scores={__override_zero_rockets_tip_always=1}] run tellraw @s ["",{"text":"    Client value: "},{"text":"[server]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __override_zero_rockets_tip_always set 0"}},{"text":" "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_zero_rockets_tip_always set 1"}},{"text":"custom","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_zero_rockets_tip_always set 1"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __override_zero_rockets_tip_always set 1"}}]
# custom value
execute as @s[scores={__zero_rockets_tip_always=0}] run tellraw @s ["",{"text":"    Custom value: "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __zero_rockets_tip_always set 0"}},{"text":"false","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __zero_rockets_tip_always set 0"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __zero_rockets_tip_always set 0"}},{"text":" "},{"text":"[true]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __zero_rockets_tip_always set 1"}}]
execute as @s[scores={__zero_rockets_tip_always=1}] run tellraw @s ["",{"text":"    Custom value: "},{"text":"[false]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger __zero_rockets_tip_always set 0"}},{"text":" "},{"text":"[","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __zero_rockets_tip_always set 1"}},{"text":"true","underlined":true,"color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __zero_rockets_tip_always set 1"}},{"text":"]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger __zero_rockets_tip_always set 1"}}]

# horizontal line
tellraw @s ["",{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"},{"text":"\u2500"},{"text":"\u2500","color":"#FF0000"}]
