--// FFH4X - NFXNOBRU1
--// KEY SYSTEM + PAINEL

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--==================================================
--// 50 KEYS
--==================================================

local VALID_KEYS = {
	["FFH4XNTOPEFDN"] = true,
	["FFH4XJMIIVBXP"] = true,
	["FFH4XSSUTLQNM"] = true,
	["FFH4XHKTJDWJK"] = true,
	["FFH4XLDOJJFUE"] = true,
	["FFH4XABPWAUBH"] = true,
	["FFH4XWJNFRPEP"] = true,
	["FFH4XRIOLJXZL"] = true,
	["FFH4XJHPDNRJJ"] = true,
	["FFH4XVBLUBXEF"] = true,
	["FFH4XFIENPGQF"] = true,
	["FFH4XVUJOYOFA"] = true,
	["FFH4XGMDBPYSJ"] = true,
	["FFH4XFYGTCJFY"] = true,
	["FFH4XDJWVZGKJ"] = true,
	["FFH4XEPPVIGRR"] = true,
	["FFH4XHDAZDKCE"] = true,
	["FFH4XMJDVWXME"] = true,
	["FFH4XLBHYASEW"] = true,
	["FFH4XTEBGZWBY"] = true,
	["FFH4XRVAANJVI"] = true,
	["FFH4XYLQBVAJO"] = true,
	["FFH4XFVLSGPEC"] = true,
	["FFH4XSWNSGXJR"] = true,
	["FFH4XCOYMZDQW"] = true,
	["FFH4XYTYQQKVZ"] = true,
	["FFH4XRNEEUJRF"] = true,
	["FFH4XWFTDZZZW"] = true,
	["FFH4XWMHFUDPJ"] = true,
	["FFH4XIQOIBFNP"] = true,
	["FFH4XGAWUKQMZ"] = true,
	["FFH4XUJDZBHLN"] = true,
	["FFH4XRABVJXKN"] = true,
	["FFH4XPIVJQWSN"] = true,
	["FFH4XATFGTYJY"] = true,
	["FFH4XUAXPVOGJ"] = true,
	["FFH4XYNLHAWTM"] = true,
	["FFH4XTKPTQTGG"] = true,
	["FFH4XSTSPBOFF"] = true,
	["FFH4XQDOUBCGS"] = true,
	["FFH4XTSXHIRKN"] = true,
	["FFH4XIFGELWDZ"] = true,
	["FFH4XTNYTOZJU"] = true,
	["FFH4XBVSNFNKQ"] = true,
	["FFH4XRFYPLGYF"] = true,
	["FFH4XTBQTMVRU"] = true,
	["FFH4XKGSHNPMS"] = true,
	["FFH4XKRRVRSXD"] = true,
	["FFH4XWQXJCZJL"] = true,
	["FFH4XDTUKXRVD"] = true,
}

--==================================================
--// KEY SYSTEM
--==================================================

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "FFH4X_KeySystem"
KeyGui.ResetOnSpawn = false
KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeyGui.Parent = LP:WaitForChild("PlayerGui")

local KeyMain = Instance.new("Frame")
KeyMain.Size = UDim2.fromOffset(350, 230)
KeyMain.Position = UDim2.new(0.5, -175, 0.5, -115)
KeyMain.BackgroundColor3 = Color3.fromRGB(15,15,15)
KeyMain.BorderSizePixel = 0
KeyMain.Parent = KeyGui

local KC = Instance.new("UICorner")
KC.CornerRadius = UDim.new(0,16)
KC.Parent = KeyMain

local KS = Instance.new("UIStroke")
KS.Thickness = 3
KS.Parent = KeyMain

local KT = Instance.new("TextLabel")
KT.Size = UDim2.new(1,-30,0,45)
KT.Position = UDim2.fromOffset(15,10)
KT.BackgroundTransparency = 1
KT.Text = "FFH4X - KEY SYSTEM"
KT.TextColor3 = Color3.new(1,1,1)
KT.TextSize = 21
KT.Font = Enum.Font.GothamBold
KT.Parent = KeyMain

