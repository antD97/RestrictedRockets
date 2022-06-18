# Copyright © 2022 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# configurable max rockets
scoreboard objectives add __max_rockets dummy
#!sb global __max_rockets += 0

# player and player lock id
scoreboard objectives add __id dummy
#!sb global __id += 0

scoreboard objectives add __flying dummy
scoreboard objectives add __in_liquid dummy

scoreboard objectives add __x_pos dummy
scoreboard objectives add __y_pos dummy
scoreboard objectives add __z_pos dummy

# rocket counts
scoreboard objectives add __rockets_used minecraft.used:minecraft.firework_rocket
scoreboard objectives add __rockets_used_while_flying dummy

# used to clear levitation quickly
scoreboard objectives add __clear_levitation dummy

# player lock
scoreboard objectives add __summoned_player_lock dummy
scoreboard objectives add __age dummy

# used to kill player locks
scoreboard objectives add __time_alive minecraft.custom:minecraft.time_since_death

# temporary values
scoreboard objectives add __temp1 dummy
scoreboard objectives add __temp2 dummy
scoreboard objectives add __temp3 dummy

schedule function __:timer/1t 1t
schedule function __:timer/10t 10t
schedule function __:timer/10s 10s
