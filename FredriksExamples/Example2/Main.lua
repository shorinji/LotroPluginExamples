import "Turbine"
import "Turbine.Gameplay"
import "Turbine.UI"
import "Turbine.UI.Lotro"


myWindow = Turbine.UI.Lotro.Window()
myWindow:SetSize(500, 100)
myWindow:SetPosition(
	( Turbine.UI.Display.GetWidth() / 2 ) - ( myWindow:GetWidth() / 2 ),
	( Turbine.UI.Display.GetHeight() / 3 ) - ( myWindow:GetHeight() / 2 )
)

myWindow:SetVisible(true)
myWindow:SetText("Jolly good show")