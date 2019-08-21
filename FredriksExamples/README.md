## Example 1 - Add a chat command that writes back

Corresponding to a "Hello world", I created just about the simplest plugin I could think of.

The Example1.plugin manifest simply contains a reference to the code to run once the plugin gets loaded.

The code file creates a chat command, declares a function to run when the command is executed, 
and registers the command, so that it is accessible from the game chat for the player.

## Example 2 - Display a window with character information

When this plugin is loaded, it directly displays a new window in the center of the screen.
This window is then populated by a number of Labels and a ListBox each for displaying different text.

At the top of the file two helper functions are declared: getRaceName and getClassName. Breaking code out into functions is a way of separating tasks, and can help document what different parts of the code does. Each helper has a similar structure, using a for loop to iterate over the tables containing character races and classes to use IDs from the local player to lookup the corresponding names.

Finally equipment names are fetched for each slot. This is a little more complicated as the related information needs to be fetched from the local player (GetEquipment), equipment for a slot (equipment:GetItem), and finally item:GetName. 
As equipment:GetItem() requires a slot ID as an argument, we iterate over Turbine.Gameplay.Equipment to find each equipable slot. 

We have added some type checking (type(equipmentSlotId) == "number" and item ~= nil) since Turbine.Gameplay.Equipment contains values that are not part of the enumeration of equippable slots. Also, when a slot is empty, the item will be equal to nil.

Note: the window is not updated live (eg: lose or gain morale).
Gotcha: when you learn lua, the "local" keyword is used to declare local variables. If you by mistake make the Window UI component local, it will be garbage collected immediately when the plugin completes loading. Therefore it is shown for a brief second, then is hidden.

## Upcoming examples

* Using common helper code
* Advanced chat interaction
* Listening to events
* Writing our own Combat stats plugin
