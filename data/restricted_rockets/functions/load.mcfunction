# Copyright © 2022 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# configurable max rockets
scoreboard objectives add __max_rockets dummy
#!sb global __max_rockets += 0

# rocket counts
scoreboard objectives add __rockets_used minecraft.used:minecraft.firework_rocket
scoreboard objectives add __rockets_used_while_flying dummy

# time since the player's flight has been cancelled
scoreboard objectives add __time_since_cancelled dummy

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
