# Copyright © 2022-2023 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# display rocket count on actionbar
# need to call calc_rockets before for updated @s __rockets_remaining

# set @s __temp2 as client's __max_rockets
function __:calc_max_rockets

#!sb @s __rockets_remaining = @s __temp2
#!sb @s __rockets_remaining -= @s __rockets_used_while_flying

execute as @s[scores={__rockets_remaining=0}] run title @s actionbar {"text":"Rockets Remaining: 0","color":"#FF0000"}
#!find=$
#!replace=1|2|3|4|5|6|7|8|9|10
execute as @s[scores={__rockets_remaining=$}] run title @s actionbar "Rockets Remaining: $"
execute as @s[scores={__rockets_remaining=11..}] run title @s actionbar "Rockets Remaining: 10+"
