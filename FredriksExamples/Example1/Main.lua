import "Turbine";
import "Turbine.Gameplay";

GreetCommand = Turbine.ShellCommand();

function GreetCommand:Execute(command, arguments)
	local player = Turbine.Gameplay.LocalPlayer.GetInstance();
	Turbine.Shell.WriteLine("Greetings " .. player:GetName() .. "!");
end

Turbine.Shell.AddCommand("GreetSelf", GreetCommand);