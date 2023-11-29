# Copyright © 2022-2023 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# set @s __temp3 as client's __rockets_tip

#!sb @s __rockets_tip += 0
#!sb @s __override_rockets_tip += 0

# false unless either of the following two conditions
#!sb @s __temp3 = 0

# not overridden & server is set to true
execute as @s[scores={__override_rockets_tip=0}] run \
    execute if score global __rockets_tip matches 1 run \
    scoreboard players set @s __temp3 1

# overridden & client is set to true
execute as @s[scores={__override_rockets_tip=1,__rockets_tip=1}] run \
    scoreboard players set @s __temp3 1
