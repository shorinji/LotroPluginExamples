# Example 1 - Add a chat command that writes back

Corresponding to a "Hello world", I created the simplest plugin I could think of.

The Example1.plugin manifest simply contains a reference to the code to run once the plugin gets loaded.

The code file creates a chat command, declares a function to run on command execution, 
and registers the command, so that it is accessible from the game chat for the player.
