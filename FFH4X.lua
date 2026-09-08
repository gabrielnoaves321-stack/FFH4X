--// FFH4X - NFXNOBRU1

local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local UserInputService=game:GetService("UserInputService")

local LP=Players.LocalPlayer
local Camera=workspace.CurrentCamera

local RageAimbot=false
local NormalAimbot=false
local BoxESP=false
local LineESP=false
local HealthESP=false
local NameESP=false
local DistESP=false
local SkeletonESP=false
local Noclip=false
local Spin=false
local FOVEnabled=false
local SpeedEnabled=false

local AimFOV=200
local AimSmooth=0.18
local SpinSpeed=99999999
local WalkSpeed=50
local CurrentTarget=nil

local Gui=Instance.new("ScreenGui")
Gui.Name="FFH4X_NFXNOBRU1"
Gui.ResetOnSpawn=false
Gui.IgnoreGuiInset=true
Gui.Parent=LP:WaitForChild("PlayerGui")

local OpenButton=Instance.new("TextButton")
OpenButton.Size=UDim2.fromOffset(58,58)
OpenButton.Position=UDim2.new(0,20,.5,-29)
OpenButton.BackgroundColor3=Color3.fromRGB(25,25,25)
OpenButton.Text="F"
OpenButton.TextColor3=Color3.new(1,1,1)
OpenButton.TextSize=25
OpenButton.Font=Enum.Font.GothamBold
OpenButton.Visible=false
OpenButton.Parent=Gui

local OpenCorner=Instance.new("UICorner",OpenButton)
OpenCorner.CornerRadius=UDim.new(0,14)

local OpenStroke=Instance.new("UIStroke",OpenButton)
OpenStroke.Thickness=3

local Main=Instance.new("Frame")
Main.Size=UDim2.fromOffset(330,440)
Main.Position=UDim2.new(.5,-165,.5,-220)
Main.BackgroundColor3=Color3.fromRGB(22,22,22)
Main.BorderSizePixel=0
Main.Parent=Gui

local MainCorner=Instance.new("UICorner",Main)
MainCorner.CornerRadius=UDim.new(0,8)

local MainStroke=Instance.new("UIStroke",Main)
MainStroke.Thickness=3

local Header=Instance.new("Frame")
Header.Size=UDim2.new(1,0,0,58)
Header.BackgroundColor3=Color3.fromRGB(30,30,30)
Header.BorderSizePixel=0
Header.Parent=Main

local Title=Instance.new("TextLabel")
Title.Size=UDim2.new(1,-60,1,0)
Title.Position=UDim2.fromOffset(14,0)
Title.BackgroundTransparency=1
Title.Text="FFH4X - NFXNOBRU1"
Title.TextColor3=Color3.new(1,1,1)
Title.TextSize=19
Title.Font=Enum.Font.GothamBold
Title.TextXAlignment=Enum.TextXAlignment.Left
Title.Parent=Header

local Close=Instance.new("TextButton")
Close.Size=UDim2.fromOffset(40,40)
Close.Position=UDim2.new(1,-48,0,9)
Close.BackgroundColor3=Color3.fromRGB(45,45,45)
Close.Text="X"
Close.TextColor3=Color3.new(1,1,1)
Close.TextSize=20
Close.Font=Enum.Font.GothamBold
Close.Parent=Header

local CloseCorner=Instance.new("UICorner",Close)
CloseCorner.CornerRadius=UDim.new(0,8)

local DragHandle=Instance.new("TextButton")
DragHandle.Size=UDim2.new(1,-55,1,0)
DragHandle.BackgroundTransparency=1
DragHandle.Text=""
DragHandle.AutoButtonColor=false
DragHandle.Parent=Header

local Dragging=false
local DragStart
local StartPosition

