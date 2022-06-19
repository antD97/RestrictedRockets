# Restricted Rockets

[Planet Minecraft](https://www.planetminecraft.com/data-pack/restricted-rockets-5611086/) |
[Video Demo](https://www.youtube.com/watch?v=W3TiHul3lkM) |
[Downloads](https://github.com/antD97/RestrictedRockets/releases)

Restricted Rockets is a simple datapack that allows you to restrict how many rockets players can use
while flying with an elytra before having to land again. Once a player uses more than the maximum
amount of rockets, their elytra will temporarily break. Once the player either lands or is still in
water, the elytra will return to its previous state. Players can also land or be still in water
before they reach the maximum rockets to reset their flight preemptively. See Operator Commands
below on how to set the max rockets value.

Notes:
- Temporarily broken elytra that up in the player's inventory can be restored by being equipped
- Elytra with customized with lore will have that lore removed when temporarily broken

## Building

This project uses special syntax from
[Shorthand Commands](https://github.com/antD97/ShorthandCommands). To build from this project from
source:

1. Download Shorthand Commands v1.0
2. Copy `header.txt` to the Shorthand Commands directory
3. Set `project` in the `shorthand.conf` file to this project's directory
4. Run `run.bat`

# Operator Commands

`/function restricted_rockets:op/uninstall`  
Removes all scoreboard objectives, scheduled functions, and entities with custom tags. The next time
the datapack is reloaded, the datapack will run like it did the first time.

`/scoreboard players set global restricted_rockets_max_rockets <x>`  
Sets the number of rockets a player can use before landing to \<x>. Default is 0.

---
Copyright © 2022 antD97  
Licensed under the [MIT License](LICENSE)
