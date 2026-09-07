```lua
--========================================================
-- FFH4X - NFXNOBRU1
-- PAINEL COMPLETO PARA SEU PRÓPRIO JOGO
-- KEY + ABAS + SLIDERS + UI MODERNA
--========================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")

--========================================================
-- KEYS
--========================================================

local ValidKeys = {
	["FFH4X-KRAVM"]=true,["FFH4X-PLQWT"]=true,
	["FFH4X-ZMXRA"]=true,["FFH4X-NVKLP"]=true,
	["FFH4X-QWERT"]=true,["FFH4X-HJXPK"]=true,
	["FFH4X-BLMQA"]=true,["FFH4X-TZKRV"]=true,
	["FFH4X-WPMNX"]=true,["FFH4X-GRQVL"]=true,

	["FFH4X-XKQPA"]=true,["FFH4X-MZLWR"]=true,
	["FFH4X-VBNQK"]=true,["FFH4X-RXTPM"]=true,
	["FFH4X-KJHQA"]=true,["FFH4X-PXWLM"]=true,
	["FFH4X-QAZTR"]=true,["FFH4X-NMCKP"]=true,
	["FFH4X-YTRVX"]=true,["FFH4X-LPQAZ"]=true,

	["FFH4X-ZQWNM"]=true,["FFH4X-KXPLR"]=true,
	["FFH4X-MQWAZ"]=true,["FFH4X-RVKTP"]=true,
	["FFH4X-HPLMX"]=true,["FFH4X-TQZKA"]=true,
	["FFH4X-WXNRP"]=true,["FFH4X-GKQMV"]=true,
	["FFH4X-BXRLT"]=true,["FFH4X-VQPKN"]=true,

	["FFH4X-MLQTR"]=true,["FFH4X-XZKPA"]=true,
	["FFH4X-QMRVX"]=true,["FFH4X-NPLWK"]=true,
	["FFH4X-KQZMT"]=true,["FFH4X-RPXVA"]=true,
	["FFH4X-TKQWL"]=true,["FFH4X-ZNRMP"]=true,
	["FFH4X-WQKTX"]=true,["FFH4X-HZPLQ"]=true,

	["FFH4X-BQXMR"]=true,["FFH4X-VKZTP"]=true,
	["FFH4X-MXQRL"]=true,["FFH4X-PZKVA"]=true,
	["FFH4X-QXWRT"]=true,["FFH4X-NKMLP"]=true,
	["FFH4X-RQZVX"]=true,["FFH4X-TPLKM"]=true,
	["FFH4X-WZQRP"]=true,["FFH4X-KMXTA"]=true
}

--========================================================
-- CONFIGURAÇÕES
--========================================================

local Settings = {
	WalkSpeed = 16,
	FlySpeed = 60,
	FOV = 200,
	FOVEnabled = false,
	RGB = true,

	-- Estados das opções
	CombatMode = false,
	Box = false,
	Line = false,
	Health = false,
	Name = false,
	Distance = false,
	Skeleton = false,
	Spin = false,
	Noclip = false,
	Fly = false
}

--========================================================
-- GUI
--========================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "FFH4X_NFXNOBRU1"
Gui.ResetOnSpawn = false
Gui.Parent = PlayerGui

--========================================================
-- FUNÇÕES VISUAIS
--========================================================

local function Corner(obj, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, radius)
	c.Parent = obj
	return c
end

local function Stroke(obj, thickness)
	local s = Instance.new("UIStroke")
	s.Thickness = thickness
	s.Parent = obj
	return s
end

local function NewLabel(parent, text, size, pos, textSize)
	local l = Instance.new("TextLabel")
	l.BackgroundTransparency = 1
	l.Size = size
	l.Position = pos
	l.Text = text
	l.TextColor3 = Color3.new(1,1,1)
	l.TextSize = textSize or 14
	l.Font = Enum.Font.GothamBold
	l.Parent = parent
	return l
end

--========================================================
-- KEY FRAME
--========================================================

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.fromOffset(370,235)
KeyFrame.Position = UDim2.new(.5,-185,.5,-117)
KeyFrame.BackgroundColor3 = Color3.fromRGB(13,14,18)
KeyFrame.Parent = Gui

Corner(KeyFrame,16)
local KeyStroke = Stroke(KeyFrame,2)

local KeyTitle = NewLabel(
	KeyFrame,
	"FFH4X",
	UDim2.new(1,-30,0,32),
	UDim2.fromOffset(15,14),
	23
)

KeyTitle.TextXAlignment = Enum.TextXAlignment.Left

local KeySubtitle = NewLabel(
	KeyFrame,
	"KEY SYSTEM  •  NFXNOBRU1",
	UDim2.new(1,-30,0,20),
	UDim2.fromOffset(15,45),
	11
)

KeySubtitle.TextColor3 = Color3.fromRGB(145,150,160)
KeySubtitle.TextXAlignment = Enum.TextXAlignment.Left

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1,-30,0,45)
KeyBox.Position = UDim2.fromOffset(15,78)
KeyBox.BackgroundColor3 = Color3.fromRGB(24,26,32)
KeyBox.PlaceholderText = "FFH4X-XXXXX"
KeyBox.PlaceholderColor3 = Color3.fromRGB(90,95,105)
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.new(1,1,1)
KeyBox.TextSize = 14
KeyBox.Font = Enum.Font.GothamBold
KeyBox.ClearTextOnFocus = false
KeyBox.Parent = KeyFrame

Corner(KeyBox,10)

local Enter = Instance.new("TextButton")
Enter.Size = UDim2.new(1,-30,0,43)
Enter.Position = UDim2.fromOffset(15,133)
Enter.BackgroundColor3 = Color3.fromRGB(35,120,70)
Enter.Text = "ENTRAR"
Enter.TextColor3 = Color3.new(1,1,1)
Enter.TextSize = 14
Enter.Font = Enum.Font.GothamBold
Enter.Parent = KeyFrame

Corner(Enter,10)

local KeyStatus = NewLabel(
	KeyFrame,
	"",
	UDim2.new(1,-30,0,25),
	UDim2.fromOffset(15,188),
	12
)

--========================================================
-- MAIN
--========================================================

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(650,455)
Main.Position = UDim2.new(.5,-325,.5,-227)
Main.BackgroundColor3 = Color3.fromRGB(12,13,17)
Main.Visible = false
Main.Parent = Gui

Corner(Main,16)
local MainStroke = Stroke(Main,2)

--========================================================
-- HEADER
--========================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1,0,0,65)
Header.BackgroundColor3 = Color3.fromRGB(19,21,27)
Header.Parent = Main

Corner(Header,16)

local Title = NewLabel(
	Header,
	"FFH4X",
	UDim2.fromOffset(260,30),
	UDim2.fromOffset(20,8),
	22
)

Title.TextXAlignment = Enum.TextXAlignment.Left

local SubTitle = NewLabel(
	Header,
	"NFXNOBRU1  •  PAINEL",
	UDim2.fromOffset(260,20),
	UDim2.fromOffset(21,37),
	11
)

SubTitle.TextColor3 = Color3.fromRGB(130,135,145)
SubTitle.TextXAlignment = Enum.TextXAlignment.Left

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(40,40)
Close.Position = UDim2.new(1,-52,0,12)
Close.BackgroundColor3 = Color3.fromRGB(29,31,38)
Close.Text = "×"
Close.TextColor3 = Color3.new(1,1,1)
Close.TextSize = 26
Close.Font = Enum.Font.GothamBold
Close.Parent = Header

Corner(Close,10)

--========================================================
-- DRAG
--========================================================

local Dragging = false
local DragStart
local StartPosition

Header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then

		Dragging = true
		DragStart = input.Position
		StartPosition = Main.Position
	end
end)

Header.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then

		Dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if not Dragging then return end

	if input.UserInputType == Enum.UserInputType.MouseMovement
	or input.UserInputType == Enum.UserInputType.Touch then

		local Delta = input.Position - DragStart

		Main.Position = UDim2.new(
			StartPosition.X.Scale,
			StartPosition.X.Offset + Delta.X,
			StartPosition.Y.Scale,
			StartPosition.Y.Offset + Delta.Y
		)
	end
end)

--========================================================
-- SIDEBAR
--========================================================

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.fromOffset(160,370)
Sidebar.Position = UDim2.fromOffset(10,75)
Sidebar.BackgroundColor3 = Color3.fromRGB(17,19,24)
Sidebar.Parent = Main

Corner(Sidebar,13)

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0,10)
SidePadding.PaddingLeft = UDim.new(0,8)
SidePadding.PaddingRight = UDim.new(0,8)
SidePadding.Parent = Sidebar

local SideLayout = Instance.new("UIListLayout")
SideLayout.Padding = UDim.new(0,7)
SideLayout.Parent = Sidebar

--========================================================
-- CONTENT
--========================================================

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1,-180,1,-75)
Content.Position = UDim2.fromOffset(175,75)
Content.BackgroundColor3 = Color3.fromRGB(17,19,24)
Content.Parent = Main

Corner(Content,13)

local Tabs = {}
local TabButtons = {}

--========================================================
-- CRIAR ABA
--========================================================

local function CreateTab(Name, Icon)

	local Page = Instance.new("ScrollingFrame")
	Page.Name = Name
	Page.Size = UDim2.new(1,-20,1,-20)
	Page.Position = UDim2.fromOffset(10,10)
	Page.BackgroundTransparency = 1
	Page.BorderSizePixel = 0
	Page.ScrollBarThickness = 3
	Page.Visible = false
	Page.CanvasSize = UDim2.new(0,0,0,0)
	Page.Parent = Content

	local Layout = Instance.new("UIListLayout")
	Layout.Padding = UDim.new(0,8)
	Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	Layout.Parent = Page

	local Padding = Instance.new("UIPadding")
	Padding.PaddingTop = UDim.new(0,5)
	Padding.PaddingBottom = UDim.new(0,10)
	Padding.Parent = Page

	Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		Page.CanvasSize = UDim2.fromOffset(
			0,
			Layout.AbsoluteContentSize.Y + 20
		)
	end)

	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1,0,0,45)
	Button.BackgroundColor3 = Color3.fromRGB(24,26,32)
	Button.Text = Icon.."  "..Name
	Button.TextColor3 = Color3.fromRGB(185,188,195)
	Button.TextSize = 13
	Button.Font = Enum.Font.GothamBold
	Button.Parent = Sidebar

	Corner(Button,10)

	Tabs[Name] = Page
	TabButtons[Name] = Button

	Button.MouseButton1Click:Connect(function()

		for TabName,TabPage in pairs(Tabs) do
			TabPage.Visible = false
			TabButtons[TabName].BackgroundColor3 =
				Color3.fromRGB(24,26,32)
			TabButtons[TabName].TextColor3 =
				Color3.fromRGB(185,188,195)
		end

		Page.Visible = true
		Button.BackgroundColor3 =
			Color3.fromRGB(40,105,190)
		Button.TextColor3 = Color3.new(1,1,1)
	end)

	return Page
end

--========================================================
-- TOGGLE
--========================================================

local function CreateToggle(parent,text,callback)

	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1,-5,0,45)
	Button.BackgroundColor3 = Color3.fromRGB(25,27,33)
	Button.Text = text.."   OFF"
	Button.TextColor3 = Color3.fromRGB(220,220,225)
	Button.TextSize = 13
	Button.Font = Enum.Font.GothamBold
	Button.Parent = parent

	Corner(Button,10)

	local Enabled = false

	Button.MouseButton1Click:Connect(function()

		Enabled = not Enabled

		if Enabled then
			Button.Text = text.."   ON"
			Button.BackgroundColor3 =
				Color3.fromRGB(35,105,65)
		else
			Button.Text = text.."   OFF"
			Button.BackgroundColor3 =
				Color3.fromRGB(25,27,33)
		end

		callback(Enabled)
	end)

	return Button
end

--========================================================
-- SLIDER
--========================================================

local function CreateSlider(
	parent,
	title,
	minValue,
	maxValue,
	defaultValue,
	callback
)

	local Container = Instance.new("Frame")
	Container.Size = UDim2.new(1,-5,0,75)
	Container.BackgroundColor3 = Color3.fromRGB(25,27,33)
	Container.Parent = parent

	Corner(Container,10)

	local TitleLabel = NewLabel(
		Container,
		title,
		UDim2.new(1,-90,0,25),
		UDim2.fromOffset(15,7),
		13
	)

	TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

	local ValueLabel = NewLabel(
		Container,
		tostring(defaultValue),
		UDim2.fromOffset(60,25),
		UDim2.new(1,-75,0,7),
		13
	)

	ValueLabel.TextColor3 =
		Color3.fromRGB(90,170,255)

	ValueLabel.TextXAlignment =
		Enum.TextXAlignment.Right

	local Bar = Instance.new("Frame")
	Bar.Size = UDim2.new(1,-30,0,7)
	Bar.Position = UDim2.fromOffset(15,48)
	Bar.BackgroundColor3 = Color3.fromRGB(42,44,50)
	Bar.Parent = Container

	Corner(Bar,5)

	local Fill = Instance.new("Frame")
	Fill.BackgroundColor3 = Color3.fromRGB(55,125,220)
	Fill.Size = UDim2.new(
		(defaultValue-minValue)/(maxValue-minValue),
		0,1,0
	)
	Fill.Parent = Bar

	Corner(Fill,5)

	local Knob = Instance.new("Frame")
	Knob.Size = UDim2.fromOffset(15,15)
	Knob.AnchorPoint = Vector2.new(.5,.5)
	Knob.Position = UDim2.new(
		(defaultValue-minValue)/(maxValue-minValue),
		0,.5,0
	)
	Knob.BackgroundColor3 = Color3.fromRGB(235,235,240)
	Knob.Parent = Bar

	Corner(Knob,20)

	local SliderDragging = false

	local function SetSlider(x)

		local Percent = math.clamp(
			(x-Bar.AbsolutePosition.X) /
			Bar.AbsoluteSize.X,
			0,1
		)

		local Value = math.floor(
			minValue +
			(maxValue-minValue)*Percent
		)

		local Pos =
			(Value-minValue)/(maxValue-minValue)

		Fill.Size =
			UDim2.new(Pos,0,1,0)

		Knob.Position =
			UDim2.new(Pos,0,.5,0)

		ValueLabel.Text = tostring(Value)

		callback(Value)
	end

	Bar.InputBegan:Connect(function(input)

		if input.UserInputType ==
			Enum.UserInputType.MouseButton1
		or input.UserInputType ==
			Enum.UserInputType.Touch then

			SliderDragging = true
			SetSlider(input.Position.X)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)

		if not SliderDragging then return end

		if input.UserInputType ==
			Enum.UserInputType.MouseMovement
		or input.UserInputType ==
			Enum.UserInputType.Touch then

			SetSlider(input.Position.X)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)

		if input.UserInputType ==
			Enum.UserInputType.MouseButton1
		or input.UserInputType ==
			Enum.UserInputType.Touch then

			SliderDragging = false
		end
	end)

	return Container
end

--========================================================
-- SEÇÃO
--========================================================

local function CreateSection(parent,text)

	local Section = NewLabel(
		parent,
		text,
		UDim2.new(1,-5,0,25),
		UDim2.fromOffset(0,0),
		12
	)

	Section.TextColor3 =
		Color3.fromRGB(90,155,235)

	Section.TextXAlignment =
		Enum.TextXAlignment.Left

	return Section
end

--========================================================
-- ABAS
--========================================================

local Combat = CreateTab("COMBATE","⚔")
local ESP = CreateTab("ESP","👁")
local Character = CreateTab("PERSONAGEM","👤")
local Config = CreateTab("CONFIG","⚙")

--========================================================
-- COMBATE
--========================================================

CreateSection(Combat,"MIRA")

CreateToggle(
	Combat,
	"🎯 MODO DE MIRA",
	function(value)
		Settings.CombatMode = value

		-- Conecte aqui a mecânica de mira
		-- do seu próprio jogo.
	end
)

CreateToggle(
	Combat,
	"⭕ FOV CIRCLE",
	function(value)
		Settings.FOVEnabled = value

		-- Indicador visual de FOV
		-- do seu próprio jogo.
	end
)

CreateSlider(
	Combat,
	"🎯 FOV",
	50,
	500,
	200,
	function(value)
		Settings.FOV = value

		-- Use Settings.FOV na mecânica
		-- de FOV do seu próprio jogo.
	end
)

--========================================================
-- ESP
--========================================================

CreateSection(ESP,"VISUALIZAÇÃO")

CreateToggle(ESP,"📦 BOX",function(value)
	Settings.Box = value
end)

CreateToggle(ESP,"📏 LINHA",function(value)
	Settings.Line = value
end)

CreateToggle(ESP,"❤️ VIDA",function(value)
	Settings.Health = value
end)

CreateToggle(ESP,"🏷 NOME",function(value)
	Settings.Name = value
end)

CreateToggle(ESP,"📍 DISTÂNCIA",function(value)
	Settings.Distance = value
end)

CreateToggle(ESP,"🦴 SKELETON",function(value)
	Settings.Skeleton = value
end)

--========================================================
-- PERSONAGEM
--========================================================

CreateSection(Character,"MOVIMENTO")

CreateSlider(
	Character,
	"🏃 VELOCIDADE",
	16,
	100,
	16,
	function(value)

		Settings.WalkSpeed = value

		-- No seu próprio jogo:
		-- Humanoid.WalkSpeed = value
	end
)

CreateToggle(
	Character,
	"🪽 FLY",
	function(value)

		Settings.Fly = value

		-- Ligue/desligue aqui a mecânica
		-- de Fly do seu próprio jogo.
	end
)

CreateSlider(
	Character,
	"🪽 VELOCIDADE DO FLY",
	20,
	150,
	60,
	function(value)

		Settings.FlySpeed = value

		-- Use Settings.FlySpeed
		-- na mecânica de Fly.
	end
)

CreateToggle(
	Character,
	"🌀 SPIN",
	function(value)

		Settings.Spin = value

	end
)

CreateToggle(
	Character,
	"👻 NOCLIP",
	function(value)

		Settings.Noclip = value

		-- Mecânica/admin do seu próprio jogo.
	end
)

--========================================================
-- CONFIG
--========================================================

CreateSection(Config,"AJUSTES")

CreateSlider(
	Config,
	"🏃 VELOCIDADE",
	16,
	100,
	16,
	function(value)
		Settings.WalkSpeed = value
	end
)

CreateSlider(
	Config,
	"🪽 FLY SPEED",
	20,
	150,
	60,
	function(value)
		Settings.FlySpeed = value
	end
)

CreateSlider(
	Config,
	"🎯 FOV",
	50,
	500,
	200,
	function(value)
		Settings.FOV = value
	end
)

CreateToggle(
	Config,
	"✨ RGB DA INTERFACE",
	function(value)
		Settings.RGB = value
	end
)

--========================================================
-- BOTÃO FLUTUANTE
--========================================================

local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.fromOffset(58,58)
OpenButton.Position = UDim2.new(0,20,.5,-29)
OpenButton.BackgroundColor3 = Color3.fromRGB(18,20,25)
OpenButton.Text = "F"
OpenButton.TextColor3 = Color3.new(1,1,1)
OpenButton.TextSize = 23
OpenButton.Font = Enum.Font.GothamBold
OpenButton.Visible = false
OpenButton.Parent = Gui

Corner(OpenButton,15)

local OpenStroke = Stroke(OpenButton,2)

--========================================================
-- ABRIR / FECHAR
--========================================================

Close.MouseButton1Click:Connect(function()
	Main.Visible = false
	OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
	Main.Visible = true
	OpenButton.Visible = false
end)

--========================================================
-- KEY CHECK
--========================================================

local function CheckKey()

	local Input = string.upper(
		KeyBox.Text:gsub("%s+","")
	)

	if ValidKeys[Input] then

		KeyStatus.Text = "KEY CORRETA!"
		KeyStatus.TextColor3 =
			Color3.fromRGB(70,230,120)

		Enter.Text = "CARREGANDO..."

		task.wait(.6)

		KeyFrame.Visible = false
		Main.Visible = true

		Tabs["COMBATE"].Visible = true

		TabButtons["COMBATE"].BackgroundColor3 =
			Color3.fromRGB(40,105,190)

		TabButtons["COMBATE"].TextColor3 =
			Color3.new(1,1,1)

	else

		KeyStatus.Text = "KEY INVÁLIDA!"
		KeyStatus.TextColor3 =
			Color3.fromRGB(255,70,70)

		KeyBox.Text = ""
	end
end

Enter.MouseButton1Click:Connect(CheckKey)

KeyBox.FocusLost:Connect(function(enterPressed)

	if enterPressed then
		CheckKey()
	end

end)

--========================================================
-- RGB
--========================================================

task.spawn(function()

	while Gui.Parent do

		if Settings.RGB then

			local RGB = Color3.fromHSV(
				(tick()*.12)%1,
				.8,
				1
			)

			MainStroke.Color = RGB
			KeyStroke.Color = RGB
			OpenStroke.Color = RGB

		end

		task.wait()
	end

end)

--========================================================
-- START
--========================================================

KeyFrame.Visible = true
Main.Visible = false
OpenButton.Visible = false

print("FFH4X - PAINEL COMPLETO CARREGADO")
```