DragHandle.InputBegan:Connect(function(Input)
	if Input.UserInputType==Enum.UserInputType.MouseButton1
	or Input.UserInputType==Enum.UserInputType.Touch then
		Dragging=true
		DragStart=Input.Position
		StartPosition=Main.Position

		Input.Changed:Connect(function()
			if Input.UserInputState==Enum.UserInputState.End then
				Dragging=false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(Input)
	if not Dragging then return end

	if Input.UserInputType==Enum.UserInputType.MouseMovement
	or Input.UserInputType==Enum.UserInputType.Touch then
		local Delta=Input.Position-DragStart

		Main.Position=UDim2.new(
			StartPosition.X.Scale,
			StartPosition.X.Offset+Delta.X,
			StartPosition.Y.Scale,
			StartPosition.Y.Offset+Delta.Y
		)
	end
end)

local TabBar=Instance.new("Frame")
TabBar.Size=UDim2.new(1,-20,0,42)
TabBar.Position=UDim2.fromOffset(10,68)
TabBar.BackgroundTransparency=1
TabBar.Parent=Main

local PageContainer=Instance.new("Frame")
PageContainer.Size=UDim2.new(1,-20,1,-120)
PageContainer.Position=UDim2.fromOffset(10,115)
PageContainer.BackgroundTransparency=1
PageContainer.Parent=Main

local Pages={}

local function CreatePage()
	local Page=Instance.new("ScrollingFrame")
	Page.Size=UDim2.fromScale(1,1)
	Page.BackgroundTransparency=1
	Page.BorderSizePixel=0
	Page.ScrollBarThickness=3
	Page.CanvasSize=UDim2.new()
	Page.Visible=false
	Page.Parent=PageContainer

	local Layout=Instance.new("UIListLayout",Page)
	Layout.Padding=UDim.new(0,7)
	Layout.HorizontalAlignment=Enum.HorizontalAlignment.Center

	Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		Page.CanvasSize=UDim2.fromOffset(0,Layout.AbsoluteContentSize.Y+10)
	end)

	table.insert(Pages,Page)
	return Page
end

local CharacterPage=CreatePage()
local CombatPage=CreatePage()
local ESPPage=CreatePage()

local function CreateTab(Text,Position,Page)
	local Button=Instance.new("TextButton")
	Button.Size=UDim2.new(1/3,-5,1,0)
	Button.Position=Position
	Button.BackgroundColor3=Color3.fromRGB(35,35,35)
	Button.Text=Text
	Button.TextColor3=Color3.new(1,1,1)
	Button.TextSize=12
	Button.Font=Enum.Font.GothamBold
	Button.Parent=TabBar

	local Corner=Instance.new("UICorner",Button)
	Corner.CornerRadius=UDim.new(0,7)

	Button.MouseButton1Click:Connect(function()
		for _,P in ipairs(Pages) do
			P.Visible=false
		end
		Page.Visible=true
	end)
end

CreateTab("PERSONAGEM",UDim2.new(0,0,0,0),CharacterPage)
CreateTab("COMBATE",UDim2.new(1/3,2,0,0),CombatPage)
CreateTab("ESP",UDim2.new(2/3,4,0,0),ESPPage)

CharacterPage.Visible=true

local function CreateToggle(Parent,Text,Callback)
	local Button=Instance.new("TextButton")
	Button.Size=UDim2.new(1,-5,0,39)
	Button.BackgroundColor3=Color3.fromRGB(35,35,35)
	Button.Text=Text.."  [OFF]"
	Button.TextColor3=Color3.new(1,1,1)
	Button.TextSize=13
	Button.Font=Enum.Font.GothamBold
	Button.Parent=Parent

	local Corner=Instance.new("UICorner",Button)
	Corner.CornerRadius=UDim.new(0,7)

	local Enabled=false

	Button.MouseButton1Click:Connect(function()
		Enabled=not Enabled
		Button.Text=Text.."  ["..(Enabled and "ON" or "OFF").."]"
		Button.BackgroundColor3=
			Enabled and Color3.fromRGB(35,115,55)
			or Color3.fromRGB(35,35,35)
		Callback(Enabled)
	end)

	return Button
end

CreateToggle(CharacterPage,"⚡ SPEED",function(Value)
	SpeedEnabled=Value

	local Character=LP.Character
	local Humanoid=Character and Character:FindFirstChildOfClass("Humanoid")

	if Humanoid then
		Humanoid.WalkSpeed=Value and WalkSpeed or 16
	end
end)