local Sub = Instance.new("TextLabel")
Sub.Size = UDim2.new(1,-30,0,25)
Sub.Position = UDim2.fromOffset(15,48)
Sub.BackgroundTransparency = 1
Sub.Text = "Digite uma das keys para continuar"
Sub.TextColor3 = Color3.fromRGB(160,160,160)
Sub.TextSize = 12
Sub.Font = Enum.Font.Gotham
Sub.Parent = KeyMain

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1,-40,0,45)
KeyBox.Position = UDim2.fromOffset(20,82)
KeyBox.BackgroundColor3 = Color3.fromRGB(28,28,28)
KeyBox.BorderSizePixel = 0
KeyBox.PlaceholderText = "KEY..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.new(1,1,1)
KeyBox.PlaceholderColor3 = Color3.fromRGB(120,120,120)
KeyBox.TextSize = 15
KeyBox.Font = Enum.Font.GothamBold
KeyBox.ClearTextOnFocus = false
KeyBox.Parent = KeyMain

local KBC = Instance.new("UICorner")
KBC.CornerRadius = UDim.new(0,10)
KBC.Parent = KeyBox

local Enter = Instance.new("TextButton")
Enter.Size = UDim2.new(1,-40,0,42)
Enter.Position = UDim2.fromOffset(20,137)
Enter.BackgroundColor3 = Color3.fromRGB(35,120,55)
Enter.BorderSizePixel = 0
Enter.Text = "ENTRAR"
Enter.TextColor3 = Color3.new(1,1,1)
Enter.TextSize = 15
Enter.Font = Enum.Font.GothamBold
Enter.Parent = KeyMain

local EC = Instance.new("UICorner")
EC.CornerRadius = UDim.new(0,10)
EC.Parent = Enter

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1,-40,0,25)
Status.Position = UDim2.fromOffset(20,185)
Status.BackgroundTransparency = 1
Status.Text = "Aguardando key..."
Status.TextColor3 = Color3.fromRGB(170,170,170)
Status.TextSize = 12
Status.Font = Enum.Font.Gotham
Status.Parent = KeyMain

local KeyAccepted = false

local function CheckKey()
	local Key = string.upper(KeyBox.Text:gsub("%s+",""))

	if VALID_KEYS[Key] then
		KeyAccepted = true
		Status.Text = "KEY CORRETA!"
		Status.TextColor3 = Color3.fromRGB(80,255,100)

		task.wait(0.3)
		KeyGui:Destroy()

		StartPanel()
	else
		Status.Text = "KEY INVÁLIDA!"
		Status.TextColor3 = Color3.fromRGB(255,70,70)
		KeyBox.Text = ""
	end
end

Enter.MouseButton1Click:Connect(CheckKey)

KeyBox.FocusLost:Connect(function(EnterPressed)
	if EnterPressed then
		CheckKey()
	end
end)

task.spawn(function()
	while KeyGui.Parent and not KeyAccepted do
		KS.Color = Color3.fromHSV((tick()*0.18)%1,1,1)
		task.wait()
	end
end)

--==================================================
--// PAINEL
--==================================================

function StartPanel()

local RageAimbot = false
local NormalAimbot = false

local BoxESP = false
local LineESP = false
local HealthESP = false
local NameESP = false
local DistESP = false
local SkeletonESP = false

local Spin = false
local Noclip = false
local Fly = false
local FOVEnabled = false
local FPSBoost = false

local AimFOV = 200
local SpinSpeed = 99
local FlySpeed = 60
local AimSmooth = 0.18

local CurrentTarget = nil

--==================================================
--// GUI
--==================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "FFH4X_NFXNOBRU1"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = LP:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(360,520)
Main.Position = UDim2.new(.5,-180,.5,-260)
Main.BackgroundColor3 = Color3.fromRGB(15,15,15)
Main.BorderSizePixel = 0
Main.Parent = Gui

local MC = Instance.new("UICorner")
MC.CornerRadius = UDim.new(0,15)
MC.Parent = Main

local MS = Instance.new("UIStroke")
MS.Thickness = 3
MS.Parent = Main

