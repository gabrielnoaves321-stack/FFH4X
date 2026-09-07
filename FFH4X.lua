--// FFH4X - NFXNOBRU1
--// PAINEL + KEY SYSTEM
--// 50 KEYS SOMENTE COM LETRAS

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--==================================================
-- KEYS
--==================================================

local ValidKeys = {
	["FFH4X-KRAVM"] = true,
	["FFH4X-PLQWT"] = true,
	["FFH4X-ZMXRA"] = true,
	["FFH4X-NVKLP"] = true,
	["FFH4X-QWERT"] = true,
	["FFH4X-HJXPK"] = true,
	["FFH4X-BLMQA"] = true,
	["FFH4X-TZKRV"] = true,
	["FFH4X-WPMNX"] = true,
	["FFH4X-GRQVL"] = true,

	["FFH4X-XKQPA"] = true,
	["FFH4X-MZLWR"] = true,
	["FFH4X-VBNQK"] = true,
	["FFH4X-RXTPM"] = true,
	["FFH4X-KJHQA"] = true,
	["FFH4X-PXWLM"] = true,
	["FFH4X-QAZTR"] = true,
	["FFH4X-NMCKP"] = true,
	["FFH4X-YTRVX"] = true,
	["FFH4X-LPQAZ"] = true,

	["FFH4X-ZQWNM"] = true,
	["FFH4X-KXPLR"] = true,
	["FFH4X-MQWAZ"] = true,
	["FFH4X-RVKTP"] = true,
	["FFH4X-HPLMX"] = true,
	["FFH4X-TQZKA"] = true,
	["FFH4X-WXNRP"] = true,
	["FFH4X-GKQMV"] = true,
	["FFH4X-BXRLT"] = true,
	["FFH4X-VQPKN"] = true,

	["FFH4X-MLQTR"] = true,
	["FFH4X-XZKPA"] = true,
	["FFH4X-QMRVX"] = true,
	["FFH4X-NPLWK"] = true,
	["FFH4X-KQZMT"] = true,
	["FFH4X-RPXVA"] = true,
	["FFH4X-TKQWL"] = true,
	["FFH4X-ZNRMP"] = true,
	["FFH4X-WQKTX"] = true,
	["FFH4X-HZPLQ"] = true,

	["FFH4X-BQXMR"] = true,
	["FFH4X-VKZTP"] = true,
	["FFH4X-MXQRL"] = true,
	["FFH4X-PZKVA"] = true,
	["FFH4X-QXWRT"] = true,
	["FFH4X-NKMLP"] = true,
	["FFH4X-RQZVX"] = true,
	["FFH4X-TPLKM"] = true,
	["FFH4X-WZQRP"] = true,
	["FFH4X-KMXTA"] = true
}

--==================================================
-- KEY GUI
--==================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "FFH4X_NFXNOBRU1"
Gui.ResetOnSpawn = false
Gui.Parent = LP:WaitForChild("PlayerGui")

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.fromOffset(330, 220)
KeyFrame.Position = UDim2.new(0.5, -165, 0.5, -110)
KeyFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
KeyFrame.Parent = Gui

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 14)
KeyCorner.Parent = KeyFrame

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Thickness = 3
KeyStroke.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, -30, 0, 45)
KeyTitle.Position = UDim2.fromOffset(15, 10)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "FFH4X - KEY SYSTEM"
KeyTitle.TextColor3 = Color3.new(1, 1, 1)
KeyTitle.TextSize = 20
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Parent = KeyFrame