CreateToggle(CharacterPage,"👻 NOCLIP",function(Value)
	Noclip=Value
end)

CreateToggle(CharacterPage,"🌀 SPIN",function(Value)
	Spin=Value
end)

CreateToggle(CombatPage,"🔥 AIMBOT RAGE",function(Value)
	RageAimbot=Value

	if Value then
		NormalAimbot=false
	else
		CurrentTarget=nil
	end
end)

CreateToggle(CombatPage,"🎯 AIMBOT NORMAL",function(Value)
	NormalAimbot=Value

	if Value then
		RageAimbot=false
	else
		CurrentTarget=nil
	end
end)

local FOVButton=Instance.new("TextButton")
FOVButton.Size=UDim2.new(1,-5,0,39)
FOVButton.BackgroundColor3=Color3.fromRGB(35,35,35)
FOVButton.Text="🎯 FOV: "..AimFOV
FOVButton.TextColor3=Color3.new(1,1,1)
FOVButton.TextSize=13
FOVButton.Font=Enum.Font.GothamBold
FOVButton.Parent=CombatPage

local FOVCorner=Instance.new("UICorner",FOVButton)
FOVCorner.CornerRadius=UDim.new(0,7)

FOVButton.MouseButton1Click:Connect(function()
	AimFOV+=25

	if AimFOV>500 then
		AimFOV=50
	end

	FOVButton.Text="🎯 FOV: "..AimFOV
end)

CreateToggle(CombatPage,"⭕ FOV CIRCLE",function(Value)
	FOVEnabled=Value
end)

CreateToggle(ESPPage,"📦 ESP CAIXA BOX",function(Value)
	BoxESP=Value
end)

CreateToggle(ESPPage,"📏 ESP LINE",function(Value)
	LineESP=Value
end)

CreateToggle(ESPPage,"❤️ ESP VIDA",function(Value)
	HealthESP=Value
end)

CreateToggle(ESPPage,"🏷️ ESP NOME",function(Value)
	NameESP=Value
end)

CreateToggle(ESPPage,"📍 ESP DIST",function(Value)
	DistESP=Value
end)

CreateToggle(ESPPage,"🦴 ESP SKELETON",function(Value)
	SkeletonESP=Value
end)

local FOVCircle=Instance.new("Frame")
FOVCircle.BackgroundTransparency=1
FOVCircle.Visible=false
FOVCircle.Parent=Gui

local FOVCircleCorner=Instance.new("UICorner",FOVCircle)
FOVCircleCorner.CornerRadius=UDim.new(1,0)

local FOVStroke=Instance.new("UIStroke",FOVCircle)
FOVStroke.Thickness=2

local ESPs={}

local R15Bones={
	{"Head","UpperTorso"},
	{"UpperTorso","LowerTorso"},
	{"UpperTorso","LeftUpperArm"},
	{"LeftUpperArm","LeftLowerArm"},
	{"LeftLowerArm","LeftHand"},
	{"UpperTorso","RightUpperArm"},
	{"RightUpperArm","RightLowerArm"},
	{"RightLowerArm","RightHand"},
	{"LowerTorso","LeftUpperLeg"},
	{"LeftUpperLeg","LeftLowerLeg"},
	{"LeftLowerLeg","LeftFoot"},
	{"LowerTorso","RightUpperLeg"},
	{"RightUpperLeg","RightLowerLeg"},
	{"RightLowerLeg","RightFoot"}
}

local R6Bones={
	{"Head","Torso"},
	{"Torso","Left Arm"},
	{"Torso","Right Arm"},
	{"Torso","Left Leg"},
	{"Torso","Right Leg"}
}

local function CreateLine(Parent)
	local Line=Instance.new("Frame")
	Line.AnchorPoint=Vector2.new(.5,.5)
	Line.BorderSizePixel=0
	Line.Visible=false
	Line.Parent=Parent
	return Line
end

