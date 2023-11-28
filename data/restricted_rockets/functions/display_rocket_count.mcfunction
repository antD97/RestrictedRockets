# Copyright © 2022 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# display rocket count on actionbar

# needs updated __rockets_remaining count:
# #!sb @s __rockets_remaining = global __max_rockets
# #!sb @s __rockets_remaining -= @s __rockets_used_while_flying

#!sb @s __max_rockets = global __max_rockets

execute as @s[scores={__max_rockets=1..,__rockets_remaining=0}] run title @s actionbar {"text":"Rockets Remaining: 0","color":"#FF0000"}
#!find=$
#!replace=1|2|3|4|5|6|7|8|9|10
execute as @s[scores={__max_rockets=1..,__rockets_remaining=$}] run title @s actionbar "Rockets Remaining: $"
execute as @s[scores={__max_rockets=1..,__rockets_remaining=11..}] run title @s actionbar "Rockets Remaining: 10+"