local KeyInfo = Instance.new("TextLabel")
KeyInfo.Size = UDim2.new(1, -30, 0, 25)
KeyInfo.Position = UDim2.fromOffset(15, 52)
KeyInfo.BackgroundTransparency = 1
KeyInfo.Text = "Digite sua key para continuar"
KeyInfo.TextColor3 = Color3.fromRGB(170, 170, 170)
KeyInfo.TextSize = 13
KeyInfo.Font = Enum.Font.Gotham
KeyInfo.Parent = KeyFrame

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1, -30, 0, 42)
KeyBox.Position = UDim2.fromOffset(15, 85)
KeyBox.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
KeyBox.PlaceholderText = "FFH4X-XXXXX"
KeyBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.new(1, 1, 1)
KeyBox.TextSize = 15
KeyBox.Font = Enum.Font.GothamBold
KeyBox.ClearTextOnFocus = false
KeyBox.Parent = KeyFrame

local KeyBoxCorner = Instance.new("UICorner")
KeyBoxCorner.CornerRadius = UDim.new(0, 9)
KeyBoxCorner.Parent = KeyBox

local EnterButton = Instance.new("TextButton")
EnterButton.Size = UDim2.new(1, -30, 0, 42)
EnterButton.Position = UDim2.fromOffset(15, 137)
EnterButton.BackgroundColor3 = Color3.fromRGB(35, 120, 55)
EnterButton.Text = "ENTRAR"
EnterButton.TextColor3 = Color3.new(1, 1, 1)
EnterButton.TextSize = 15
EnterButton.Font = Enum.Font.GothamBold
EnterButton.Parent = KeyFrame

local EnterCorner = Instance.new("UICorner")
EnterCorner.CornerRadius = UDim.new(0, 9)
EnterCorner.Parent = EnterButton

local KeyStatus = Instance.new("TextLabel")
KeyStatus.Size = UDim2.new(1, -30, 0, 25)
KeyStatus.Position = UDim2.fromOffset(15, 183)
KeyStatus.BackgroundTransparency = 1
KeyStatus.Text = ""
KeyStatus.TextColor3 = Color3.fromRGB(255, 80, 80)
KeyStatus.TextSize = 12
KeyStatus.Font = Enum.Font.GothamBold
KeyStatus.Parent = KeyFrame

--==================================================
-- CONFIG
--==================================================

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

local AimFOV = 200
local SpinSpeed = 99
local AimSmooth = 0.18

local CurrentTarget = nil

--==================================================
-- MAIN GUI
--==================================================

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(300, 460)
Main.Position = UDim2.new(0.5, -150, 0.5, -230)
Main.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
Main.Visible = false
Main.Parent = Gui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 3
MainStroke.Parent = Main

--==================================================
-- HEADER
--==================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 60)
Header.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Header.Parent = Main

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 14)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.fromOffset(15, 0)
Title.BackgroundTransparency = 1
Title.Text = "FFH4X - NFXNOBRU1"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 19
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

--==================================================
-- CLOSE
--==================================================

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(42, 42)
Close.Position = UDim2.new(1, -50, 0, 9)
Close.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Close.Text = "×"
Close.TextColor3 = Color3.new(1, 1, 1)
Close.TextSize = 28
Close.Font = Enum.Font.GothamBold
Close.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 10)
CloseCorner.Parent = Close

--==================================================
-- DRAG
--==================================================

local DragHandle = Instance.new("TextButton")
DragHandle.Size = UDim2.new(1, -55, 1, 0)
DragHandle.BackgroundTransparency = 1
DragHandle.Text = ""
DragHandle.AutoButtonColor = false
DragHandle.Parent = Header

local dragging = false
local dragStart
local startPos

DragHandle.InputBegan:Connect(function(input)
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
	if not dragging then
		return
	end

	if input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch then

		local delta = input.Position - dragStart

		Main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

--==================================================
-- SCROLL
--==================================================

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -20, 1, -75)
Scroll.Position = UDim2.fromOffset(10, 68)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 4
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 7)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.Parent = Scroll

local function UpdateCanvas()
	Scroll.CanvasSize = UDim2.fromOffset(
		0,
		Layout.AbsoluteContentSize.Y + 10
	)
end

Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateCanvas)

--==================================================
-- TOGGLE
--==================================================