local function CreateESP(Player)
	if Player==LP then return end

	local Screen=Instance.new("ScreenGui")
	Screen.Name="ESP_"..Player.UserId
	Screen.ResetOnSpawn=false
	Screen.IgnoreGuiInset=true
	Screen.Parent=Gui

	local Box=Instance.new("Frame")
	Box.BackgroundTransparency=1
	Box.BorderSizePixel=0
	Box.Visible=false
	Box.Parent=Screen

	local BoxStroke=Instance.new("UIStroke",Box)
	BoxStroke.Thickness=2

	local Line=CreateLine(Screen)

	local HealthBG=Instance.new("Frame")
	HealthBG.BackgroundColor3=Color3.fromRGB(30,30,30)
	HealthBG.BorderSizePixel=0
	HealthBG.AnchorPoint=Vector2.new(1,0)
	HealthBG.Visible=false
	HealthBG.Parent=Screen

	local Health=Instance.new("Frame")
	Health.BorderSizePixel=0
	Health.AnchorPoint=Vector2.new(0,1)
	Health.Position=UDim2.new(0,0,1,0)
	Health.Size=UDim2.new(1,0,1,0)
	Health.Parent=HealthBG

	local Name=Instance.new("TextLabel")
	Name.BackgroundTransparency=1
	Name.TextColor3=Color3.new(1,1,1)
	Name.TextStrokeTransparency=0
	Name.TextSize=13
	Name.Font=Enum.Font.GothamBold
	Name.Visible=false
	Name.Parent=Screen

	local Distance=Instance.new("TextLabel")
	Distance.BackgroundTransparency=1
	Distance.TextColor3=Color3.new(1,1,1)
	Distance.TextStrokeTransparency=0
	Distance.TextSize=12
	Distance.Font=Enum.Font.GothamBold
	Distance.Visible=false
	Distance.Parent=Screen

	local Skeleton=Instance.new("Frame")
	Skeleton.BackgroundTransparency=1
	Skeleton.Size=UDim2.fromScale(1,1)
	Skeleton.Parent=Screen

	local SkeletonLines={}

	for i=1,15 do
		SkeletonLines[i]=CreateLine(Skeleton)
	end

	ESPs[Player]={
		Screen=Screen,
		Box=Box,
		BoxStroke=BoxStroke,
		Line=Line,
		HealthBG=HealthBG,
		Health=Health,
		Name=Name,
		Distance=Distance,
		SkeletonLines=SkeletonLines
	}
end

local function RemoveESP(Player)
	if ESPs[Player] then
		ESPs[Player].Screen:Destroy()
		ESPs[Player]=nil
	end
end

for _,Player in ipairs(Players:GetPlayers()) do
	CreateESP(Player)
end

Players.PlayerAdded:Connect(CreateESP)
Players.PlayerRemoving:Connect(RemoveESP)

local function UpdateSkeleton(ESP,Character,RGB)
	local Bones=Character:FindFirstChild("UpperTorso") and R15Bones or R6Bones

	for i,Bone in ipairs(Bones) do
		local PartA=Character:FindFirstChild(Bone[1])
		local PartB=Character:FindFirstChild(Bone[2])
		local Line=ESP.SkeletonLines[i]

		if PartA and PartB then
			local APos,AVisible=Camera:WorldToViewportPoint(PartA.Position)
			local BPos,BVisible=Camera:WorldToViewportPoint(PartB.Position)

			if AVisible or BVisible then
				local DX=BPos.X-APos.X
				local DY=BPos.Y-APos.Y
				local Length=math.sqrt(DX*DX+DY*DY)

				Line.Position=UDim2.fromOffset(
					(APos.X+BPos.X)/2,
					(APos.Y+BPos.Y)/2
				)

				Line.Size=UDim2.fromOffset(2,math.max(Length,1))
				Line.Rotation=math.deg(math.atan2(DY,DX))-90
				Line.BackgroundColor3=RGB
				Line.Visible=SkeletonESP
			else
				Line.Visible=false
			end
		else
			Line.Visible=false
		end
	end

	for i=#Bones+1,#ESP.SkeletonLines do
		ESP.SkeletonLines[i].Visible=false
	end
end