--==================================================
--// HEADER
--==================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1,0,0,55)
Header.BackgroundColor3 = Color3.fromRGB(22,22,22)
Header.BorderSizePixel = 0
Header.Parent = Main

local HC = Instance.new("UICorner")
HC.CornerRadius = UDim.new(0,15)
HC.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,-55,1,0)
Title.Position = UDim2.fromOffset(15,0)
Title.BackgroundTransparency = 1
Title.Text = "FFH4X - NFXNOBRU1"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 19
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(38,38)
Close.Position = UDim2.new(1,-47,0,8)
Close.BackgroundColor3 = Color3.fromRGB(35,35,35)
Close.BorderSizePixel = 0
Close.Text = "×"
Close.TextColor3 = Color3.new(1,1,1)
Close.TextSize = 25
Close.Font = Enum.Font.GothamBold
Close.Parent = Header

local CC = Instance.new("UICorner")
CC.CornerRadius = UDim.new(0,10)
CC.Parent = Close

--==================================================
--// DRAG
--==================================================

local Drag = Instance.new("TextButton")
Drag.Size = UDim2.new(1,-55,1,0)
Drag.BackgroundTransparency = 1
Drag.Text = ""
Drag.Parent = Header

local dragging = false
local dragStart
local startPos

Drag.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		dragStart = input.Position
		startPos = Main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and
	(input.UserInputType == Enum.UserInputType.MouseMovement
	or input.UserInputType == Enum.UserInputType.Touch) then

		local Delta = input.Position-dragStart

		Main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset+Delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset+Delta.Y
		)
	end
end)

--==================================================
--// TABS
--==================================================

local Tabs = Instance.new("Frame")
Tabs.Size = UDim2.new(1,-20,0,40)
Tabs.Position = UDim2.fromOffset(10,62)
Tabs.BackgroundTransparency = 1
Tabs.Parent = Main

local TabLayout = Instance.new("UIListLayout")
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.Padding = UDim.new(0,5)
TabLayout.Parent = Tabs

local Pages = {}

local function CreatePage()
	local Page = Instance.new("ScrollingFrame")
	Page.Size = UDim2.new(1,-20,1,-112)
	Page.Position = UDim2.fromOffset(10,107)
	Page.BackgroundTransparency = 1
	Page.BorderSizePixel = 0
	Page.ScrollBarThickness = 4
	Page.CanvasSize = UDim2.new(0,0,0,0)
	Page.Visible = false
	Page.Parent = Main

	local Layout = Instance.new("UIListLayout")
	Layout.Padding = UDim.new(0,7)
	Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	Layout.Parent = Page

	Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		Page.CanvasSize = UDim2.fromOffset(0,Layout.AbsoluteContentSize.Y+10)
	end)

	table.insert(Pages,Page)

	return Page
end

local CharacterPage = CreatePage()
local CombatPage = CreatePage()
local ESPPage = CreatePage()
local ConfigPage = CreatePage()

local function CreateTab(Text,Page)
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.fromOffset(82,36)
	Button.BackgroundColor3 = Color3.fromRGB(27,27,27)
	Button.BorderSizePixel = 0
	Button.Text = Text
	Button.TextColor3 = Color3.new(1,1,1)
	Button.TextSize = 11
	Button.Font = Enum.Font.GothamBold
	Button.Parent = Tabs

	local C = Instance.new("UICorner")
	C.CornerRadius = UDim.new(0,9)
	C.Parent = Button

	Button.MouseButton1Click:Connect(function()
		for _,P in ipairs(Pages) do
			P.Visible = false
		end

		Page.Visible = true
	end)
end

CreateTab("PERSONAGEM",CharacterPage)
CreateTab("COMBATE",CombatPage)
CreateTab("ESP",ESPPage)
CreateTab("CONFIG",ConfigPage)

CharacterPage.Visible = true

--==================================================
--// TOGGLE
--==================================================

