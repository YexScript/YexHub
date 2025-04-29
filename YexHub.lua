local Window = loadstring(local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- Clean up old GUI if exists
pcall(function() CoreGui:FindFirstChild("YexScriptHub"):Destroy() end)

-- Create GUI
local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "YexScriptHub"
Gui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", Gui)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.BorderSizePixel = 0

local TabsPanel = Instance.new("Frame", MainFrame)
TabsPanel.Size = UDim2.new(0, 150, 1, 0)
TabsPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TabsPanel.BorderSizePixel = 0

local ContentPanel = Instance.new("Frame", MainFrame)
ContentPanel.Size = UDim2.new(1, -150, 1, 0)
ContentPanel.Position = UDim2.new(0, 150, 0, 0)
ContentPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ContentPanel.BorderSizePixel = 0

local TabLayout = Instance.new("UIListLayout", TabsPanel)
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 4)

local Tabs = {}
local Window = {}

function Window:CreateTab(tabName)
	local Button = Instance.new("TextButton", TabsPanel)
	Button.Size = UDim2.new(1, -10, 0, 30)
	Button.Position = UDim2.new(0, 5, 0, 0)
	Button.Text = tabName
	Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 14
	Button.BorderSizePixel = 0

	local Page = Instance.new("ScrollingFrame", ContentPanel)
	Page.Name = tabName .. "_Page"
	Page.Size = UDim2.new(1, 0, 1, 0)
	Page.CanvasSize = UDim2.new(0, 0, 2, 0)
	Page.ScrollBarThickness = 4
	Page.BackgroundTransparency = 1
	Page.Visible = false

	local PageLayout = Instance.new("UIListLayout", Page)
	PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	PageLayout.Padding = UDim.new(0, 5)

	Button.MouseButton1Click:Connect(function()
		for _, tab in pairs(ContentPanel:GetChildren()) do
			if tab:IsA("ScrollingFrame") then
				tab.Visible = false
			end
		end
		Page.Visible = true
	end)

	if not next(Tabs) then
		Page.Visible = true
	end

	Tabs[tabName] = Page

	local TabObject = {}
	function TabObject:AddLabel(text)
		local Label = Instance.new("TextLabel", Page)
		Label.Size = UDim2.new(1, -10, 0, 30)
		Label.Text = text
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.Font = Enum.Font.Gotham
		Label.TextSize = 14
		Label.BackgroundTransparency = 1
	end

	return TabObject
end

return Window)()

local MainTab = Window:CreateTab("Main")
local TeleportTab = Window:CreateTab("Teleport")
local ESPTab = Window:CreateTab("ESP")
local MiscTab = Window:CreateTab("Misc")
local StatusTab = Window:CreateTab("Status")
local DevilFruitTab = Window:CreateTab("Devil Fruit")
local VolcanoTab = Window:CreateTab("Volcano")
local V4Tab = Window:CreateTab("V4/Mirrage")