local function GetTarget()
	if CurrentTarget then
		local Character=CurrentTarget.Character
		local Humanoid=Character and Character:FindFirstChildOfClass("Humanoid")
		local Head=Character and Character:FindFirstChild("Head")

		if Humanoid and Humanoid.Health>0 and Head then
			return CurrentTarget
		end

		CurrentTarget=nil
	end

	local BestTarget=nil
	local BestDistance=AimFOV
	local Viewport=Camera.ViewportSize
	local Center=Vector2.new(Viewport.X/2,Viewport.Y/2)

	for _,Player in ipairs(Players:GetPlayers()) do
		if Player~=LP then
			local Character=Player.Character
			local Humanoid=Character and Character:FindFirstChildOfClass("Humanoid")
			local Head=Character and Character:FindFirstChild("Head")

			if Humanoid and Humanoid.Health>0 and Head then
				local Position,Visible=Camera:WorldToViewportPoint(Head.Position)

				if Visible then
					local Distance=(Vector2.new(Position.X,Position.Y)-Center).Magnitude

					if Distance<BestDistance then
						BestDistance=Distance
						BestTarget=Player
					end
				end
			end
		end
	end

	CurrentTarget=BestTarget
	return BestTarget
end

RunService.RenderStepped:Connect(function()

	local Character=LP.Character
	local Humanoid=Character and Character:FindFirstChildOfClass("Humanoid")
	local Root=Character and Character:FindFirstChild("HumanoidRootPart")

	local RGB=Color3.fromHSV((tick()*.18)%1,1,1)

	MainStroke.Color=RGB
	OpenStroke.Color=RGB
	FOVStroke.Color=RGB

	if SpeedEnabled and Humanoid then
		Humanoid.WalkSpeed=WalkSpeed
	end

	local Viewport=Camera.ViewportSize

	FOVCircle.Size=UDim2.fromOffset(AimFOV*2,AimFOV*2)
	FOVCircle.Position=UDim2.fromOffset(
		Viewport.X/2-AimFOV,
		Viewport.Y/2-AimFOV
	)
	FOVCircle.Visible=FOVEnabled

	if RageAimbot or NormalAimbot then
		local Target=GetTarget()

		if Target then
			local TargetCharacter=Target.Character
			local Head=TargetCharacter and TargetCharacter:FindFirstChild("Head")

			if Head then
				local Desired=CFrame.lookAt(
					Camera.CFrame.Position,
					Head.Position
				)

				if RageAimbot then
					Camera.CFrame=Desired
				else
					Camera.CFrame=Camera.CFrame:Lerp(Desired,AimSmooth)
				end
			end
		end
	end

	if Noclip and Character then
		for _,Object in ipairs(Character:GetDescendants()) do
			if Object:IsA("BasePart") then
				Object.CanCollide=false
			end
		end
	end

	if Spin and Root then
		Root.CFrame=Root.CFrame*CFrame.Angles(
			0,
			math.rad(SpinSpeed),
			0
		)
	end

	for Player,ESP in pairs(ESPs) do

		local TargetCharacter=Player.Character
		local TargetHumanoid=TargetCharacter and TargetCharacter:FindFirstChildOfClass("Humanoid")
		local TargetRoot=TargetCharacter and TargetCharacter:FindFirstChild("HumanoidRootPart")
		local Head=TargetCharacter and TargetCharacter:FindFirstChild("Head")

		if TargetCharacter
		and TargetHumanoid
		and TargetHumanoid.Health>0
		and TargetRoot
		and Head then

			local RootPosition,RootVisible=
				Camera:WorldToViewportPoint(TargetRoot.Position)

			local HeadPosition,HeadVisible=
				Camera:WorldToViewportPoint(Head.Position)

			if RootVisible or HeadVisible then

				local BoundingCF,BoundingSize=
					TargetCharacter:GetBoundingBox()

				local TopWorld=
					BoundingCF.Position+
					Vector3.new(0,BoundingSize.Y/2,0)

				local BottomWorld=
					BoundingCF.Position-
					Vector3.new(0,BoundingSize.Y/2,0)

				local TopPosition=
					Camera:WorldToViewportPoint(TopWorld)

				local BottomPosition=
					Camera:WorldToViewportPoint(BottomWorld)

				local TopY=math.min(
					TopPosition.Y,
					BottomPosition.Y
				)

				local BottomY=math.max(
					TopPosition.Y,
					BottomPosition.Y
				)

				local Height=math.max(
					BottomY-TopY,
					20
				)

				local Width=math.max(
					Height*.55,
					15
				)

				-- CAIXA BOX
				ESP.Box.Position=UDim2.fromOffset(
					RootPosition.X-Width/2,
					TopY
				)

				ESP.Box.Size=UDim2.fromOffset(
					Width,
					Height
				)

				ESP.Box.Visible=BoxESP
				ESP.BoxStroke.Color=RGB

				-- VIDA
				ESP.HealthBG.Visible=HealthESP

				if HealthESP then
					ESP.HealthBG.Position=UDim2.fromOffset(
						RootPosition.X-Width/2-7,
						TopY
					)

					ESP.HealthBG.Size=UDim2.fromOffset(
						4,
						Height
					)

					local Per=math.clamp(
						TargetHumanoid.Health/
						TargetHumanoid.MaxHealth,
						0,
						1
					)

					ESP.Health.Size=UDim2.new(
						1,
						0,
						Per,
						0
					)

					ESP.Health.Position=UDim2.new(
						0,
						0,
						1,
						0
					)

					ESP.Health.BackgroundColor3=RGB
				end

				-- LINE
				ESP.Line.Visible=LineESP

				if LineESP then
					local Center=Vector2.new(
						Viewport.X/2,
						Viewport.Y
					)

					local Feet=Camera:WorldToViewportPoint(
						TargetRoot.Position-Vector3.new(0,3,0)
					)

					local DX=Feet.X-Center.X
					local DY=Feet.Y-Center.Y
					local Length=math.sqrt(DX*DX+DY*DY)

					ESP.Line.Position=UDim2.fromOffset(
						(Center.X+Feet.X)/2,
						(Center.Y+Feet.Y)/2
					)

					ESP.Line.Size=UDim2.fromOffset(
						2,
						math.max(Length,1)
					)

					ESP.Line.Rotation=
						math.deg(math.atan2(DY,DX))-90

					ESP.Line.BackgroundColor3=RGB
				end

				-- NOME
				ESP.Name.Visible=NameESP

				if NameESP then
					ESP.Name.Text=Player.Name
					ESP.Name.Position=UDim2.fromOffset(
						RootPosition.X-50,
						TopY-20
					)
					ESP.Name.Size=UDim2.fromOffset(100,18)
				end

				-- DISTÂNCIA
				ESP.Distance.Visible=DistESP

				if DistESP and Root then
					ESP.Distance.Text=
						math.floor(
							(TargetRoot.Position-Root.Position).Magnitude
						).."m"

					ESP.Distance.Position=UDim2.fromOffset(
						RootPosition.X-50,
						BottomY+3
					)

					ESP.Distance.Size=UDim2.fromOffset(100,18)
				end

				-- SKELETON
				UpdateSkeleton(
					ESP,
					TargetCharacter,
					RGB
				)

			else
				ESP.Box.Visible=false
				ESP.HealthBG.Visible=false
				ESP.Line.Visible=false
				ESP.Name.Visible=false
				ESP.Distance.Visible=false

				for _,Line in ipairs(ESP.SkeletonLines) do
					Line.Visible=false
				end
			end

		else
			ESP.Box.Visible=false
			ESP.HealthBG.Visible=false
			ESP.Line.Visible=false
			ESP.Name.Visible=false
			ESP.Distance.Visible=false

			for _,Line in ipairs(ESP.SkeletonLines) do
				Line.Visible=false
			end
		end
	end
end)

Close.MouseButton1Click:Connect(function()
	Main.Visible=false
	OpenButton.Visible=true
end)

OpenButton.MouseButton1Click:Connect(function()
	Main.Visible=true
	OpenButton.Visible=false
end)
