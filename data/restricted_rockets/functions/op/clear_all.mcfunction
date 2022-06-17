# Copyright © 2022 antD97
# Licensed under the MIT License https://antD.mit-license.org/

scoreboard objectives remove __max_rockets

scoreboard objectives remove __id

scoreboard objectives remove __flying
scoreboard objectives remove __in_liquid

scoreboard objectives remove __x_pos
scoreboard objectives remove __y_pos
scoreboard objectives remove __z_pos

scoreboard objectives remove __rockets_used
scoreboard objectives remove __rockets_used_while_flying

scoreboard objectives remove __clear_levitation

scoreboard objectives remove __summoned_player_lock
scoreboard objectives remove __age

scoreboard objectives remove __temp1
scoreboard objectives remove __temp2
scoreboard objectives remove __temp3

schedule clear __:timer/1t
schedule clear __:timer/10t
schedule clear __:timer/10s

kill @e[type=armor_stand,tag=__player_lock]