local function CreateToggle(Page,Text,Callback)
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1,-5,0,42)
	Button.BackgroundColor3 = Color3.fromRGB(28,28,28)
	Button.BorderSizePixel = 0
	Button.Text = Text.." [OFF]"
	Button.TextColor3 = Color3.new(1,1,1)
	Button.TextSize = 13
	Button.Font = Enum.Font.GothamBold
	Button.Parent = Page

	local C = Instance.new("UICorner")
	C.CornerRadius = UDim.new(0,9)
	C.Parent = Button

	local Enabled = false

	Button.MouseButton1Click:Connect(function()
		Enabled = not Enabled

		if Enabled then
			Button.Text = Text.." [ON]"
			Button.BackgroundColor3 = Color3.fromRGB(35,120,55)
		else
			Button.Text = Text.." [OFF]"
			Button.BackgroundColor3 = Color3.fromRGB(28,28,28)
		end

		Callback(Enabled)
	end)

	return Button
end

--==================================================
--// SLIDER
--==================================================

local function CreateSlider(Page,Text,Min,Max,Default,Callback)

	local Holder = Instance.new("Frame")
	Holder.Size = UDim2.new(1,-5,0,65)
	Holder.BackgroundColor3 = Color3.fromRGB(25,25,25)
	Holder.BorderSizePixel = 0
	Holder.Parent = Page

	local C = Instance.new("UICorner")
	C.CornerRadius = UDim.new(0,9)
	C.Parent = Holder

	local Label = Instance.new("TextLabel")
	Label.Size = UDim2.new(1,-20,0,25)
	Label.Position = UDim2.fromOffset(10,5)
	Label.BackgroundTransparency = 1
	Label.Text = Text..": "..Default
	Label.TextColor3 = Color3.new(1,1,1)
	Label.TextSize = 13
	Label.Font = Enum.Font.GothamBold
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = Holder

	local Bar = Instance.new("Frame")
	Bar.Size = UDim2.new(1,-20,0,8)
	Bar.Position = UDim2.fromOffset(10,42)
	Bar.BackgroundColor3 = Color3.fromRGB(50,50,50)
	Bar.BorderSizePixel = 0
	Bar.Parent = Holder

	local BC = Instance.new("UICorner")
	BC.CornerRadius = UDim.new(1,0)
	BC.Parent = Bar

	local Fill = Instance.new("Frame")
	Fill.Size = UDim2.new((Default-Min)/(Max-Min),0,1,0)
	Fill.BackgroundColor3 = Color3.fromRGB(80,150,255)
	Fill.BorderSizePixel = 0
	Fill.Parent = Bar

	local FC = Instance.new("UICorner")
	FC.CornerRadius = UDim.new(1,0)
	FC.Parent = Fill

	local SliderButton = Instance.new("TextButton")
	SliderButton.Size = UDim2.new(1,0,1,15)
	SliderButton.Position = UDim2.fromOffset(0,-7)
	SliderButton.BackgroundTransparency = 1
	SliderButton.Text = ""
	SliderButton.Parent = Bar

	local function Update(X)
		local Percent = math.clamp(
			(X-Bar.AbsolutePosition.X)/Bar.AbsoluteSize.X,
			0,1
		)

		local Value = math.floor(Min+(Max-Min)*Percent)

		Fill.Size = UDim2.new(Percent,0,1,0)
		Label.Text = Text..": "..Value

		Callback(Value)
	end

	local Holding = false

	SliderButton.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1
		or Input.UserInputType == Enum.UserInputType.Touch then
			Holding = true
			Update(Input.Position.X)
		end
	end)

	UserInputService.InputChanged:Connect(function(Input)
		if Holding and
		(Input.UserInputType == Enum.UserInputType.MouseMovement
		or Input.UserInputType == Enum.UserInputType.Touch) then
			Update(Input.Position.X)
		end
	end)

	UserInputService.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1
		or Input.UserInputType == Enum.UserInputType.Touch then
			Holding = false
		end
	end)
end

--==================================================
--// PERSONAGEM
--==================================================

CreateToggle(CharacterPage,"🌀 SPIN",function(v)
	Spin = v
end)

CreateSlider(CharacterPage,"Velocidade Spin",1,200,SpinSpeed,function(v)
	SpinSpeed = v
end)

CreateToggle(CharacterPage,"👻 NOCLIP",function(v)
	Noclip = v
end)

