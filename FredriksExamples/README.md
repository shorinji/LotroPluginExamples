## Example 1 - Add a chat command that writes back

Corresponding to a "Hello world", I created just about the simplest plugin I could think of.

The Example1.plugin manifest simply contains a reference to the code to run once the plugin gets loaded.

The code file creates a chat command, declares a function to run when the command is executed, 
and registers the command, so that it is accessible from the game chat for the player.

## Example 2 - Display a window with character information

This plugion displays a window in the center of the screen with a custom character screen.

The window is populated by a number of Labels and a ListBox for displaying different text.
At the top of the file two helper functions are declared: getRaceName and getClassName. Breaking code out into functions is a way of separating tasks, and can help document what different parts of the code does. Each helper has a similar structure, using a for loop to iterate over the tables containing character races and classes to use IDs from the local player to lookup the corresponding names.

Finally equipment names are fetched for each slot. This is a little more complicated as the related information needs to be fetched from the local player (GetEquipment), equipment for a slot (equipment:GetItem), and finally item:GetName. 
As equipment:GetItem() requires a slot ID as an argument, we iterate over Turbine.Gameplay.Equipment to find each equipable slot. 

We have added some type checking (type(equipmentSlotId) == "number" and item ~= nil) since Turbine.Gameplay.Equipment contains values that are not part of the enumeration of equippable slots. Also, when a slot is empty, the item will be equal to nil.

* Note: this is a minimal example. The window is never updated (eg: lose or gain morale), and cannot be brought back up once closed without reloading the plugin.
* Gotcha: when you learn lua, the "local" keyword is used to declare local variables. If you by mistake make the Window UI component local, it will be garbage collected immediately when the plugin completes loading. It gets shown for a brief second then is forever gone!

## Example 3 - Code structure and common helper code

### Code separation

As you have seen in example 2, some seemingly trivial tasks can require various loops and if-statements nested. This can start to clutter your code, making it hard to read.
Lua has some mechanisms for handling this, the most simple way being to write functions.
As your code grows, you can separate it into different .lua files. These are referenced using the *import* keyword:

  import "FredriksExamples.Example3.Misc"

The argument is the full path to the lua file from the Plugins root. In the example the file to import is FredriksExamples\Example3\Misc.lua .

Fans of object-oriented programming (OOP) have used Lua's tables and metatables feature to implement class-based OOP. There is even basecode in Lua from Turbine for implementing this.

### Common helper code

The language and standard library provided in Lua for lotro is pretty low-level. This has lead to the creation of code to help perform common tasks needed by many plugins.
If you browse around the source code of existing lotro plugins, you will find directories named "Common" or "Util". Inside these are such helpers often written by someone else than the plugin author. There is no central administration of common code according to Thurallor's answer [here](https://www.lotro.com/forums/showthread.php?674835-Plugin-Blackboard&p=7954027#post7954027).

#### Most common utils include

* Handling event listeners
* OOP Class support
* Extra table functions
* Extending or fixing up turbine code

#### Other common utils

* Format numbers
* Converting numbers
* Converting strings
* Handle dates & times
* Data serialization
* Color calculation
* Chat parsing

### Provided example



## Upcoming examples

* Advanced chat interaction
* Listening to events
* Writing our own Combat stats plugin
