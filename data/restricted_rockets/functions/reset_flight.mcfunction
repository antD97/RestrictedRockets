# Copyright © 2022 antD97
# Licensed under the MIT License https://antD.mit-license.org/

# attempt to reset flight for executing players

# if enough time has passed since flight was cancelled
execute as @s[scores={__time_since_cancelled=4..}] run function __:reset_flight/time_passed
{
    # reset rockets
    execute as @s[scores={__rockets_used_while_flying=1..}] run function __:reset_flight/time_passed/rockets
    {
        # sound
        execute as @s[nbt={Inventory:[{Slot:102b,id:"minecraft:elytra"}]}] at @s run playsound item.armor.equip_elytra player @s
        # reset rockets
        scoreboard players set @s __rockets_used_while_flying 0
    }

    # if the elytra is repairable
    #!sb global __temp1 = 0
    execute store result score global __temp1 run data get entity @s Inventory[{Slot:102b}].tag.__repairable
    execute if score global __temp1 matches 1 run function __:reset_flight/time_passed/repairable
    {
        # fix elytra
        execute store result storage __:elytra Damage int 1 run data get entity @s Inventory[{Slot:102b}].tag.__prev_damage
        item modify entity @s armor.chest __:save_damage
        item modify entity @s armor.chest __:clear_lore
        item modify entity @s armor.chest __:set_not_repairable
    }
}