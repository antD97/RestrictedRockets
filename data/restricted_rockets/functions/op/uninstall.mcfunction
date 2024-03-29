# Copyright © 2022-2023 antD97
# Licensed under the MIT License https://antD.mit-license.org/

scoreboard objectives remove __config

scoreboard objectives remove __max_rockets
scoreboard objectives remove __override_max_rockets

scoreboard objectives remove __safe_elytra_break
scoreboard objectives remove __override_safe_elytra_break

scoreboard objectives remove __rockets_tip
scoreboard objectives remove __zero_rockets_tip_always

scoreboard objectives remove __init

scoreboard objectives remove __rockets_used
scoreboard objectives remove __rockets_used_while_flying
scoreboard objectives remove __rockets_remaining

scoreboard objectives remove __time_since_cancelled

scoreboard objectives remove __time_flying

scoreboard objectives remove __in_liquid

scoreboard objectives remove __slow_falling

scoreboard objectives remove __x_pos
scoreboard objectives remove __y_pos
scoreboard objectives remove __z_pos

scoreboard objectives remove __temp1
scoreboard objectives remove __temp2
scoreboard objectives remove __temp3

schedule clear __:timer/1t
schedule clear __:timer/10t