CreateToggle(CharacterPage,"🪽 FLY",function(v)
	Fly = v

	local Char = LP.Character
	local Hum = Char and Char:FindFirstChildOfClass("Humanoid")

	if Hum then
		Hum.PlatformStand = v
	end
end)

CreateSlider(CharacterPage,"Velocidade Fly",10,150,FlySpeed,function(v)
	FlySpeed = v
end)

--==================================================
--// COMBATE
--==================================================

CreateToggle(CombatPage,"🔥 AIMBOT RAGE",function(v)
	RageAimbot = v
	if not v then
		CurrentTarget = nil
	end
end)

CreateToggle(CombatPage,"🎯 AIMBOT NORMAL",function(v)
	NormalAimbot = v
	if not v then
		CurrentTarget = nil
	end
end)

CreateSlider(CombatPage,"FOV",50,500,AimFOV,function(v)
	AimFOV = v
end)

CreateToggle(CombatPage,"⭕ FOV CIRCLE",function(v)
	FOVEnabled = v
end)

--==================================================
--// FOV CIRCLE
--==================================================

local FOVCircle = Instance.new("Frame")
FOVCircle.BackgroundTransparency = 1
FOVCircle.Visible = false
FOVCircle.Parent = Gui

local FOVCorner = Instance.new("UICorner")
FOVCorner.CornerRadius = UDim.new(1,0)
FOVCorner.Parent = FOVCircle

local FOVStroke = Instance.new("UIStroke")
FOVStroke.Thickness = 2
FOVStroke.Parent = FOVCircle

--==================================================
--// TARGET
--==================================================

local function GetTarget()

	if CurrentTarget then
		local Char = CurrentTarget.Character
		local Hum = Char and Char:FindFirstChildOfClass("Humanoid")
		local Head = Char and Char:FindFirstChild("Head")

		if Hum and Hum.Health > 0 and Head then
			return CurrentTarget
		end

		CurrentTarget = nil
	end

	local Best = nil
	local BestDistance = AimFOV

	local Center = Vector2.new(
		Camera.ViewportSize.X/2,
		Camera.ViewportSize.Y/2
	)

	for _,Player in ipairs(Players:GetPlayers()) do

		if Player ~= LP then

			local Char = Player.Character
			local Hum = Char and Char:FindFirstChildOfClass("Humanoid")
			local Head = Char and Char:FindFirstChild("Head")

			if Hum and Hum.Health > 0 and Head then

				local Pos,Visible =
					Camera:WorldToViewportPoint(Head.Position)

				if Visible then

					local Distance = (
						Vector2.new(Pos.X,Pos.Y)-Center
					).Magnitude

					if Distance < BestDistance then
						BestDistance = Distance
						Best = Player
					end
				end
			end
		end
	end

	CurrentTarget = Best
	return Best
end

--==================================================
--// ESP
--==================================================

local ESPs = {}

local function CreateESP(Player)

	if Player == LP then
		return
	end

	local Box = Drawing and nil

	local Screen = Instance.new("ScreenGui")
	Screen.Name = "ESP_"..Player.Name
	Screen.ResetOnSpawn = false
	Screen.Parent = Gui

	local BoxFrame = Instance.new("Frame")
	BoxFrame.BackgroundTransparency = 1
	BoxFrame.Visible = false
	BoxFrame.Parent = Screen

	local BS = Instance.new("UIStroke")
	BS.Thickness = 2
	BS.Parent = BoxFrame

	local Name = Instance.new("TextLabel")
	Name.BackgroundTransparency = 1
	Name.TextColor3 = Color3.new(1,1,1)
	Name.TextStrokeTransparency = 0
	Name.TextSize = 13
	Name.Font = Enum.Font.GothamBold
	Name.Visible = false
	Name.Parent = Screen

	local Distance = Instance.new("TextLabel")
	Distance.BackgroundTransparency = 1
	Distance.TextColor3 = Color3.new(1,1,1)
	Distance.TextStrokeTransparency = 0
	Distance.TextSize = 12
	Distance.Font = Enum.Font.GothamBold
	Distance.Visible = false
	Distance.Parent = Screen

	ESPs[Player] = {
		Screen = Screen,
		Box = BoxFrame,
		Stroke = BS,
		Name = Name,
		Distance = Distance
	}
