import "Turbine"
import "Turbine.Gameplay"
import "Turbine.UI"
import "Turbine.UI.Lotro"

function getRaceName(myRaceId)
	for raceName, raceId in pairs(Turbine.Gameplay.Race) do
		if myRaceId == raceId then
			return raceName
		end
	end
	return "Unknown"
end

function getClassName(myClassId)
	for className, classId in pairs(Turbine.Gameplay.Class) do
		if myClassId == classId then
			return className
		end
	end
	return "Unknown"
end


characterWindow = Turbine.UI.Lotro.Window()
characterWindow:SetSize(500, 550)
characterWindow:SetPosition(
	(Turbine.UI.Display.GetWidth() / 2) - (characterWindow:GetWidth() / 2),
	(Turbine.UI.Display.GetHeight() / 3) - (characterWindow:GetHeight() / 2)
)

player = Turbine.Gameplay.LocalPlayer.GetInstance()

nameLabel = Turbine.UI.Label()
nameLabel:SetParent(characterWindow)
nameLabel:SetPosition(30, 50)
nameLabel:SetFont(Turbine.UI.Lotro.Font.TrajanPro14)
nameLabel:SetText(player:GetName())

descriptionLabel = Turbine.UI.Label()
descriptionLabel:SetParent(characterWindow)
descriptionLabel:SetSize(400, 50)
descriptionLabel:SetPosition(40, 80)
descriptionLabel:SetMultiline(true)

description = "Level: " .. player:GetLevel() .. "\n"
   .. "Race: " .. getRaceName(player:GetRace()) .. "\n"
   .. "Class: " .. getClassName(player:GetClass()) .. "\n"
   .. "Morale: " .. math.round(player:GetMorale()) .. " / " .. math.round(player:GetMaxMorale()) .. "\n"

descriptionLabel:SetText(description)

equipmentLabel = Turbine.UI.Label()
equipmentLabel:SetParent(characterWindow)
equipmentLabel:SetPosition(30, 140)
equipmentLabel:SetSize(200, 20)
equipmentLabel:SetFont(Turbine.UI.Lotro.Font.TrajanPro14)
equipmentLabel:SetText("Equipment")


equipmentList = Turbine.UI.ListBox()
equipmentList:SetParent(characterWindow)
equipmentList:SetPosition(40, 160)   
equipmentList:SetSize(400, 350)
   

equipment = player:GetEquipment()
for equipmentSlotName, equipmentSlotId in pairs(Turbine.Gameplay.Equipment) do
	if type(equipmentSlotId) == "number" then
		item = equipment:GetItem(equipmentSlotId)
		if item ~= nil then
			equipmentSlotLabel = Turbine.UI.Label()
			equipmentSlotLabel:SetPosition(0, 0)
			equipmentSlotLabel:SetSize(150, 15)
			equipmentSlotLabel:SetText(equipmentSlotName)
			
			slottedItemLabel = Turbine.UI.Label()
			slottedItemLabel:SetPosition(150, 0)
			slottedItemLabel:SetSize(400, 15)
		 	slottedItemLabel:SetText(item:GetName())

			listItem = Turbine.UI.Control()
			listItem:SetSize(550, 15)

			equipmentSlotLabel:SetParent(listItem)
			slottedItemLabel:SetParent(listItem)

			equipmentList:AddItem(listItem)
		end
	end
end
	


characterWindow:SetText("Custom character panel")
characterWindow:SetVisible(true)

