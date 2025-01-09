# Copyright © 2022-2023 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# attempt to reset flight for executing players

# if enough time has passed since flight was cancelled
execute as @s[scores={__time_since_cancelled=4..}] run function __:reset_flight/time_passed
{
    #!sb @s __time_flying = 0

    #!sb @s __slow_falling = 0

    # reset rockets
    execute as @s[scores={__rockets_used_while_flying=1..}] run function __:reset_flight/time_passed/rockets
    {
        # sound
        execute as @s[nbt={Inventory:[{Slot:102b,id:"minecraft:elytra"}]}] at @s run playsound item.armor.equip_elytra player @s
        # reset rockets
        #!sb @s __rockets_used_while_flying = 0

        # sets @s __temp3 as client's __rocket_tip
        function __:check_rocket_tip
        # rocket tip
        execute if score @s __temp3 matches 1 run function __:display_rocket_count
    }

    # if the elytra is repairable
    #!sb __ __temp1 = 0
    execute store result score __ __temp1 run data get entity @s Inventory[{Slot:102b}].components.minecraft:custom_data.__repairable
    execute if score __ __temp1 matches 1 run function __:reset_flight/time_passed/repairable
    {
        # fix elytra (0.00231481481 is 1/432. 432 being max elytra durability)
        # execute store result storage __:elytra Damage float 0.00231481481 run data get entity @s Inventory[{Slot:102b}].components.minecraft:custom_data.__prev_damage

        # get and convert durability to value between 0.0 and 1.0
        execute store result score __ __temp1 run data get entity @s Inventory[{Slot:102b}].components.minecraft:custom_data.__prev_damage
        scoreboard players set __ __temp2 432
        scoreboard players operation __ __temp2 -= __ __temp1
        # 0.00231481481 is 1/432. i rounded down to 0.00231347832 because rounding errors were causing the elytra to repair
        execute store result storage __:elytra Damage float 0.00231347832 run scoreboard players get __ __temp2

        # update item
        item modify entity @s armor.chest __:save_damage
        item modify entity @s armor.chest __:clear_lore
        item modify entity @s armor.chest __:set_not_repairable
    }
}