local function CreateToggle(text, callback)
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1, -5, 0, 42)
	Button.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
	Button.Text = text .. "  [OFF]"
	Button.TextColor3 = Color3.new(1, 1, 1)
	Button.TextSize = 14
	Button.Font = Enum.Font.GothamBold
	Button.Parent = Scroll

	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 9)
	Corner.Parent = Button

	local enabled = false

	Button.MouseButton1Click:Connect(function()
		enabled = not enabled

		if enabled then
			Button.Text = text .. "  [ON]"
			Button.BackgroundColor3 = Color3.fromRGB(35, 120, 55)
		else
			Button.Text = text .. "  [OFF]"
			Button.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
		end

		callback(enabled)
	end)

	return Button
end

--==================================================
-- OPTIONS
--==================================================

CreateToggle("🔥 AIMBOT RAGE", function(v)
	RageAimbot = v

	if not v then
		CurrentTarget = nil
	end
end)

CreateToggle("🎯 AIMBOT NORMAL", function(v)
	NormalAimbot = v

	if not v then
		CurrentTarget = nil
	end
end)

CreateToggle("📦 ESP BOX", function(v)
	BoxESP = v
end)

CreateToggle("📏 ESP LINE", function(v)
	LineESP = v
end)

CreateToggle("❤️ ESP VIDA", function(v)
	HealthESP = v
end)

CreateToggle("🏷️ ESP NOME", function(v)
	NameESP = v
end)

CreateToggle("📍 ESP DIST", function(v)
	DistESP = v
end)

CreateToggle("🦴 ESP SKELETON", function(v)
	SkeletonESP = v
end)

CreateToggle("🌀 SPIN 99", function(v)
	Spin = v
end)

CreateToggle("👻 NOCLIP", function(v)
	Noclip = v
end)

CreateToggle("🪽 FLY", function(v)
	Fly = v

	local Char = LP.Character
	local Hum = Char and Char:FindFirstChildOfClass("Humanoid")

	if Hum then
		Hum.PlatformStand = v
	end
end)

--==================================================
-- FOV BUTTON
--==================================================

local FOVButton = Instance.new("TextButton")
FOVButton.Size = UDim2.new(1, -5, 0, 42)
FOVButton.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
FOVButton.Text = "🎯 FOV: " .. AimFOV
FOVButton.TextColor3 = Color3.new(1, 1, 1)
FOVButton.TextSize = 14
FOVButton.Font = Enum.Font.GothamBold
FOVButton.Parent = Scroll

local FOVCorner = Instance.new("UICorner")
FOVCorner.CornerRadius = UDim.new(0, 9)
FOVCorner.Parent = FOVButton

FOVButton.MouseButton1Click:Connect(function()
	AimFOV += 25

	if AimFOV > 500 then
		AimFOV = 50
	end

	FOVButton.Text = "🎯 FOV: " .. AimFOV
end)

CreateToggle("⭕ FOV CIRCLE", function(v)
	FOVEnabled = v
end)

--==================================================
-- FOV CIRCLE
--==================================================

local FOVCircle = Instance.new("Frame")
FOVCircle.BackgroundTransparency = 1
FOVCircle.Visible = false
FOVCircle.Parent = Gui

local FOVCircleCorner = Instance.new("UICorner")
FOVCircleCorner.CornerRadius = UDim.new(1, 0)
FOVCircleCorner.Parent = FOVCircle

local FOVStroke = Instance.new("UIStroke")
FOVStroke.Thickness = 2
FOVStroke.Parent = FOVCircle

--==================================================
-- ESP
--==================================================

local ESPs = {}

local function CreateLine(parent)
	local line = Instance.new("Frame")
	line.BorderSizePixel = 0
	line.AnchorPoint = Vector2.new(0.5, 0.5)
	line.Visible = false
	line.Parent = parent
	return line
end

