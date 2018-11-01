# Lotro Plugin Examples

This repository contains example plugins for Lord of the Rings Online (lotro) with the purpose of learning how plugins work

There is currently one example, aptly named *Fredrik's Example 1*.

To try it out, clone or download this repo and place the *FredriksExamples* directory in the game's plugin directory.

The game will recognize the plugin allowing you to load it like other plugins

## About LOTRO plugins

Coded in the Lua language, plugins can extend the game with some new custom functionality not included from the start.
Plugins for lotro are more restricted than plugins in certain other games (wow), where you can automate just about anything.

### What a plugin can do 

* Draw custom User Interfaces
* Interact with chat: register new commands, write text
* Subscribe to game events and run code as a reaction
* Save and load data to keep state between sessions of play

### What a plugin cannot do

#### Simulate user interaction

This includes moving the character, attack or interact with objects or npcs, trigger quickslots.
Basically if something shows up in the Keybinding menu, you cannot trigger it with code.


## Howto install and manage plugin

Plugins are installed by copying it to the game's *Plugin directory*. The *Plugins directory* is part of the game's user files, normally located in *C:\Users\yourusername\Documents\The Lord of the Rings Online*. First time, you will have to create the *Plugins directory* yourself as *C:\Users\yourusername\Documents\The Lord of the Rings Online\Plugins*.
Once you have that directory, you can copy plugins there. The plugins normally are located in a directory named after the plugin's creator, or the plugin name.

After a plugin is in the directory, the game will pick it up on startup and show it in the *Manage Plugins* menu on the character selection screen. (Or in-game by typing */plugins manager* in chat).

You can even add or modify plugins *without restarting* the game by typing */plugins refresh* in the chat, then unload and reload the plugin.


## Anatomy of a plugin

At a minimum, a lotro plugin needs to consists of just two files.

### A .plugin manifest file

An XML file containing name, description, version etc. 
Also, most importantly, it contains a reference to the code entrypoint. This is the code file that the game runs when the plugin is loaded.
It is written in the following format.

	<Package>FredriksExamples.Example1.Main</Package>

This corresponds to the directory *FredriksExamples\Example1* and a file named *Main.lua* in that directory.


### A .lua code file

In the minimal example, this is the file referenced from the .plugin file above, and is run when the plugin is loaded.
In this file you can create UI elements, start loading preferences, register chat commands and run any code that should happen immediately.
For more advanced code, you will need to register event listeners, to pick up on game events as they occur. More on this later...
