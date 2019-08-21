import "Turbine"
import "Turbine.Gameplay"
import "Turbine.UI"
import "Turbine.UI.Lotro"

import "FredriksExample.Common.Misc"


combatWarningLabel = Turbine.UI.Label()
combatWarningLabel:SetSize(500, 100)
combatWarningLabel:SetPosition(
	Turbine.UI.Display.GetWidth() / 2) - (combatWarningLabel:GetWidth() / 2, 
	Turbine.UI.Display.GetHeight() / 3) - (combatWarningLabel:GetHeight() / 2)

combatWarningLabel:SetFont(Turbine.UI.Lotro.Font.TrajanPro14)
combatWarningLabel:SetText("<rgb=#ff0000>Warning</rgb> you are in combat!")

player = Turbine.Gameplay.LocalPlayer:GetInstance()
isInCombat = player:IsInCombat()

Misc.AddCallback(player, "InCombatChanged", function()
	isInCombat = player:IsInCombat()
	combatWarningLabel:SetVisible(isInCombat)
end)