# Restricted Rockets

[Modrinth](https://modrinth.com/datapack/restricted-rockets) |
[Planet Minecraft](https://www.planetminecraft.com/data-pack/restricted-rockets-5611086) |
[CurseForge](https://legacy.curseforge.com/minecraft/texture-packs/restricted-rockets) |
[Video Demo](https://www.youtube.com/watch?v=NgfgBuMwCS0) |
[Downloads](https://github.com/antD97/RestrictedRockets/releases)

Restricted Rockets is a [Minecraft](https://www.minecraft.net) datapack that restricts how many rockets players can use
while flying with an elytra before having to land again. Once a player uses more than the maximum amount of rockets,
their elytra will temporarily break. Once the player either lands or is still in water, the elytra will return to its
previous state. Players can also land or be still in water before they reach the maximum rockets to reset their flight
preemptively.

How this affects gameplay:
- Incentivizes more creative methods of transportation that require infrastructure
- Longer duration rockets become more valuable (if max rockets is set to one or more)

This pack has configurable options that can be set globally for all players or optionally overridden by players. Server
operators have the ability to chose which of these settings can be overridden to either enforce a specific ruleset or to
allow players to match their preferences. See the configuration section below for details.

Notes:
- Temporarily broken elytra that end up in the player's inventory can be restored by being equipped
- Elytra with customized lore will have that lore removed when temporarily broken

## Building

This project uses special syntax from [Shorthand Commands](https://github.com/antD97/ShorthandCommands). To build from
this project from source:

1. Download Shorthand Commands v1.0
2. Copy `header.txt` to the Shorthand Commands directory
3. Set `project` in the `shorthand.conf` file to this project's directory
4. Run `run.bat`

# Configuration

Server-wide rules can be modified by operators using: `/function restricted_rockets:op/config`  
Player-specific rules can be modified by anyone using: `/trigger restricted_rockets_config`

Clicking on values in aqua will suggest a command to modify that value. The change will be made after sending the
command. For the menu to reflect the change, it must be reopened using the config menu command.

Operators can also remove all scoreboard objectives and scheduled functions with
`/function restricted_rockets:op/uninstall`. The next time the datapack is reloaded, the datapack will run like it did
the first time.

## Server-Wide Configuration

- `Max rockets` (default: 2)
  - The number of rockets players are permitted to use before having to land/be still in water.
- `Allow client override` (default: false)
  - Whether players are allowed to configure their own "max rockets" setting. Players are forced to use the server-wide
    "max rockets" value otherwise.

- `Slow fall on elytra break` (default: true)
  - Whether slow falling is activated on players whose elytra was temporarily broken after using more than the max
    number of rockets.  
- `Allow client override` (default: true)
  - Whether players are allowed to configure their own "slow fall on elytra break" setting. Players are forced to use
    the server-wide "slow fall on elytra break" value otherwise.

- `Rockets tip` (default: true)
  - Whether the "remaining rockets" actionbar text is displayed on initial flight, rocket use, and rocket reset.  
- `Zero rockets tip persists` (default: true)
  - Whether the "remaining rockets" actionbar text is *always* displayed when there are no more rockets left to use.

*Note that the rocket tip options can always be overridden through player-specific configuration.*

## Player-Specific Configuration

- Max rockets
  - `Client value` (default: server)
    - Whether to use the server "max rockets" value or the custom one.
    - *This option will only appear if "allow client override" is enabled on the server.*
  - `Custom value` (default: 0)
    - The number of rockets this player is permitted to use before having to land/be still in water.
    - *Only used if "client value" is set to custom.*
- Slow fall on elytra break
  - `Client value` (default: server)
    - Whether slow falling is activated on this player when the elytra is temporarily broken after using more than the
      max number of rockets.
    - *This option will only appear if "allow client override" is enabled on the server.*
- Rockets tip
  - `Client value` (default: server)
    - Whether the "remaining rockets" actionbar text is displayed on initial flight, rocket use, and rocket reset.
- Zero rockets tip persists
  - `Client value` (default: server)
    - Whether the "remaining rockets" actionbar text is *always* displayed when there are no more rockets left to use.

---
Copyright © 2022-2023 antD97  
Licensed under the [MIT License](LICENSE)
