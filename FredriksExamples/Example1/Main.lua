import "Turbine"; -- for ShellCommand
import "Turbine.Gameplay"; -- for GamePlay.LocalPlayer

-- Create new chat command
GreetCommand = Turbine.ShellCommand(); 

-- Declare code to run when the chat command is issued
function GreetCommand:Execute(command, arguments)
	-- Fetch a reference to the player's character
	local player = Turbine.Gameplay.LocalPlayer.GetInstance();

	-- Write text to chat. Double dots concatenate two strings in lua
	Turbine.Shell.WriteLine("Greetings " .. player:GetName() .. "!");
end

-- Register the chat command and link the command word to the code
Turbine.Shell.AddCommand("GreetSelf", GreetCommand);