local function CreateESP(Player)
	if Player == LP then
		return
	end

	local Screen = Instance.new("ScreenGui")
	Screen.Name = "ESP_" .. Player.Name
	Screen.ResetOnSpawn = false
	Screen.Parent = Gui

	local Box = Instance.new("Frame")
	Box.BackgroundTransparency = 1
	Box.Visible = false
	Box.Parent = Screen

	local BoxStroke = Instance.new("UIStroke")
	BoxStroke.Thickness = 2
	BoxStroke.Parent = Box

	local Line = Instance.new("Frame")
	Line.BorderSizePixel = 0
	Line.AnchorPoint = Vector2.new(0.5, 0.5)
	Line.Visible = false
	Line.Parent = Screen

	local HealthBG = Instance.new("Frame")
	HealthBG.BorderSizePixel = 0
	HealthBG.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	HealthBG.Visible = false
	HealthBG.Parent = Screen

	local Health = Instance.new("Frame")
	Health.BorderSizePixel = 0
	Health.AnchorPoint = Vector2.new(0, 1)
	Health.Position = UDim2.fromScale(0, 1)
	Health.Size = UDim2.new(1, 0, 1, 0)
	Health.Parent = HealthBG

	local Name = Instance.new("TextLabel")
	Name.BackgroundTransparency = 1
	Name.TextColor3 = Color3.new(1, 1, 1)
	Name.TextStrokeTransparency = 0
	Name.TextSize = 13
	Name.Font = Enum.Font.GothamBold
	Name.Visible = false
	Name.Parent = Screen

	local Dist = Instance.new("TextLabel")
	Dist.BackgroundTransparency = 1
	Dist.TextColor3 = Color3.new(1, 1, 1)
	Dist.TextStrokeTransparency = 0
	Dist.TextSize = 12
	Dist.Font = Enum.Font.GothamBold
	Dist.Visible = false
	Dist.Parent = Screen

	local SkeletonContainer = Instance.new("Frame")
	SkeletonContainer.BackgroundTransparency = 1
	SkeletonContainer.Size = UDim2.fromScale(1, 1)
	SkeletonContainer.Parent = Screen

	local SkeletonLines = {}

	for i = 1, 15 do
		SkeletonLines[i] = CreateLine(SkeletonContainer)
	end

	ESPs[Player] = {
		Screen = Screen,
		Box = Box,
		BoxStroke = BoxStroke,
		Line = Line,
		HealthBG = HealthBG,
		Health = Health,
		Name = Name,
		Dist = Dist,
		SkeletonLines = SkeletonLines
	}
end

local function RemoveESP(Player)
	if ESPs[Player] then
		ESPs[Player].Screen:Destroy()
		ESPs[Player] = nil
	end
end

for _, Player in ipairs(Players:GetPlayers()) do
	CreateESP(Player)
end

Players.PlayerAdded:Connect(CreateESP)
Players.PlayerRemoving:Connect(RemoveESP)

--==================================================
-- SKELETON BONES
--==================================================

local R15Bones = {
	{"Head", "UpperTorso"},
	{"UpperTorso", "LowerTorso"},

	{"UpperTorso", "LeftUpperArm"},
	{"LeftUpperArm", "LeftLowerArm"},
	{"LeftLowerArm", "LeftHand"},

	{"UpperTorso", "RightUpperArm"},
	{"RightUpperArm", "RightLowerArm"},
	{"RightLowerArm", "RightHand"},

	{"LowerTorso", "LeftUpperLeg"},
	{"LeftUpperLeg", "LeftLowerLeg"},
	{"LeftLowerLeg", "LeftFoot"},

	{"LowerTorso", "RightUpperLeg"},
	{"RightUpperLeg", "RightLowerLeg"},
	{"RightLowerLeg", "RightFoot"}
}

local R6Bones = {
	{"Head", "Torso"},
	{"Torso", "Left Arm"},
	{"Torso", "Right Arm"},
	{"Torso", "Left Leg"},
	{"Torso", "Right Leg"}
}

