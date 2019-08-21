# Lotro Plugin Examples

This repository contain some example plugins for Lord of the Rings Online (lotro) with the purpose of learning how plugins work.

To try it out, clone or download this repo and follow the instructions below.

The game will recognize the plugin allowing you to load it like other plugins, through the /plugin manager command.

## About LOTRO plugins

Coded in the Lua language, plugins can extend the game with some new custom functionality not included from the start.
Plugins for lotro are more restricted than those for certain other games (wow), where you can automate just about anything.

### What a plugin can do 

* Read information from the game world such as info about the character, items, skills, mounts and crafting
* Draw custom User Interfaces
* Interact with chat like register new /commands, write text
* Subscribe to game events and run code as a reaction
* Save and load data to keep state between sessions of play

### What a plugin cannot do

#### Simulate user interaction

This includes moving the character, attack or interact with objects or npcs, trigger quickslots.
Basically, if something shows up in the Keybinding menu, you cannot trigger it with code.


## Howto install and manage plugin

Plugins are installed by copying it to the game's *Plugins directory*. The *Plugins directory* is part of the game's user files, normally located in *C:\Users\yourusername\Documents\The Lord of the Rings Online\*. First time, you will have to create the *Plugins directory* yourself as *C:\Users\yourusername\Documents\The Lord of the Rings Online\Plugins*.
Once you have that directory, you can copy plugins there. The plugins normally are located in a directory named after the plugin's creator, or the plugin name.

After a plugin is in the right directory the game will pick it up on startup. Alternatively you can type the command */plugins refresh*. The plugin will then show up in the *Manage Plugins* panel in-game by typing */plugins manager*.

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

## My Example Plugins

See README.md in each example sub-directory for individual documentation.


## Further reading

My primary source is [this forum post](https://www.lotro.com/forums/showthread.php?428196-Writing-LoTRO-Lua-Plugins-for-Noobs) by Garan explaining quite verbosely how plugins work and various aspect of the development.

Another useful source is [the latest official API docs](https://www.lotrointerface.com/downloads/info1035-OfficialUpdate24LuaDocumentation.html) (as of april 2019). While not saying anything about "how", it gives an overview of the game resources exposed and what events you can connect to.

### Status of this document and code

This document was written when Lotro is in version Update 23 (november 2018). As the game evolves, the API details could change, making the example code stop working. If so, give me a shout!