end

local function RemoveESP(Player)
	if ESPs[Player] then
		ESPs[Player].Screen:Destroy()
		ESPs[Player] = nil
	end
end

for _,Player in ipairs(Players:GetPlayers()) do
	CreateESP(Player)
end

Players.PlayerAdded:Connect(CreateESP)
Players.PlayerRemoving:Connect(RemoveESP)

CreateToggle(ESPPage,"📦 ESP BOX",function(v)
	BoxESP = v
end)

CreateToggle(ESPPage,"🏷️ ESP NOME",function(v)
	NameESP = v
end)

CreateToggle(ESPPage,"📍 ESP DISTÂNCIA",function(v)
	DistESP = v
end)

CreateToggle(ESPPage,"📏 ESP LINE",function(v)
	LineESP = v
end)

CreateToggle(ESPPage,"❤️ ESP VIDA",function(v)
	HealthESP = v
end)

CreateToggle(ESPPage,"🦴 ESP SKELETON",function(v)
	SkeletonESP = v
end)

--==================================================
--// CONFIG
--==================================================

CreateToggle(ConfigPage,"🚀 FPS BOOST",function(v)
	FPSBoost = v

	if v then
		for _,Obj in ipairs(workspace:GetDescendants()) do

			if Obj:IsA("ParticleEmitter")
			or Obj:IsA("Trail")
			or Obj:IsA("Smoke")
			or Obj:IsA("Fire")
			or Obj:IsA("Sparkles") then

				Obj.Enabled = false

			elseif Obj:IsA("BasePart") then
				Obj.Material = Enum.Material.SmoothPlastic
			end
		end

		Lighting.GlobalShadows = false
		Lighting.FogEnd = 100000
	end
end)

--==================================================
--// OPEN BUTTON
--==================================================

local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.fromOffset(60,60)
OpenButton.Position = UDim2.new(0,20,.5,-30)
OpenButton.BackgroundColor3 = Color3.fromRGB(18,18,18)
OpenButton.BorderSizePixel = 0
OpenButton.Text = "F"
OpenButton.TextColor3 = Color3.new(1,1,1)
OpenButton.TextSize = 24
OpenButton.Font = Enum.Font.GothamBold
OpenButton.Visible = false
OpenButton.Parent = Gui

local OC = Instance.new("UICorner")
OC.CornerRadius = UDim.new(0,16)
OC.Parent = OpenButton

local OS = Instance.new("UIStroke")
OS.Thickness = 3
OS.Parent = OpenButton

Close.MouseButton1Click:Connect(function()
	Main.Visible = false
	OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
	Main.Visible = true
	OpenButton.Visible = false
end)

--==================================================
--// LOOP
--==================================================

