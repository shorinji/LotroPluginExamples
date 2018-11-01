# Lotro Plugin Examples

This repository contains example plugins for Lord of the Rings Online (lotro) with the purpose of learning how plugins work

There is currently one example, aptly named *Fredrik's Example 1*.

To try it out, clone or download this repo and place the *FredriksExamples* directory in the game's plugin directory.

The game will recognize the plugin allowing you to load it like other plugins

## About LOTRO plugins

Coded in the Lua language, plugins can extend the game with some new custom functionality not included from the start.


## Howto install and manage plugin

Plugins are installed by copying it to the game's *Plugin directory*. The *Plugins directory* is part of the game's user files, normally located in *C:\Users\yourusername\Documents\The Lord of the Rings Online*. First time, you will have to create the *Plugins directory* yourself as *C:\Users\yourusername\Documents\The Lord of the Rings Online\Plugins*.
Once you have that directory, you can copy plugins there. The plugins normally are located in a directory named after the plugin's creator, or the plugin name.

After a plugin is in that directory, the game will pick it up on startup and show it in the *Manage Plugins* menu on the character selection screen. (Or in-game by typing */plugins manager* in chat).
You can even add or modify plugins *without restarting* the game by typing */plugins refresh* in the chat, then unload and reload the plugin.
