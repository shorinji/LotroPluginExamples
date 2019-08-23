import "Turbine"
import "Turbine.Gameplay"
import "Turbine.UI"
import "Turbine.UI.Lotro"

import "FredriksExamples.Example3.Common.Misc"


combatWarningLabel = Turbine.UI.Label()
combatWarningLabel:SetSize(500, 100)
combatWarningLabel:SetPosition(
	(Turbine.UI.Display.GetWidth() / 2) - (combatWarningLabel:GetWidth() / 2),
	(Turbine.UI.Display.GetHeight() / 3) - (combatWarningLabel:GetHeight() / 2)
)

combatWarningLabel:SetFont(Turbine.UI.Lotro.Font.TrajanPro28)
combatWarningLabel:SetText("<rgb=#ff0000>Warning:</rgb> Entering combat!")

player = Turbine.Gameplay.LocalPlayer:GetInstance()

combatWarningLabel:SetVisible(player:IsInCombat())


Misc.AddCallback(player, "InCombatChanged", function()
	combatWarningLabel:SetVisible(player:IsInCombat())
end)