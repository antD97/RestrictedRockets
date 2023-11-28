# Copyright © 2022 antD97
# Licensed under the MIT License https://antD.mit-license.org/

scoreboard objectives add __config trigger

# configurable max rockets
scoreboard objectives add __max_rockets trigger
#!sb global __max_rockets += 0

# global value: 0=players CANNOT override, 1=players CAN override
# per player value: 0=use GLOBAL value, 1=use PLAYER value
scoreboard objectives add __override_max_rockets trigger
#!sb global __override_max_rockets += 0

# configurable slow falling on elytra break
scoreboard objectives add __safe_elytra_break trigger
#!sb global __safe_elytra_break += 0

# global value: 0=players CANNOT override, 1=players CAN override
# per player value: 0=use GLOBAL value, 1=use PLAYER value
scoreboard objectives add __override_safe_elytra_break trigger
#!sb global __override_safe_elytra_break += 0

# configurable rockets remaining actionbar
scoreboard objectives add __rockets_tip trigger
#!sb global __rockets_tip += 0

# per player value: 0=use GLOBAL value, 1=use PLAYER value
scoreboard objectives add __override_rockets_tip trigger

# configurable zero rockets remaining actionbar always
scoreboard objectives add __zero_rockets_tip_always trigger
#!sb global __zero_rockets_tip_always += 0

# per player value: 0=use GLOBAL value, 1=use PLAYER value
scoreboard objectives add __override_zero_rockets_tip_always trigger

# init defaults
scoreboard objectives add __init dummy
#!sb global __init += 0
execute if score global __init matches 0 run function __:load/defaults
{
    # extra check to update more safely from older versions without __init
    execute if score global __max_rockets matches 0 run scoreboard players set global __max_rockets 3
    #!sb global __override_max_rockets = 0
    #!sb global __safe_elytra_break = 1
    #!sb global __override_safe_elytra_break = 1
    #!sb global __rockets_tip = 1
    #!sb global __zero_rockets_tip_always = 1
}
#!sb global __init = 1

# rocket counts
scoreboard objectives add __rockets_used minecraft.used:minecraft.firework_rocket
scoreboard objectives add __rockets_used_while_flying dummy
scoreboard objectives add __rockets_remaining dummy

# time since the player's flight has been cancelled
scoreboard objectives add __time_since_cancelled dummy

# can be 0 (not flying), 1 (just started flying), or 2 (has been flying)
scoreboard objectives add __time_flying dummy

scoreboard objectives add __in_liquid dummy

scoreboard objectives add __x_pos dummy
scoreboard objectives add __y_pos dummy
scoreboard objectives add __z_pos dummy

# temporary values
scoreboard objectives add __temp1 dummy
scoreboard objectives add __temp2 dummy
scoreboard objectives add __temp3 dummy

schedule function __:timer/1t 1t
schedule function __:timer/10t 10t