local function UpdateSkeleton(Player, ESP, Char)
	local Bones = R15Bones

	if Char:FindFirstChild("Torso") then
		Bones = R6Bones
	end

	for i, Line in ipairs(ESP.SkeletonLines) do
		local Bone = Bones[i]

		if Bone then
			local Part1 = Char:FindFirstChild(Bone[1])
			local Part2 = Char:FindFirstChild(Bone[2])

			if Part1 and Part2 then
				local P1, V1 =
					Camera:WorldToViewportPoint(Part1.Position)

				local P2, V2 =
					Camera:WorldToViewportPoint(Part2.Position)

				if V1 or V2 then
					local X = (P1.X + P2.X) / 2
					local Y = (P1.Y + P2.Y) / 2

					local DX = P2.X - P1.X
					local DY = P2.Y - P1.Y

					local Length =
						math.sqrt(DX * DX + DY * DY)

					Line.Position =
						UDim2.fromOffset(X, Y)

					Line.Size =
						UDim2.fromOffset(2, Length)

					Line.Rotation =
						math.deg(math.atan2(DY, DX)) - 90

					Line.Visible = SkeletonESP
				else
					Line.Visible = false
				end
			else
				Line.Visible = false
			end
		else
			Line.Visible = false
		end
	end
end

--==================================================
-- TARGET
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

	local Best
	local BestDistance = AimFOV

	local Viewport = Camera.ViewportSize
	local Center =
		Vector2.new(Viewport.X / 2, Viewport.Y / 2)

	for _, Player in ipairs(Players:GetPlayers()) do
		if Player ~= LP then
			local Char = Player.Character
			local Hum =
				Char and Char:FindFirstChildOfClass("Humanoid")

			local Head =
				Char and Char:FindFirstChild("Head")

			if Hum and Hum.Health > 0 and Head then
				local Position, Visible =
					Camera:WorldToViewportPoint(
						Head.Position
					)

				if Visible then
					local Distance =
						(
							Vector2.new(
								Position.X,
								Position.Y
							) - Center
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
-- UPDATE
--==================================================

RunService.RenderStepped:Connect(function()

	local Character = LP.Character
	local Humanoid =
		Character and Character:FindFirstChildOfClass("Humanoid")

	local Root =
		Character and Character:FindFirstChild("HumanoidRootPart")

	-- RGB
	local RGB =
		Color3.fromHSV(
			(tick() * 0.18) % 1,
			1,
			1
		)

	MainStroke.Color = RGB
	KeyStroke.Color = RGB
	FOVStroke.Color = RGB

	-- FOV
	local Viewport = Camera.ViewportSize

	FOVCircle.Size =
		UDim2.fromOffset(
			AimFOV * 2,
			AimFOV * 2
		)

	FOVCircle.Position =
		UDim2.fromOffset(
			Viewport.X / 2 - AimFOV,
			Viewport.Y / 2 - AimFOV
		)

	FOVCircle.Visible = FOVEnabled

	-- AIMBOT
	if RageAimbot or NormalAimbot then

		local Target = GetTarget()

		if Target then
			local Char = Target.Character
			local Head =
				Char and Char:FindFirstChild("Head")

			if Head then

				if RageAimbot then

					Camera.CFrame =
						CFrame.lookAt(
							Camera.CFrame.Position,
							Head.Position
						)

				elseif NormalAimbot then

					local Desired =
						CFrame.lookAt(
							Camera.CFrame.Position,
							Head.Position
						)

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
		for _, Part in ipairs(Character:GetDescendants()) do
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

		local Move = Humanoid.MoveDirection
		local CamCF = Camera.CFrame

		local Forward =
			Vector3.new(
				CamCF.LookVector.X,
				0,
				CamCF.LookVector.Z
			)

		local Right =
			Vector3.new(
				CamCF.RightVector.X,
				0,
				CamCF.RightVector.Z
			)

		if Forward.Magnitude > 0 then
			Forward = Forward.Unit
		end

		if Right.Magnitude > 0 then
			Right = Right.Unit
		end

		local Direction =
			Forward * (-Move.Z)
			+ Right * Move.X

		local Vertical = 0

		if UserInputService:IsKeyDown(
			Enum.KeyCode.Space
		) then

			Vertical = 1

		elseif UserInputService:IsKeyDown(
			Enum.KeyCode.LeftShift
		) then

			Vertical = -1
		end

		Root.AssemblyLinearVelocity =
			(Direction * 60)
			+ Vector3.new(
				0,
				Vertical * 60,
				0
			)

	elseif Humanoid and not Fly then
		Humanoid.PlatformStand = false
	end

	-- ESP
	for Player, ESP in pairs(ESPs) do

		local Char = Player.Character

		local Hum =
			Char and Char:FindFirstChildOfClass("Humanoid")

		local Head =
			Char and Char:FindFirstChild("Head")

		local PlayerRoot =
			Char and Char:FindFirstChild(
				"HumanoidRootPart"
			)

		if Char
			and Hum
			and Hum.Health > 0
			and Head
			and PlayerRoot then

			local TopPosition, TopVisible =
				Camera:WorldToViewportPoint(
					Head.Position +
					Vector3.new(0, 0.5, 0)
				)

			local BottomPosition, BottomVisible =
				Camera:WorldToViewportPoint(
					PlayerRoot.Position -
					Vector3.new(0, 3, 0)
				)

			local TopY =
				math.min(
					TopPosition.Y,
					BottomPosition.Y
				)

			local BottomY =
				math.max(
					TopPosition.Y,
					BottomPosition.Y
				)

			local Height =
				math.max(
					BottomY - TopY,
					20
				)

			local Width =
				math.max(
					Height * 0.55,
					15
				)

			-- BOX
			ESP.Box.Visible =
				BoxESP and
				(TopVisible or BottomVisible)

			if ESP.Box.Visible then

				ESP.Box.Position =
					UDim2.fromOffset(
						TopPosition.X - Width / 2,
						TopY
					)

				ESP.Box.Size =
					UDim2.fromOffset(
						Width,
						Height
					)

				ESP.BoxStroke.Color = RGB
			end

			-- LINE
			ESP.Line.Visible = false

			if LineESP then

				local BoundingCF,
					BoundingSize =
					Char:GetBoundingBox()

				local FeetWorld =
					BoundingCF.Position -
					Vector3.new(
						0,
						BoundingSize.Y / 2,
						0
					)

				local FeetPosition, Visible =
					Camera:WorldToViewportPoint(
						FeetWorld
					)

				if Visible then

					local StartX =
						Viewport.X / 2

					local StartY =
						Viewport.Y - 5

					local EndX =
						FeetPosition.X

					local EndY =
						FeetPosition.Y

					local DX =
						EndX - StartX

					local DY =
						EndY - StartY

					local Length =
						math.sqrt(
							DX * DX +
							DY * DY
						)

					ESP.Line.Position =
						UDim2.fromOffset(
							(StartX + EndX) / 2,
							(StartY + EndY) / 2
						)

					ESP.Line.Size =
						UDim2.fromOffset(
							3,
							Length
						)

					ESP.Line.Rotation =
						math.deg(
							math.atan2(DY, DX)
						) - 90

					ESP.Line.BackgroundColor3 = RGB
					ESP.Line.Visible = true
				end
			end

			-- HEALTH
			ESP.HealthBG.Visible = HealthESP

			if HealthESP then

				ESP.HealthBG.Position =
					UDim2.fromOffset(
						TopPosition.X -
						Width / 2 - 7,
						TopY
					)

				ESP.HealthBG.Size =
					UDim2.fromOffset(
						4,
						Height
					)

				local HealthPercent =
					math.clamp(
						Hum.Health /
						Hum.MaxHealth,
						0,
						1
					)

				ESP.Health.Size =
					UDim2.new(
						1,
						0,
						HealthPercent,
						0
					)

				ESP.Health.BackgroundColor3 =
					Color3.fromHSV(
						HealthPercent * 0.33,
						1,
						1
					)
			end

			-- NAME
			ESP.Name.Visible = NameESP

			if NameESP then

				ESP.Name.Text = Player.Name

				ESP.Name.Position =
					UDim2.fromOffset(
						TopPosition.X,
						TopY - 20
					)

				ESP.Name.Size =
					UDim2.fromOffset(
						Width + 40,
						18
					)

				ESP.Name.AnchorPoint =
					Vector2.new(0.5, 0)
			end

			-- DISTANCE
			ESP.Dist.Visible = DistESP

			if DistESP and Root then

				local Distance =
					(
						PlayerRoot.Position -
						Root.Position
					).Magnitude

				ESP.Dist.Text =
					math.floor(Distance) ..
					" studs"

				ESP.Dist.Position =
					UDim2.fromOffset(
						TopPosition.X,
						BottomY + 3
					)

				ESP.Dist.Size =
					UDim2.fromOffset(
						Width + 40,
						18
					)

				ESP.Dist.AnchorPoint =
					Vector2.new(0.5, 0)
			end

			-- SKELETON
			UpdateSkeleton(
				Player,
				ESP,
				Char
			)

		else

			ESP.Box.Visible = false
			ESP.Line.Visible = false
			ESP.HealthBG.Visible = false
			ESP.Name.Visible = false
			ESP.Dist.Visible = false

			for _, Line in ipairs(
				ESP.SkeletonLines
			) do
				Line.Visible = false
			end
		end
	end
end)

--==================================================
-- OPEN BUTTON
--==================================================

local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.fromOffset(60, 60)
OpenButton.Position =
	UDim2.new(
		0,
		20,
		0.5,
		-30
	)

OpenButton.BackgroundColor3 =
	Color3.fromRGB(18, 18, 18)

OpenButton.Text = "F"
OpenButton.TextColor3 =
	Color3.new(1, 1, 1)

OpenButton.TextSize = 24
OpenButton.Font =
	Enum.Font.GothamBold

OpenButton.Visible = false
OpenButton.Parent = Gui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius =
	UDim.new(0, 16)
OpenCorner.Parent = OpenButton

local OpenStroke = Instance.new("UIStroke")
OpenStroke.Thickness = 3
OpenStroke.Parent = OpenButton

--==================================================
-- CLOSE / OPEN
--==================================================

Close.MouseButton1Click:Connect(function()
	Main.Visible = false
	OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
	Main.Visible = true
	OpenButton.Visible = false
end)

--==================================================
-- KEY CHECK
--==================================================

local function CheckKey()
	local Input = string.upper(
		KeyBox.Text:gsub("%s+", "")
	)

	if ValidKeys[Input] then

		KeyStatus.Text = "KEY CORRETA!"
		KeyStatus.TextColor3 =
			Color3.fromRGB(80, 255, 120)

		EnterButton.Text = "CARREGANDO..."

		task.wait(0.7)

		KeyFrame.Visible = false
		Main.Visible = true
		OpenButton.Visible = false

	else

		KeyStatus.Text = "KEY INVÁLIDA!"
		KeyStatus.TextColor3 =
			Color3.fromRGB(255, 70, 70)

		KeyBox.Text = ""
	end
end

EnterButton.MouseButton1Click:Connect(CheckKey)

KeyBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		CheckKey()
	end
end)

--==================================================
-- START
--==================================================

Main.Visible = false
OpenButton.Visible = false
KeyFrame.Visible = true

print("FFH4X KEY SYSTEM carregado!")