RunService.RenderStepped:Connect(function()

	local Character = LP.Character
	local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
	local Root = Character and Character:FindFirstChild("HumanoidRootPart")

	local RGB = Color3.fromHSV(
		(tick()*0.18)%1,
		1,
		1
	)

	MS.Color = RGB
	OS.Color = RGB
	FOVStroke.Color = RGB

	-- FOV
	local Viewport = Camera.ViewportSize

	FOVCircle.Size =
		UDim2.fromOffset(AimFOV*2,AimFOV*2)

	FOVCircle.Position =
		UDim2.fromOffset(
			Viewport.X/2-AimFOV,
			Viewport.Y/2-AimFOV
		)

	FOVCircle.Visible = FOVEnabled

	-- AIMBOT
	if RageAimbot or NormalAimbot then

		local Target = GetTarget()

		if Target then

			local Char = Target.Character
			local Head = Char and Char:FindFirstChild("Head")

			if Head then

				local Desired =
					CFrame.lookAt(
						Camera.CFrame.Position,
						Head.Position
					)

				if RageAimbot then
					Camera.CFrame = Desired
				else
					Camera.CFrame =
						Camera.CFrame:Lerp(
							Desired,
							AimSmooth
						)
				end
			end
		end
	end

	-- NOCLIP
	if Noclip and Character then
		for _,Part in ipairs(Character:GetDescendants()) do
			if Part:IsA("BasePart") then
				Part.CanCollide = false
			end
		end
	end

	-- SPIN
	if Spin and Root then
		Root.CFrame =
			Root.CFrame *
			CFrame.Angles(
				0,
				math.rad(SpinSpeed),
				0
			)
	end

	-- FLY
	if Fly and Root and Humanoid then

		Humanoid.PlatformStand = true

		local Cam = Camera.CFrame

		local Forward = Vector3.new(
			Cam.LookVector.X,
			0,
			Cam.LookVector.Z
		)

		local Right = Vector3.new(
			Cam.RightVector.X,
			0,
			Cam.RightVector.Z
		)

		if Forward.Magnitude > 0 then
			Forward = Forward.Unit
		end

		if Right.Magnitude > 0 then
			Right = Right.Unit
		end

		local Direction = Vector3.zero

		if UserInputService:IsKeyDown(Enum.KeyCode.W) then
			Direction += Forward
		end

		if UserInputService:IsKeyDown(Enum.KeyCode.S) then
			Direction -= Forward
		end

		if UserInputService:IsKeyDown(Enum.KeyCode.D) then
			Direction += Right
		end

		if UserInputService:IsKeyDown(Enum.KeyCode.A) then
			Direction -= Right
		end

		local Vertical = 0

		if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
			Vertical = 1
		elseif UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
			Vertical = -1
		end

		Root.AssemblyLinearVelocity =
			Direction*FlySpeed +
			Vector3.new(0,Vertical*FlySpeed,0)

	elseif Humanoid and not Fly then
		Humanoid.PlatformStand = false
	end

	-- ESP
	for Player,ESP in pairs(ESPs) do

		local Char = Player.Character
		local Hum = Char and Char:FindFirstChildOfClass("Humanoid")
		local Head = Char and Char:FindFirstChild("Head")
		local PlayerRoot =
			Char and Char:FindFirstChild("HumanoidRootPart")

		if Char and Hum and Hum.Health > 0
		and Head and PlayerRoot then

			local Top,TopVisible =
				Camera:WorldToViewportPoint(
					Head.Position+Vector3.new(0,1,0)
				)

			local Bottom,BottomVisible =
				Camera:WorldToViewportPoint(
					PlayerRoot.Position-Vector3.new(0,3,0)
				)

			local Height =
				math.max(
					math.abs(Bottom.Y-Top.Y),
					20
				)

			local Width =
				math.max(Height*.55,15)

			ESP.Box.Visible =
				BoxESP and (TopVisible or BottomVisible)

			if ESP.Box.Visible then

				ESP.Box.Position =
					UDim2.fromOffset(
						Top.X-Width/2,
						math.min(Top.Y,Bottom.Y)
					)

				ESP.Box.Size =
					UDim2.fromOffset(
						Width,
						Height
					)

				ESP.Stroke.Color = RGB
			end

			ESP.Name.Visible = NameESP

			if NameESP then
				ESP.Name.Text = Player.Name
				ESP.Name.Position =
					UDim2.fromOffset(
						Top.X,
						Top.Y-20
					)
				ESP.Name.Size =
					UDim2.fromOffset(
						Width+40,
						18
					)
				ESP.Name.AnchorPoint =
					Vector2.new(.5,0)
			end

			ESP.Distance.Visible = DistESP

			if DistESP and Root then

				local Dist =
					(PlayerRoot.Position-Root.Position).Magnitude

				ESP.Distance.Text =
					math.floor(Dist).." studs"

				ESP.Distance.Position =
					UDim2.fromOffset(
						Top.X,
						Bottom.Y+3
					)

				ESP.Distance.Size =
					UDim2.fromOffset(
						Width+40,
						18
					)

				ESP.Distance.AnchorPoint =
					Vector2.new(.5,0)
			end

		else

			ESP.Box.Visible = false
			ESP.Name.Visible = false
			ESP.Distance.Visible = false

		end
	end
end)

Main.Visible = true

end
