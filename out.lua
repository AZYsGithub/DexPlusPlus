local selection
local nodes = {}

local oldgame = game
local game = workspace.Parent
local EmbeddedModules = {
["Console"] = function()
--[[
	Console App Module
	
	Yes this does not exist on original Dex
]]

-- Common Locals
local Main,Lib,Apps,Settings -- Main Containers
local Explorer, Properties, Console, Notebook -- Major Apps
local API,RMD,env,service,plr,create,createSimple -- Main Locals

local function initDeps(data)
	Main = data.Main
	Lib = data.Lib
	Apps = data.Apps
	Settings = data.Settings

	API = data.API
	RMD = data.RMD
	env = data.env
	service = data.service
	plr = data.plr
	create = data.create
	createSimple = data.createSimple
end

local function initAfterMain()
	Explorer = Apps.Explorer
	Properties = Apps.Properties
	Console = Apps.Console
	Notebook = Apps.Notebook
end

local function main()
	local Console = {}

	local window,ConsoleFrame
	
	local OutputLimit = 500 -- Same as Roblox Console.
	
	
	-- Instances: 29 | Scripts: 1 | Modules: 1 | Tags: 0
	local G2L = {};

	-- StarterGui.ScreenGui
	window = Lib.Window.new()
	window:SetTitle("Console")
	window:Resize(500,400)
	Console.Window = window

	-- StarterGui.ScreenGui.Console
	ConsoleFrame = Instance.new("ImageButton", window.GuiElems.Content);
	ConsoleFrame["BorderSizePixel"] = 0;
	ConsoleFrame["AutoButtonColor"] = false;
	ConsoleFrame["BackgroundTransparency"] = 1;
	ConsoleFrame["BackgroundColor3"] = Color3.fromRGB(47, 47, 47);
	ConsoleFrame["Selectable"] = false;
	ConsoleFrame["Size"] = UDim2.new(1,0,1,0);
	ConsoleFrame["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	ConsoleFrame["Name"] = [[Console]];
	ConsoleFrame["Position"] = UDim2.new(0,0,0,0);


	-- StarterGui.ScreenGui.Console.CommandLine
	G2L["3"] = Lib.Frame.new().Gui--Instance.new("Frame", ConsoleFrame);
	G2L["3"].Parent = ConsoleFrame
	G2L["3"]["BorderSizePixel"] = 0;
	G2L["3"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 37);
	G2L["3"]["AnchorPoint"] = Vector2.new(0.5, 1);
	G2L["3"]["ClipsDescendants"] = true;
	G2L["3"]["Size"] = UDim2.new(1, -8, 0, 22);
	G2L["3"]["Position"] = UDim2.new(0.5, 0, 1, -5);
	G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["3"]["Name"] = [[CommandLine]];


	-- StarterGui.ScreenGui.Console.CommandLine.UIStroke
	G2L["4"] = Instance.new("UIStroke", G2L["3"]);
	G2L["4"]["Transparency"] = 0.65;
	G2L["4"]["Thickness"] = 1.25;


	-- StarterGui.ScreenGui.Console.CommandLine.ScrollingFrame
	G2L["5"] = Instance.new("ScrollingFrame", G2L["3"]);
	G2L["5"]["Active"] = true;
	G2L["5"]["ScrollingDirection"] = Enum.ScrollingDirection.X;
	G2L["5"]["BorderSizePixel"] = 0;
	G2L["5"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	G2L["5"]["ElasticBehavior"] = Enum.ElasticBehavior.Never;
	G2L["5"]["TopImage"] = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];
	G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["5"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.Always;
	G2L["5"]["BottomImage"] = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];
	G2L["5"]["AutomaticCanvasSize"] = Enum.AutomaticSize.X;
	G2L["5"]["Size"] = UDim2.new(1, 0, 1, 0);
	G2L["5"]["ScrollBarImageColor3"] = Color3.fromRGB(57, 57, 57);
	G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["5"]["ScrollBarThickness"] = 2;
	G2L["5"]["BackgroundTransparency"] = 1;

	-- StarterGui.ScreenGui.Console.CommandLine.ScrollingFrame.TextBox
	G2L["6"] = Instance.new("TextBox", G2L["5"]);
	G2L["6"]["CursorPosition"] = -1;
	G2L["6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["6"]["PlaceholderColor3"] = Color3.fromRGB(211, 211, 211);
	G2L["6"]["BorderSizePixel"] = 0;
	G2L["6"]["TextSize"] = 13;
	G2L["6"]["TextColor3"] = Color3.fromRGB(211, 211, 211);
	G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["6"]["AutomaticSize"] = Enum.AutomaticSize.X;
	G2L["6"]["ClearTextOnFocus"] = false;
	G2L["6"]["PlaceholderText"] = [[Run a command]];
	G2L["6"]["Size"] = UDim2.new(0, 246, 0, 22);
	G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["6"]["Text"] = [[]];
	G2L["6"]["BackgroundTransparency"] = 1;


	-- StarterGui.ScreenGui.Console.CommandLine.ScrollingFrame.TextBox.UIPadding
	G2L["7"] = Instance.new("UIPadding", G2L["6"]);
	G2L["7"]["PaddingLeft"] = UDim.new(0, 7);


	-- StarterGui.ScreenGui.Console.CommandLine.ScrollingFrame.Highlight
	G2L["8"] = Instance.new("TextLabel", G2L["5"]);
	G2L["8"]["Interactable"] = false;
	G2L["8"]["ZIndex"] = 2;
	G2L["8"]["BorderSizePixel"] = 0;
	G2L["8"]["TextSize"] = 13;
	G2L["8"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["8"]["BackgroundTransparency"] = 1;
	G2L["8"]["RichText"] = true;
	G2L["8"]["Size"] = UDim2.new(0, 246, 0, 22);
	G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["8"]["Text"] = [[]];
	G2L["8"]["Selectable"] = true;
	G2L["8"]["AutomaticSize"] = Enum.AutomaticSize.X;
	G2L["8"]["Name"] = [[Highlight]];


	-- StarterGui.ScreenGui.Console.CommandLine.ScrollingFrame.Highlight.UIPadding
	G2L["9"] = Instance.new("UIPadding", G2L["8"]);
	G2L["9"]["PaddingLeft"] = UDim.new(0, 7);
	
	G2L["backgroundOutput"] = Instance.new("Frame", ConsoleFrame);
	G2L["backgroundOutput"]["BorderSizePixel"] = 0;
	G2L["backgroundOutput"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
	G2L["backgroundOutput"]["Name"] = [[BackgroundOutput]];
	G2L["backgroundOutput"]["AnchorPoint"] = Vector2.new(0, 0);
	G2L["backgroundOutput"]["Size"] = UDim2.new(1, -8, 1, -55);
	G2L["backgroundOutput"]["Position"] = UDim2.new(0, 4, 0, 23);
	G2L["backgroundOutput"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["backgroundOutput"]["ZIndex"] = 1;
	
	local scrollbar = Lib.ScrollBar.new()
	scrollbar.Gui.Parent = ConsoleFrame
	scrollbar.Gui.Size = UDim2.new(0, 16, 1, -55);
	scrollbar.Gui.Position = UDim2.new(1, -20,0, 23);
	scrollbar.Gui.Up.ZIndex = 3
	scrollbar.Gui.Down.ZIndex = 3

	-- StarterGui.ScreenGui.Console.Output
	G2L["a"] = Instance.new("ScrollingFrame", ConsoleFrame);
	G2L["a"]["Active"] = true;
	G2L["a"]["BorderSizePixel"] = 0;
	G2L["a"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	G2L["a"]["TopImage"] = '';
	G2L["a"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
	G2L["a"].BackgroundTransparency = 1
	G2L["a"]["Name"] = [[Output]];
	G2L["a"]["ScrollBarImageTransparency"] = 0;
	G2L["a"]["BottomImage"] = '';
	G2L["a"]["AnchorPoint"] = Vector2.new(0, 0);
	G2L["a"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
	G2L["a"]["Size"] = UDim2.new(1, -8, 1, -55);
	G2L["a"]["Position"] = UDim2.new(0, 4, 0, 23);
	G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["a"].ScrollBarImageColor3 = Color3.fromRGB(70, 70, 70)
	G2L["a"]["ScrollBarThickness"] = 16;
	G2L["a"]["ZIndex"] = 1;

	if Settings.Window.Transparency then
		G2L["a"].BackgroundTransparency = Settings.Window.Transparency
	end

	G2L["a"]:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
		if G2L["a"].AbsoluteCanvasSize ~= G2L["a"].AbsoluteWindowSize then
			scrollbar.Gui.Visible = true
		else
			scrollbar.Gui.Visible = false
		end
	end)

	-- StarterGui.ScreenGui.Console.Output.UIListLayout
	G2L["b"] = Instance.new("UIListLayout", G2L["a"]);
	G2L["b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


	-- StarterGui.ScreenGui.Console.Output.UIStroke
	G2L["c"] = Instance.new("UIStroke", G2L["a"]);
	G2L["c"]["Transparency"] = 0.7;
	G2L["c"]["Thickness"] = 1.25;
	G2L["c"]["Color"] = Color3.fromRGB(12, 12, 12);


	-- StarterGui.ScreenGui.Console.Output.OutputTextSize
	G2L["d"] = Instance.new("NumberValue", G2L["a"]);
	G2L["d"]["Name"] = [[OutputTextSize]];
	G2L["d"]["Value"] = 15;


	-- StarterGui.ScreenGui.Console.Output.OutputLimit
	G2L["e"] = Instance.new("NumberValue", G2L["a"]);
	G2L["e"]["Name"] = [[OutputLimit]];
	G2L["e"]["Value"] = OutputLimit;


	-- StarterGui.ScreenGui.Console.Output.UIPadding
	G2L["f"] = Instance.new("UIPadding", G2L["a"]);
	G2L["f"]["PaddingTop"] = UDim.new(0, 2);


	-- StarterGui.ScreenGui.Console.TextSizeBox
	G2L["10"] = Instance.new("Frame", ConsoleFrame);
	G2L["10"]["BorderSizePixel"] = 0;
	G2L["10"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 37);
	G2L["10"]["ClipsDescendants"] = true;
	G2L["10"]["Size"] = UDim2.new(0, 37, 0, 15);
	G2L["10"]["Position"] = UDim2.new(0, 4, 0, 4);
	G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["10"]["Name"] = [[TextSizeBox]];


	-- StarterGui.ScreenGui.Console.TextSizeBox.TextBox
	G2L["11"] = Instance.new("TextBox", G2L["10"]);
	G2L["11"]["PlaceholderColor3"] = Color3.fromRGB(108, 108, 108);
	G2L["11"]["BorderSizePixel"] = 0;
	G2L["11"]["TextWrapped"] = true;
	G2L["11"]["TextSize"] = 15;
	G2L["11"]["TextColor3"] = Color3.fromRGB(211, 211, 211);
	G2L["11"]["TextScaled"] = true;
	G2L["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["11"]["PlaceholderText"] = [[Size]];
	G2L["11"]["Size"] = UDim2.new(1, 0, 1, 0);
	G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["11"]["Text"] = [[]];
	G2L["11"]["BackgroundTransparency"] = 1;


	-- StarterGui.ScreenGui.Console.TextSizeBox.TextBox.UIPadding
	G2L["12"] = Instance.new("UIPadding", G2L["11"]);
	G2L["12"]["PaddingTop"] = UDim.new(0, 2);
	G2L["12"]["PaddingRight"] = UDim.new(0, 5);
	G2L["12"]["PaddingLeft"] = UDim.new(0, 5);
	G2L["12"]["PaddingBottom"] = UDim.new(0, 2);


	-- StarterGui.ScreenGui.Console.TextSizeBox.UIStroke
	G2L["13"] = Instance.new("UIStroke", G2L["10"]);
	G2L["13"]["Transparency"] = 0.65;
	G2L["13"]["Thickness"] = 1.25;


	-- StarterGui.ScreenGui.Console.Clear
	G2L["14"] = Instance.new("ImageButton", ConsoleFrame);
	G2L["14"]["BorderSizePixel"] = 0;
	G2L["14"]["BackgroundColor3"] = Color3.fromRGB(57, 57, 57);
	G2L["14"]["Size"] = UDim2.new(0, 37, 0, 15);
	G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["14"]["Name"] = [[Clear]];
	G2L["14"]["Position"] = UDim2.new(1, -42, 0, 4);


	-- StarterGui.ScreenGui.Console.Clear.TextLabel
	G2L["15"] = Instance.new("TextLabel", G2L["14"]);
	G2L["15"]["TextWrapped"] = true;
	G2L["15"]["Interactable"] = false;
	G2L["15"]["BorderSizePixel"] = 0;
	G2L["15"]["TextSize"] = 20;
	G2L["15"]["TextScaled"] = true;
	G2L["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["15"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["15"]["BackgroundTransparency"] = 1;
	G2L["15"]["Size"] = UDim2.new(1, 0, 1, 0);
	G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["15"]["Text"] = [[Clear]];


	-- StarterGui.ScreenGui.Console.Clear.UIPadding
	G2L["16"] = Instance.new("UIPadding", G2L["14"]);
	G2L["16"]["PaddingTop"] = UDim.new(0, 1);
	G2L["16"]["PaddingBottom"] = UDim.new(0, 1);


	-- StarterGui.ScreenGui.Console.OutputTemplate
	G2L["17"] = Instance.new("TextBox", ConsoleFrame);
	G2L["17"]["Visible"] = false;
	G2L["17"]["Active"] = false;
	G2L["17"]["Name"] = [[OutputTemplate]];
	G2L["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["17"]["BorderSizePixel"] = 0;
	G2L["17"]["TextEditable"] = false;
	G2L["17"]["TextWrapped"] = true;
	G2L["17"]["TextSize"] = 15;
	G2L["17"]["TextColor3"] = Color3.fromRGB(171, 171, 171);
	G2L["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["17"]["RichText"] = true;
	G2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["17"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	G2L["17"]["Selectable"] = false;
	G2L["17"]["ClearTextOnFocus"] = false;
	G2L["17"]["Size"] = UDim2.new(1, 0, 0, 1);
	G2L["17"]["Position"] = UDim2.new(0, 20, 0, 0);
	G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["17"]["Text"] = [[(timestamp) <font color="rgb(255, 255, 255)">Output</font>]];
	G2L["17"]["BackgroundTransparency"] = 1;


	-- StarterGui.ScreenGui.Console.OutputTemplate.UIPadding
	G2L["18"] = Instance.new("UIPadding", G2L["17"]);
	G2L["18"]["PaddingRight"] = UDim.new(0, 6);
	G2L["18"]["PaddingLeft"] = UDim.new(0, 6);


	-- StarterGui.ScreenGui.Console.CtrlScroll
	G2L["19"] = Instance.new("ImageButton", ConsoleFrame);
	G2L["19"]["BorderSizePixel"] = 0;
	G2L["19"]["BackgroundColor3"] = Color3.fromRGB(57, 57, 57);
	G2L["19"]["Size"] = UDim2.new(0, 60, 0, 15);
	G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["19"]["Name"] = [[CtrlScroll]];
	G2L["19"]["Position"] = UDim2.new(0, 46, 0, 4);


	-- StarterGui.ScreenGui.Console.CtrlScroll.TextLabel
	G2L["1a"] = Instance.new("TextLabel", G2L["19"]);
	G2L["1a"]["TextWrapped"] = true;
	G2L["1a"]["Interactable"] = false;
	G2L["1a"]["BorderSizePixel"] = 0;
	G2L["1a"]["TextSize"] = 20;
	G2L["1a"]["TextScaled"] = true;
	G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["1a"]["BackgroundTransparency"] = 1;
	G2L["1a"]["Size"] = UDim2.new(1, 0, 1, 0);
	G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["1a"]["Text"] = [[Ctrl Scroll]];


	-- StarterGui.ScreenGui.Console.CtrlScroll.UIPadding
	G2L["1b"] = Instance.new("UIPadding", G2L["19"]);
	G2L["1b"]["PaddingTop"] = UDim.new(0, 1);
	G2L["1b"]["PaddingBottom"] = UDim.new(0, 1);


	-- StarterGui.ScreenGui.ConsoleHandler
	G2L["1c"] = Instance.new("LocalScript", G2L["1"]);
	G2L["1c"]["Name"] = [[ConsoleHandler]];


	-- StarterGui.ScreenGui.ConsoleHandler.SyntaxHighlighter
	G2L["1d"] = Instance.new("ModuleScript", G2L["1c"]);
	G2L["1d"]["Name"] = [[SyntaxHighlighter]];
	
	
	-- Require G2L wrapper
	local G2L_REQUIRE = require;
	local G2L_MODULES = {};
	local function require(Module:ModuleScript)
		local ModuleState = G2L_MODULES[Module];
		if ModuleState then
			if not ModuleState.Required then
				ModuleState.Required = true;
				ModuleState.Value = ModuleState.Closure();
			end
			return ModuleState.Value;
		end;
		return G2L_REQUIRE(Module);
	end

	G2L_MODULES[G2L["1d"]] = {
		Closure = function()
			local script = G2L["1d"];local highlighter = {}
			local keywords = {
				lua = {
					"and", "break", "or", "else", "elseif", "if", "then", "until", "repeat", "while", "do", "for", "in", "end",
					"local", "return", "function", "export"
				},
				rbx = {
					"game", "workspace", "script", "math", "string", "table", "task", "wait", "select", "next", "Enum",
					"error", "warn", "tick", "assert", "shared", "loadstring", "tonumber", "tostring", "type",
					"typeof", "unpack", "print", "Instance", "CFrame", "Vector3", "Vector2", "Color3", "UDim", "UDim2", "Ray", "BrickColor",
					"OverlapParams", "RaycastParams", "Axes", "Random", "Region3", "Rect", "TweenInfo",
					"collectgarbage", "not", "utf8", "pcall", "xpcall", "_G", "setmetatable", "getmetatable", "os", "pairs", "ipairs"
				},
				exploit = {
					"hookmetamethod", "hookfunction", "getgc", "filtergc", "Drawing", "getgenv", "getsenv", "getrenv", "getfenv", "setfenv",
					"decompile", "saveinstance", "getrawmetatable", "setrawmetatable", "checkcaller", "cloneref", "clonefunction",
					"iscclosure", "islclosure", "isexecutorclosure", "newcclosure", "getfunctionhash", "crypt", "writefile", "appendfile", "loadfile", "readfile", "listfiles",
					"makefolder", "isfolder", "isfile", "delfile", "delfolder", "getcustomasset", "fireclickdetector", "firetouchinterest", "fireproximityprompt"
				},
				operators = {
					"#", "+", "-", "*", "%", "/", "^", "=", "~", "=", "<", ">", ",", ".", "(", ")", "{", "}", "[", "]", ";", ":"
				}
			}

			local colors = {
				numbers = Color3.fromRGB(255, 198, 0),
				boolean = Color3.fromRGB(255, 198, 0),
				operator = Color3.fromRGB(204, 204, 204),
				lua = Color3.fromRGB(132, 214, 247),
				exploit = Color3.fromRGB(171, 84, 247),
				rbx = Color3.fromRGB(248, 109, 124),
				str = Color3.fromRGB(173, 241, 132),
				comment = Color3.fromRGB(102, 102, 102),
				null = Color3.fromRGB(255, 198, 0),
				call = Color3.fromRGB(253, 251, 172),
				self_call = Color3.fromRGB(253, 251, 172),
				local_color = Color3.fromRGB(248, 109, 115),
				function_color = Color3.fromRGB(248, 109, 115),
				self_color = Color3.fromRGB(248, 109, 115),
				local_property = Color3.fromRGB(97, 161, 241),
			}

			local function createKeywordSet(keywords)
				local keywordSet = {}
				for _, keyword in ipairs(keywords) do
					keywordSet[keyword] = true
				end
				return keywordSet
			end

			local luaSet = createKeywordSet(keywords.lua)
			local exploitSet = createKeywordSet(keywords.exploit)
			local rbxSet = createKeywordSet(keywords.rbx)
			local operatorsSet = createKeywordSet(keywords.operators)

			local function getHighlight(tokens, index)
				local token = tokens[index]

				if colors[token .. "_color"] then
					return colors[token .. "_color"]
				end

				if tonumber(token) then
					return colors.numbers
				elseif token == "nil" then
					return colors.null
				elseif token:sub(1, 2) == "--" then
					return colors.comment
				elseif operatorsSet[token] then
					return colors.operator
				elseif luaSet[token] then
					return colors.rbx
				elseif rbxSet[token] then
					return colors.lua
				elseif exploitSet[token] then
					return colors.exploit
				elseif token:sub(1, 1) == "\"" or token:sub(1, 1) == "\'" then
					return colors.str
				elseif token == "true" or token == "false" then
					return colors.boolean
				end

				if tokens[index + 1] == "(" then
					if tokens[index - 1] == ":" then
						return colors.self_call
					end

					return colors.call
				end

				if tokens[index - 1] == "." then
					if tokens[index - 2] == "Enum" then
						return colors.rbx
					end

					return colors.local_property
				end
			end

			function highlighter.run(source)
				local tokens = {}
				local currentToken = ""

				local inString = false
				local inComment = false
				local commentPersist = false

				for i = 1, #source do
					local character = source:sub(i, i)

					if inComment then
						if character == "\n" and not commentPersist then
							table.insert(tokens, currentToken)
							table.insert(tokens, character)
							currentToken = ""

							inComment = false
						elseif source:sub(i - 1, i) == "]]" and commentPersist then
							currentToken ..= "]"

							table.insert(tokens, currentToken)
							currentToken = ""

							inComment = false
							commentPersist = false
						else
							currentToken = currentToken .. character
						end
					elseif inString then
						if character == inString and source:sub(i-1, i-1) ~= "\\" or character == "\n" then
							currentToken = currentToken .. character
							inString = false
						else
							currentToken = currentToken .. character
						end
					else
						if source:sub(i, i + 1) == "--" then
							table.insert(tokens, currentToken)
							currentToken = "-"
							inComment = true
							commentPersist = source:sub(i + 2, i + 3) == "[["
						elseif character == "\"" or character == "\'" then
							table.insert(tokens, currentToken)
							currentToken = character
							inString = character
						elseif operatorsSet[character] then
							table.insert(tokens, currentToken)
							table.insert(tokens, character)
							currentToken = ""
						elseif character:match("[%w_]") then
							currentToken = currentToken .. character
						else
							table.insert(tokens, currentToken)
							table.insert(tokens, character)
							currentToken = ""
						end
					end
				end

				table.insert(tokens, currentToken)

				local highlighted = {}

				for i, token in ipairs(tokens) do
					local highlight = getHighlight(tokens, i)

					if highlight then
						local syntax = string.format("<font color = \"#%s\">%s</font>", highlight:ToHex(), token:gsub("<", "&lt;"):gsub(">", "&gt;"))

						table.insert(highlighted, syntax)
					else
						table.insert(highlighted, token)
					end
				end

				return table.concat(highlighted)
			end

			return highlighter
		end;
	};
	
	Console.Init = function()
		-- StarterGui.ScreenGui.ConsoleHandler
		local script = G2L["1c"];

		local CtrlScroll = false

		local LogService = game:GetService("LogService")
		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer
		local Mouse = LocalPlayer:GetMouse()
		local UserInputService = game:GetService("UserInputService")
		local RunService = game:GetService("RunService")

		local Console = ConsoleFrame
		local SyntaxHighlightingModule = require(script.SyntaxHighlighter)
		local OutputTextSize = Console.Output.OutputTextSize

		local function Tween(obj, info, prop)
			local tween = game:GetService("TweenService"):Create(obj, info, prop)
			tween:Play()
			return tween
		end



		-- MOUSE STUFFS

		if CtrlScroll == true then
			Console.CtrlScroll.BackgroundColor3 = Color3.fromRGB(11, 90, 175)
		elseif CtrlScroll == false then
			Console.CtrlScroll.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
		end
		Console.CtrlScroll.MouseButton1Click:Connect(function()
			CtrlScroll = not CtrlScroll
			if CtrlScroll == true then
				Console.CtrlScroll.BackgroundColor3 = Color3.fromRGB(11, 90, 175)
			elseif CtrlScroll == false then
				Console.CtrlScroll.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
			end
		end)

		local IsHoldingCTRL = false
		UserInputService.InputBegan:Connect(function(input, gameproc)
			if not gameproc then
				if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
					IsHoldingCTRL = true
				end
			end
		end)
		UserInputService.InputEnded:Connect(function(input, gameproc)
			if not gameproc then
				if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
					IsHoldingCTRL = false
				end
			end
		end)
		-- Console part
		local displayedOutput = {}
		local OutputLimit = Console.Output.OutputLimit

		Console.TextSizeBox.TextBox.Text = tostring(OutputTextSize.Value)

		Console.TextSizeBox.TextBox:GetPropertyChangedSignal("Text"):Connect(function()
			local tonum = tonumber(Console.TextSizeBox.TextBox.Text)
			if tonum then
				OutputTextSize.Value = tonum
			end
		end)
		OutputTextSize:GetPropertyChangedSignal("Value"):Connect(function()
			Console.TextSizeBox.TextBox.Text = tostring(OutputTextSize.Value)
		end)

		local scrollConsoleInput
		Console.Output.MouseEnter:Connect(function()
			scrollConsoleInput = UserInputService.InputChanged:Connect(function(input)
				if CtrlScroll and input.UserInputType == Enum.UserInputType.MouseWheel and IsHoldingCTRL == true then
					Console.Output.ScrollingEnabled = false
					local newTextSize = OutputTextSize.Value + input.Position.Z
					if newTextSize >= 1 then
						OutputTextSize.Value = newTextSize
					end
				else
					Console.Output.ScrollingEnabled = true
				end
			end)
		end)
		Console.Output.MouseLeave:Connect(function()
			if scrollConsoleInput then
				scrollConsoleInput:Disconnect()
				scrollConsoleInput = nil
			end
		end)


		Console.Clear.MouseButton1Click:Connect(function()
			for _, log in pairs(Console.Output:GetChildren()) do
				if log:IsA("TextBox") then
					log:Destroy()
				end
			end
		end)

		local focussedOutput

		LogService.MessageOut:Connect(function(msg, msgtype)
			local formattedText = ""
			local unformattedText = ""
			local newOutputText = Console.OutputTemplate:Clone()
			table.insert(displayedOutput, newOutputText)

			if #displayedOutput > OutputLimit.Value then
				local oldest = table.remove(displayedOutput, 1)
				if oldest and typeof(oldest) == "Instance" then
					oldest:Destroy()
				end
			end

			unformattedText = os.date("%H:%M:%S")..'   '..msg
			if msgtype == Enum.MessageType.MessageOutput then
				formattedText = os.date("%H:%M:%S")..'   <font color="rgb(204, 204, 204)">'..msg..'</font>'
				newOutputText.Text = formattedText
			elseif msgtype == Enum.MessageType.MessageWarning then
				formattedText = os.date("%H:%M:%S")..'   <b><font color="rgb(255, 142, 60)">'..msg..'</font></b>'
				newOutputText.Text = formattedText
			elseif msgtype == Enum.MessageType.MessageError then
				formattedText = os.date("%H:%M:%S")..'   <b><font color="rgb(255, 68, 68)">'..msg..'</font></b>'
				newOutputText.Text = formattedText
			elseif msgtype == Enum.MessageType.MessageInfo then
				formattedText = os.date("%H:%M:%S")..'   <font color="rgb(128, 215, 255)">'..msg..'</font>'
				newOutputText.Text = formattedText
			end

			newOutputText.TextSize = OutputTextSize.Value
			OutputTextSize:GetPropertyChangedSignal("Value"):Connect(function()
				newOutputText.TextSize = OutputTextSize.Value
			end)

			newOutputText.Focused:Connect(function()
				focussedOutput = newOutputText
				newOutputText.Text = unformattedText
			end)
			newOutputText.FocusLost:Connect(function()
				focussedOutput = nil
				newOutputText.Text = formattedText
			end)

			newOutputText.Parent = Console.Output
			newOutputText.Visible = true
		end)

		Console.Output.MouseLeave:Connect(function()
			if focussedOutput then
				focussedOutput:ReleaseFocus()
			end
		end)

		Console.CommandLine.ScrollingFrame.TextBox:GetPropertyChangedSignal("Text"):Connect(function()

			local oneliner = string.gsub(Console.CommandLine.ScrollingFrame.TextBox.Text, "\n", "    ")
			Console.CommandLine.ScrollingFrame.TextBox.Text = oneliner

			Console.CommandLine.ScrollingFrame.Highlight.Text = SyntaxHighlightingModule.run(Console.CommandLine.ScrollingFrame.TextBox.Text)
		end)



		Console.CommandLine.ScrollingFrame.TextBox.FocusLost:Connect(function(enterPressed)
			if enterPressed and Console.CommandLine.ScrollingFrame.TextBox.Text ~= "" then
				print("> "..Console.CommandLine.ScrollingFrame.TextBox.Text)
				loadstring(Console.CommandLine.ScrollingFrame.TextBox.Text)()
			end
		end)
	end

	return Console
end

-- TODO: Remove when open source
if gethsfuncs then
	_G.moduleData = {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
else
	return {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
end
end,
["Explorer"] = function()
--[[
	Explorer App Module
	
	The main explorer interface
]]

-- Common Locals
local Main,Lib,Apps,Settings -- Main Containers
local Explorer, Properties, ScriptViewer, ModelViewer, Notebook -- Major Apps
local API,RMD,env,service,plr,create,createSimple -- Main Locals

local function initDeps(data)
	Main = data.Main
	Lib = data.Lib
	Apps = data.Apps
	Settings = data.Settings

	API = data.API
	RMD = data.RMD
	env = data.env
	service = data.service
	plr = data.plr
	create = data.create
	createSimple = data.createSimple
end

local function initAfterMain()
	Explorer = Apps.Explorer
	Properties = Apps.Properties
	ScriptViewer = Apps.ScriptViewer
	ModelViewer = Apps.ModelViewer
	Notebook = Apps.Notebook
end

local function main()
	local Explorer = {}
	local tree,listEntries,explorerOrders,searchResults,specResults = {},{},{},{},{}
	local expanded
	local entryTemplate,treeFrame,toolBar,descendantAddedCon,descendantRemovingCon,itemChangedCon
	local ffa = game.FindFirstAncestorWhichIsA
	local getDescendants = game.GetDescendants
	local getTextSize = service.TextService.GetTextSize
	local updateDebounce,refreshDebounce = false,false
	local nilNode = {Obj = Instance.new("Folder")}
	local idCounter = 0
	local scrollV,scrollH,clipboard
	local renameBox,renamingNode,searchFunc
	local sortingEnabled,autoUpdateSearch
	local table,math = table,math
	local nilMap,nilCons = {},{}
	local connectSignal = game.DescendantAdded.Connect
	local addObject,removeObject,moveObject = nil,nil,nil

	nodes = nodes or {}

	addObject = function(root)
		if nodes[root] then return end

		local isNil = false
		local rootParObj = ffa(root,"Instance")
		local par = nodes[rootParObj]

		-- Nil Handling
		if not par then
			if nilMap[root] then
				nilCons[root] = nilCons[root] or {
					connectSignal(root.ChildAdded,addObject),
					connectSignal(root.AncestryChanged,moveObject),
				}
				par = nilNode
				isNil = true
			else
				return
			end
		elseif nilMap[rootParObj] or par == nilNode then
			nilMap[root] = true
			nilCons[root] = nilCons[root] or {
				connectSignal(root.ChildAdded,addObject),
				connectSignal(root.AncestryChanged,moveObject),
			}
			isNil = true
		end

		local newNode = {Obj = root, Parent = par}
		nodes[root] = newNode

		-- Automatic sorting if expanded
		if sortingEnabled and expanded[par] and par.Sorted then
			local left,right = 1,#par
			local floor = math.floor
			local sorter = Explorer.NodeSorter
			local pos = (right == 0 and 1)

			if not pos then
				while true do
					if left >= right then
						if sorter(newNode,par[left]) then
							pos = left
						else
							pos = left+1
						end
						break
					end

					local mid = floor((left+right)/2)
					if sorter(newNode,par[mid]) then
						right = mid-1
					else
						left = mid+1
					end
				end
			end

			table.insert(par,pos,newNode)
		else
			par[#par+1] = newNode
			par.Sorted = nil
		end

		local insts = getDescendants(root)
		for i = 1,#insts do
			local obj = insts[i]
			if nodes[obj] then continue end -- Deferred

			local par = nodes[ffa(obj,"Instance")]
			if not par then continue end
			local newNode = {Obj = obj, Parent = par}
			nodes[obj] = newNode
			par[#par+1] = newNode

			-- Nil Handling
			if isNil then
				nilMap[obj] = true
				nilCons[obj] = nilCons[obj] or {
					connectSignal(obj.ChildAdded,addObject),
					connectSignal(obj.AncestryChanged,moveObject),
				}
			end
		end

		if searchFunc and autoUpdateSearch then
			searchFunc({newNode})
		end

		if not updateDebounce and Explorer.IsNodeVisible(par) then
			if expanded[par] then
				Explorer.PerformUpdate()
			elseif not refreshDebounce then
				Explorer.PerformRefresh()
			end
		end
	end

	removeObject = function(root)
		local node = nodes[root]
		if not node then return end

		-- Nil Handling
		if nilMap[node.Obj] then
			moveObject(node.Obj)
			return
		end

		local par = node.Parent
		if par then
			par.HasDel = true
		end

		local function recur(root)
			for i = 1,#root do
				local node = root[i]
				if not node.Del then
					nodes[node.Obj] = nil
					if #node > 0 then recur(node) end
				end
			end
		end
		recur(node)
		node.Del = true
		nodes[root] = nil

		if par and not updateDebounce and Explorer.IsNodeVisible(par) then
			if expanded[par] then
				Explorer.PerformUpdate()
			elseif not refreshDebounce then
				Explorer.PerformRefresh()
			end
		end
	end

	moveObject = function(obj)
		local node = nodes[obj]
		if not node then return end

		local oldPar = node.Parent
		local newPar = nodes[ffa(obj,"Instance")]
		if oldPar == newPar then return end

		-- Nil Handling
		if not newPar then
			if nilMap[obj] then
				newPar = nilNode
			else
				return
			end
		elseif nilMap[newPar.Obj] or newPar == nilNode then
			nilMap[obj] = true
			nilCons[obj] = nilCons[obj] or {
				connectSignal(obj.ChildAdded,addObject),
				connectSignal(obj.AncestryChanged,moveObject),
			}
		end

		if oldPar then
			local parPos = table.find(oldPar,node)
			if parPos then table.remove(oldPar,parPos) end
		end

		node.Id = nil
		node.Parent = newPar

		if sortingEnabled and expanded[newPar] and newPar.Sorted then
			local left,right = 1,#newPar
			local floor = math.floor
			local sorter = Explorer.NodeSorter
			local pos = (right == 0 and 1)

			if not pos then
				while true do
					if left >= right then
						if sorter(node,newPar[left]) then
							pos = left
						else
							pos = left+1
						end
						break
					end

					local mid = floor((left+right)/2)
					if sorter(node,newPar[mid]) then
						right = mid-1
					else
						left = mid+1
					end
				end
			end

			table.insert(newPar,pos,node)
		else
			newPar[#newPar+1] = node
			newPar.Sorted = nil
		end

		if searchFunc and searchResults[node] then
			local currentNode = node.Parent
			while currentNode and (not searchResults[currentNode] or expanded[currentNode] == 0) do
				expanded[currentNode] = true
				searchResults[currentNode] = true
				currentNode = currentNode.Parent
			end
		end

		if not updateDebounce and (Explorer.IsNodeVisible(newPar) or Explorer.IsNodeVisible(oldPar)) then
			if expanded[newPar] or expanded[oldPar] then
				Explorer.PerformUpdate()
			elseif not refreshDebounce then
				Explorer.PerformRefresh()
			end
		end
	end

	Explorer.ViewWidth = 0
	Explorer.Index = 0
	Explorer.EntryIndent = 20
	Explorer.FreeWidth = 32
	Explorer.GuiElems = {}

	Explorer.InitRenameBox = function()
		renameBox = create({{1,"TextBox",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderColor3=Color3.new(0.062745101749897,0.51764708757401,1),BorderMode=2,ClearTextOnFocus=false,Font=3,Name="RenameBox",PlaceholderColor3=Color3.new(0.69803923368454,0.69803923368454,0.69803923368454),Position=UDim2.new(0,26,0,2),Size=UDim2.new(0,200,0,16),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,Visible=false,ZIndex=2}}})

		renameBox.Parent = Explorer.Window.GuiElems.Content.List

		renameBox.FocusLost:Connect(function()
			if not renamingNode then return end

			pcall(function() renamingNode.Obj.Name = renameBox.Text end)
			renamingNode = nil
			Explorer.Refresh()
		end)

		renameBox.Focused:Connect(function()
			renameBox.SelectionStart = 1
			renameBox.CursorPosition = #renameBox.Text + 1
		end)
	end

	Explorer.SetRenamingNode = function(node)
		renamingNode = node
		renameBox.Text = tostring(node.Obj)
		renameBox:CaptureFocus()
		Explorer.Refresh()
	end

	Explorer.SetSortingEnabled = function(val)
		sortingEnabled = val
		Settings.Explorer.Sorting = val
	end

	Explorer.UpdateView = function()
		local maxNodes = math.ceil(treeFrame.AbsoluteSize.Y / 20)
		local maxX = treeFrame.AbsoluteSize.X
		local totalWidth = Explorer.ViewWidth + Explorer.FreeWidth

		scrollV.VisibleSpace = maxNodes
		scrollV.TotalSpace = #tree + 1
		scrollH.VisibleSpace = maxX
		scrollH.TotalSpace = totalWidth

		scrollV.Gui.Visible = #tree + 1 > maxNodes
		scrollH.Gui.Visible = totalWidth > maxX

		local oldSize = treeFrame.Size
		treeFrame.Size = UDim2.new(1,(scrollV.Gui.Visible and -16 or 0),1,(scrollH.Gui.Visible and -39 or -23))
		if oldSize ~= treeFrame.Size then
			Explorer.UpdateView()
		else
			scrollV:Update()
			scrollH:Update()

			renameBox.Size = UDim2.new(0,maxX-100,0,16)

			if scrollV.Gui.Visible and scrollH.Gui.Visible then
				scrollV.Gui.Size = UDim2.new(0,16,1,-39)
				scrollH.Gui.Size = UDim2.new(1,-16,0,16)
				Explorer.Window.GuiElems.Content.ScrollCorner.Visible = true
			else
				scrollV.Gui.Size = UDim2.new(0,16,1,-23)
				scrollH.Gui.Size = UDim2.new(1,0,0,16)
				Explorer.Window.GuiElems.Content.ScrollCorner.Visible = false
			end

			Explorer.Index = scrollV.Index
		end
	end

	Explorer.NodeSorter = function(a,b)
		if a.Del or b.Del then return false end -- Ghost node

		local aClass = a.Class
		local bClass = b.Class
		if not aClass then aClass = a.Obj.ClassName a.Class = aClass end
		if not bClass then bClass = b.Obj.ClassName b.Class = bClass end

		local aOrder = explorerOrders[aClass]
		local bOrder = explorerOrders[bClass]
		if not aOrder then aOrder = RMD.Classes[aClass] and tonumber(RMD.Classes[aClass].ExplorerOrder) or 9999 explorerOrders[aClass] = aOrder end
		if not bOrder then bOrder = RMD.Classes[bClass] and tonumber(RMD.Classes[bClass].ExplorerOrder) or 9999 explorerOrders[bClass] = bOrder end

		if aOrder ~= bOrder then
			return aOrder < bOrder
		else
			local aName,bName = tostring(a.Obj),tostring(b.Obj)
			if aName ~= bName then
				return aName < bName
			elseif aClass ~= bClass then
				return aClass < bClass
			else
				local aId = a.Id if not aId then aId = idCounter idCounter = (idCounter+0.001)%999999999 a.Id = aId end
				local bId = b.Id if not bId then bId = idCounter idCounter = (idCounter+0.001)%999999999 b.Id = bId end
				return aId < bId
			end
		end
	end

	Explorer.Update = function()
		table.clear(tree)
		local maxNameWidth,maxDepth,count = 0,1,1
		local nameCache = {}
		local font = Enum.Font.SourceSans
		local size = Vector2.new(math.huge,20)
		local useNameWidth = Settings.Explorer.UseNameWidth
		local tSort = table.sort
		local sortFunc = Explorer.NodeSorter
		local isSearching = (expanded == Explorer.SearchExpanded)
		local textServ = service.TextService

		local function recur(root,depth)
			if depth > maxDepth then maxDepth = depth end
			depth = depth + 1
			if sortingEnabled and not root.Sorted then
				tSort(root,sortFunc)
				root.Sorted = true
			end
			for i = 1,#root do
				local n = root[i]

				if (isSearching and not searchResults[n]) or n.Del then continue end

				if useNameWidth then
					local nameWidth = n.NameWidth
					if not nameWidth then
						local objName = tostring(n.Obj)
						nameWidth = nameCache[objName]
						if not nameWidth then
							nameWidth = getTextSize(textServ,objName,14,font,size).X
							nameCache[objName] = nameWidth
						end
						n.NameWidth = nameWidth
					end
					if nameWidth > maxNameWidth then
						maxNameWidth = nameWidth
					end
				end

				tree[count] = n
				count = count + 1
				if expanded[n] and #n > 0 then
					recur(n,depth)
				end
			end
		end

		recur(nodes[game],1)

		-- Nil Instances
		if env.getnilinstances then
			if not (isSearching and not searchResults[nilNode]) then
				tree[count] = nilNode
				count = count + 1
				if expanded[nilNode] then
					recur(nilNode,2)
				end
			end
		end

		Explorer.MaxNameWidth = maxNameWidth
		Explorer.MaxDepth = maxDepth
		Explorer.ViewWidth = useNameWidth and Explorer.EntryIndent*maxDepth + maxNameWidth + 26 or Explorer.EntryIndent*maxDepth + 226
		Explorer.UpdateView()
	end

	Explorer.StartDrag = function(offX,offY)
		if Explorer.Dragging then return end
		for i,v in next, selection.List do
			local Obj = v.Obj
			if Obj.Parent == game or Obj:IsA("Player") then
				return
			end
		end
		Explorer.Dragging = true

		local dragTree = treeFrame:Clone()
		dragTree:ClearAllChildren()

		for i,v in pairs(listEntries) do
			local node = tree[i + Explorer.Index]
			if node and selection.Map[node] then
				local clone = v:Clone()
				clone.Active = false
				clone.Indent.Expand.Visible = false
				clone.Parent = dragTree
			end
		end

		local newGui = Instance.new("ScreenGui")
		newGui.DisplayOrder = Main.DisplayOrders.Menu
		dragTree.Parent = newGui
		Lib.ShowGui(newGui)

		local dragOutline = create({
			{1,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="DragSelect",Size=UDim2.new(1,0,1,0),}},
			{2,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0,Name="Line",Parent={1},Size=UDim2.new(1,0,0,1),ZIndex=2,}},
			{3,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0,Name="Line",Parent={1},Position=UDim2.new(0,0,1,-1),Size=UDim2.new(1,0,0,1),ZIndex=2,}},
			{4,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0,Name="Line",Parent={1},Size=UDim2.new(0,1,1,0),ZIndex=2,}},
			{5,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0,Name="Line",Parent={1},Position=UDim2.new(1,-1,0,0),Size=UDim2.new(0,1,1,0),ZIndex=2,}},
		})
		dragOutline.Parent = treeFrame

		local mouse = Main.Mouse or service.Players.LocalPlayer:GetMouse()
		local function move()
			local posX = mouse.X - offX
			local posY = mouse.Y - offY
			dragTree.Position = UDim2.new(0,posX,0,posY)

			for i = 1,#listEntries do
				local entry = listEntries[i]
				if Lib.CheckMouseInGui(entry) then
					dragOutline.Position = UDim2.new(0,entry.Indent.Position.X.Offset-scrollH.Index,0,entry.Position.Y.Offset)
					dragOutline.Size = UDim2.new(0,entry.Size.X.Offset-entry.Indent.Position.X.Offset,0,20)
					dragOutline.Visible = true
					return
				end
			end
			dragOutline.Visible = false
		end
		move()

		local input = service.UserInputService
		local mouseEvent,releaseEvent

		mouseEvent = input.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				move()
			end
		end)

		releaseEvent = input.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				releaseEvent:Disconnect()
				mouseEvent:Disconnect()
				newGui:Destroy()
				dragOutline:Destroy()
				Explorer.Dragging = false

				for i = 1,#listEntries do
					if Lib.CheckMouseInGui(listEntries[i]) then
						local node = tree[i + Explorer.Index]
						if node then
							if selection.Map[node] then return end
							local newPar = node.Obj
							local sList = selection.List
							for i = 1,#sList do
								local n = sList[i]
								pcall(function() n.Obj.Parent = newPar end)
							end
							Explorer.ViewNode(sList[1])
						end
						break
					end
				end
			end
		end)
	end

	Explorer.NewListEntry = function(index)
		local newEntry = entryTemplate:Clone()
		newEntry.Position = UDim2.new(0,0,0,20*(index-1))

		local isRenaming = false

		newEntry.InputBegan:Connect(function(input)
			local node = tree[index + Explorer.Index]
			if not node or selection.Map[node] or (input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch) then return end

			newEntry.Indent.BackgroundColor3 = Settings.Theme.Button
			newEntry.Indent.BorderSizePixel = 0
			newEntry.Indent.BackgroundTransparency = 0
		end)

		newEntry.InputEnded:Connect(function(input)
			local node = tree[index + Explorer.Index]
			if not node or selection.Map[node] or (input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch) then return end

			newEntry.Indent.BackgroundTransparency = 1
		end)

		newEntry.MouseButton1Down:Connect(function()

		end)

		newEntry.MouseButton1Up:Connect(function()

		end)

		newEntry.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				local releaseEvent, mouseEvent

				local mouse = Main.Mouse or plr:GetMouse()
				local startX, startY

				if input.UserInputType == Enum.UserInputType.Touch then
					startX = input.Position.X
					startY = input.Position.Y
				else
					startX = mouse.X
					startY = mouse.Y
				end

				local listOffsetX = startX - treeFrame.AbsolutePosition.X
				local listOffsetY = startY - treeFrame.AbsolutePosition.Y

				releaseEvent = service.UserInputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						releaseEvent:Disconnect()
						mouseEvent:Disconnect()
					end
				end)

				mouseEvent = service.UserInputService.InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						local currentX, currentY

						if input.UserInputType == Enum.UserInputType.Touch then
							currentX = input.Position.X
							currentY = input.Position.Y
						else
							currentX = mouse.X
							currentY = mouse.Y
						end

						local deltaX = currentX - startX
						local deltaY = currentY - startY
						local dist = math.sqrt(deltaX^2 + deltaY^2)

						if dist > 5 then
							releaseEvent:Disconnect()
							mouseEvent:Disconnect()
							isRenaming = false
							Explorer.StartDrag(listOffsetX, listOffsetY)
						end
					end
				end)
			end
		end)

		newEntry.MouseButton2Down:Connect(function()

		end)

		newEntry.Indent.Expand.InputBegan:Connect(function(input)
			local node = tree[index + Explorer.Index]
			if not node or (input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch) then return end

			if input.UserInputType == Enum.UserInputType.Touch then
				Explorer.MiscIcons:DisplayByKey(newEntry.Indent.Expand.Icon, expanded[node] and "Collapse_Over" or "Expand_Over")
			elseif input.UserInputType == Enum.UserInputType.MouseMovement then
				Explorer.MiscIcons:DisplayByKey(newEntry.Indent.Expand.Icon, expanded[node] and "Collapse_Over" or "Expand_Over")
			end
		end)

		newEntry.Indent.Expand.InputEnded:Connect(function(input)
			local node = tree[index + Explorer.Index]
			if not node or (input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch) then return end

			if input.UserInputType == Enum.UserInputType.Touch then
				Explorer.MiscIcons:DisplayByKey(newEntry.Indent.Expand.Icon, expanded[node] and "Collapse" or "Expand")
			elseif input.UserInputType == Enum.UserInputType.MouseMovement then
				Explorer.MiscIcons:DisplayByKey(newEntry.Indent.Expand.Icon, expanded[node] and "Collapse" or "Expand")
			end
		end)

		newEntry.Indent.Expand.MouseButton1Down:Connect(function()
			local node = tree[index + Explorer.Index]
			if not node or #node == 0 then return end

			expanded[node] = not expanded[node]
			Explorer.Update()
			Explorer.Refresh()
		end)

		newEntry.Parent = treeFrame
		return newEntry
	end

	Explorer.Refresh = function()
		local maxNodes = math.max(math.ceil((treeFrame.AbsoluteSize.Y) / 20), 0)	
		local renameNodeVisible = false
		local isa = game.IsA

		for i = 1,maxNodes do
			local entry = listEntries[i]
			if not listEntries[i] then entry = Explorer.NewListEntry(i) listEntries[i] = entry Explorer.ClickSystem:Add(entry) end

			local node = tree[i + Explorer.Index]
			if node then
				local obj = node.Obj
				local depth = Explorer.EntryIndent*Explorer.NodeDepth(node)

				entry.Visible = true
				entry.Position = UDim2.new(0,-scrollH.Index,0,entry.Position.Y.Offset)
				entry.Size = UDim2.new(0,Explorer.ViewWidth,0,20)
				entry.Indent.EntryName.Text = tostring(node.Obj)
				entry.Indent.Position = UDim2.new(0,depth,0,0)
				entry.Indent.Size = UDim2.new(1,-depth,1,0)

				entry.Indent.EntryName.TextTruncate = (Settings.Explorer.UseNameWidth and Enum.TextTruncate.None or Enum.TextTruncate.AtEnd)

				Explorer.MiscIcons:DisplayExplorerIcons(entry.Indent.Icon, obj.ClassName)

				if selection.Map[node] then
					entry.Indent.BackgroundColor3 = Settings.Theme.ListSelection
					entry.Indent.BorderSizePixel = 0
					entry.Indent.BackgroundTransparency = 0
				else
					if Lib.CheckMouseInGui(entry) then
						entry.Indent.BackgroundColor3 = Settings.Theme.Button
					else
						entry.Indent.BackgroundTransparency = 1
					end
				end

				if node == renamingNode then
					renameNodeVisible = true
					renameBox.Position = UDim2.new(0,depth+25-scrollH.Index,0,entry.Position.Y.Offset+2)
					renameBox.Visible = true
				end

				if #node > 0 and expanded[node] ~= 0 then
					if Lib.CheckMouseInGui(entry.Indent.Expand) then
						Explorer.MiscIcons:DisplayByKey(entry.Indent.Expand.Icon, expanded[node] and "Collapse_Over" or "Expand_Over")
					else
						Explorer.MiscIcons:DisplayByKey(entry.Indent.Expand.Icon, expanded[node] and "Collapse" or "Expand")
					end
					entry.Indent.Expand.Visible = true
				else
					entry.Indent.Expand.Visible = false
				end
			else
				entry.Visible = false
			end
		end

		if not renameNodeVisible then
			renameBox.Visible = false
		end

		for i = maxNodes+1, #listEntries do
			Explorer.ClickSystem:Remove(listEntries[i])
			listEntries[i]:Destroy()
			listEntries[i] = nil
		end
	end

	Explorer.PerformUpdate = function(instant)
		updateDebounce = true
		Lib.FastWait(not instant and 0.1)
		if not updateDebounce then return end
		updateDebounce = false
		if not Explorer.Window:IsVisible() then return end
		Explorer.Update()
		Explorer.Refresh()
	end

	Explorer.ForceUpdate = function(norefresh)
		updateDebounce = false
		Explorer.Update()
		if not norefresh then Explorer.Refresh() end
	end

	Explorer.PerformRefresh = function()
		refreshDebounce = true
		Lib.FastWait(0.1)
		refreshDebounce = false
		if updateDebounce or not Explorer.Window:IsVisible() then return end
		Explorer.Refresh()
	end

	Explorer.IsNodeVisible = function(node)
		if not node then return end

		local curNode = node.Parent
		while curNode do
			if not expanded[curNode] then return false end
			curNode = curNode.Parent
		end
		return true
	end

	Explorer.NodeDepth = function(node)
		local depth = 0

		if node == nilNode then
			return 1
		end

		local curNode = node.Parent
		while curNode do
			if curNode == nilNode then depth = depth + 1 end
			curNode = curNode.Parent
			depth = depth + 1
		end
		return depth
	end

	Explorer.SetupConnections = function()
		if descendantAddedCon then descendantAddedCon:Disconnect() end
		if descendantRemovingCon then descendantRemovingCon:Disconnect() end
		if itemChangedCon then itemChangedCon:Disconnect() end

		if Main.Elevated then
			descendantAddedCon = game.DescendantAdded:Connect(addObject)
			descendantRemovingCon = game.DescendantRemoving:Connect(removeObject)
		else
			descendantAddedCon = game.DescendantAdded:Connect(function(obj) pcall(addObject,obj) end)
			descendantRemovingCon = game.DescendantRemoving:Connect(function(obj) pcall(removeObject,obj) end)
		end

		if Settings.Explorer.UseNameWidth then
			itemChangedCon = game.ItemChanged:Connect(function(obj,prop)
				if prop == "Parent" and nodes[obj] then
					moveObject(obj)
				elseif prop == "Name" and nodes[obj] then
					nodes[obj].NameWidth = nil
				end
			end)
		else
			itemChangedCon = game.ItemChanged:Connect(function(obj,prop)
				if prop == "Parent" and nodes[obj] then
					moveObject(obj)
				end
			end)
		end
	end

	Explorer.ViewNode = function(node)
		if not node then return end

		Explorer.MakeNodeVisible(node)
		Explorer.ForceUpdate(true)
		local visibleSpace = scrollV.VisibleSpace

		for i,v in next,tree do
			if v == node then
				local relative = i - 1
				if Explorer.Index > relative then
					scrollV.Index = relative
				elseif Explorer.Index + visibleSpace - 1 <= relative then
					scrollV.Index = relative - visibleSpace + 2
				end
			end
		end

		scrollV:Update() Explorer.Index = scrollV.Index
		Explorer.Refresh()
	end

	Explorer.ViewObj = function(obj)
		Explorer.ViewNode(nodes[obj])
	end

	Explorer.MakeNodeVisible = function(node,expandRoot)
		if not node then return end

		local hasExpanded = false

		if expandRoot and not expanded[node] then
			expanded[node] = true
			hasExpanded = true
		end

		local currentNode = node.Parent
		while currentNode do
			hasExpanded = true
			expanded[currentNode] = true
			currentNode = currentNode.Parent
		end

		if hasExpanded and not updateDebounce then
			coroutine.wrap(Explorer.PerformUpdate)(true)
		end
	end

	Explorer.ShowRightClick = function(MousePos)
		local Mouse = MousePos or Main.Mouse
		local context = Explorer.RightClickContext
		local absoluteSize = context.Gui.AbsoluteSize
		context.MaxHeight = (absoluteSize.Y <= 600 and (absoluteSize.Y - 40)) or nil
		context:Clear()

		local sList = selection.List
		local sMap = selection.Map
		local emptyClipboard = #clipboard == 0
		local presentClasses = {}
		local apiClasses = API.Classes

		for i = 1, #sList do
			local node = sList[i]
			local class = node.Class
			local obj = node.Obj

			if not presentClasses.isViableDecompileScript then
				presentClasses.isViableDecompileScript = env.isViableDecompileScript(obj)
			end
			if not class then
				class = obj.ClassName
				node.Class = class
			end

			local curClass = apiClasses[class]
			while curClass and not presentClasses[curClass.Name] do
				presentClasses[curClass.Name] = true
				curClass = curClass.Superclass
			end
		end

		context:AddRegistered("CUT")
		context:AddRegistered("COPY")
		context:AddRegistered("PASTE", emptyClipboard)
		context:AddRegistered("DUPLICATE")
		context:AddRegistered("DELETE")
		context:AddRegistered("RENAME", #sList ~= 1)

		context:AddDivider()
		context:AddRegistered("GROUP")
		context:AddRegistered("UNGROUP")
		context:AddRegistered("SELECT_CHILDREN")
		context:AddRegistered("JUMP_TO_PARENT")
		context:AddRegistered("EXPAND_ALL")
		context:AddRegistered("COLLAPSE_ALL")

		context:AddDivider()

		if expanded == Explorer.SearchExpanded then context:AddRegistered("CLEAR_SEARCH_AND_JUMP_TO") end
		if env.setclipboard then context:AddRegistered("COPY_PATH") end
		context:AddRegistered("INSERT_OBJECT")
		context:AddRegistered("SAVE_INST")
		-- context:AddRegistered("CALL_FUNCTION")
		-- context:AddRegistered("VIEW_CONNECTIONS")
		-- context:AddRegistered("GET_REFERENCES")
		context:AddRegistered("COPY_API_PAGE")

		context:QueueDivider()

		if presentClasses["BasePart"] or presentClasses["Model"] then
			context:AddRegistered("TELEPORT_TO")
			context:AddRegistered("VIEW_MODEL")
			context:AddRegistered("SPECTATE_OBJECT")
		end
		if presentClasses["Tween"] then context:AddRegistered("PLAY_TWEEN") end
		if presentClasses["Animation"] then
			context:AddRegistered("LOAD_ANIMATION")
			context:AddRegistered("STOP_ANIMATION")
		end

		if presentClasses["TouchTransmitter"] then context:AddRegistered("FIRE_TOUCHTRANSMITTER", firetouchinterest == nil) end
		if presentClasses["ClickDetector"] then context:AddRegistered("FIRE_CLICKDETECTOR", fireclickdetector == nil) end
		if presentClasses["ProximityPrompt"] then context:AddRegistered("FIRE_PROXIMITYPROMPT", fireproximityprompt == nil) end

		if presentClasses["Player"] then context:AddRegistered("SELECT_CHARACTER")context:AddRegistered("VIEW_PLAYER") end
		if presentClasses["Players"] then
			context:AddRegistered("SELECT_LOCAL_PLAYER")
			context:AddRegistered("SELECT_ALL_CHARACTERS")
		end

		if presentClasses["LuaSourceContainer"] then
			context:AddRegistered("VIEW_SCRIPT", not presentClasses.isViableDecompileScript or env.decompile == nil)
			context:AddRegistered("DUMP_FUNCTIONS", not presentClasses.isViableDecompileScript or env.decompile == nil)
			context:AddRegistered("SAVE_SCRIPT", not presentClasses.isViableDecompileScript or env.decompile == nil or env.writefile == nil)
			context:AddRegistered("SAVE_BYTECODE", not presentClasses.isViableDecompileScript or env.getscriptbytecode == nil or env.writefile == nil)

		end

		if sMap[nilNode] then
			context:AddRegistered("REFRESH_NIL")
			context:AddRegistered("HIDE_NIL")
		end

		Explorer.LastRightClickX, Explorer.LastRightClickY = Mouse.X, Mouse.Y
		context:Show(Mouse.X, Mouse.Y)
	end

	Explorer.InitRightClick = function()
		local context = Lib.ContextMenu.new()

		context:Register("CUT",{Name = "Cut", IconMap = Explorer.MiscIcons, Icon = "Cut", DisabledIcon = "Cut_Disabled", Shortcut = "Ctrl+Z", OnClick = function()
			local destroy,clone = game.Destroy,game.Clone
			local sList,newClipboard = selection.List,{}
			local count = 1
			for i = 1,#sList do
				local inst = sList[i].Obj
				local s,cloned = pcall(clone,inst)
				if s and cloned then
					newClipboard[count] = cloned
					count = count + 1
				end
				pcall(destroy,inst)
			end
			clipboard = newClipboard
			selection:Clear()
		end})

		context:Register("COPY",{Name = "Copy", IconMap = Explorer.MiscIcons, Icon = "Copy", DisabledIcon = "Copy_Disabled", Shortcut = "Ctrl+C", OnClick = function()
			local clone = game.Clone
			local sList,newClipboard = selection.List,{}
			local count = 1
			for i = 1,#sList do
				local inst = sList[i].Obj
				local s,cloned = pcall(clone,inst)
				if s and cloned then
					newClipboard[count] = cloned
					count = count + 1
				end
			end
			clipboard = newClipboard
		end})

		context:Register("PASTE",{Name = "Paste Into", IconMap = Explorer.MiscIcons, Icon = "Paste", DisabledIcon = "Paste_Disabled", Shortcut = "Ctrl+Shift+V", OnClick = function()
			local sList = selection.List
			local newSelection = {}
			local count = 1
			for i = 1,#sList do
				local node = sList[i]
				local inst = node.Obj
				Explorer.MakeNodeVisible(node,true)
				for c = 1,#clipboard do
					local cloned = clipboard[c]:Clone()
					if cloned then
						cloned.Parent = inst
						local clonedNode = nodes[cloned]
						if clonedNode then newSelection[count] = clonedNode count = count + 1 end
					end
				end
			end
			selection:SetTable(newSelection)

			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			end
		end})

		context:Register("DUPLICATE",{Name = "Duplicate", IconMap = Explorer.MiscIcons, Icon = "Copy", DisabledIcon = "Copy_Disabled", Shortcut = "Ctrl+D", OnClick = function()
			local clone = game.Clone
			local sList = selection.List
			local newSelection = {}
			local count = 1
			for i = 1,#sList do
				local node = sList[i]
				local inst = node.Obj
				local instPar = node.Parent and node.Parent.Obj
				Explorer.MakeNodeVisible(node)
				local s,cloned = pcall(clone,inst)
				if s and cloned then
					cloned.Parent = instPar
					local clonedNode = nodes[cloned]
					if clonedNode then newSelection[count] = clonedNode count = count + 1 end
				end
			end

			selection:SetTable(newSelection)
			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			end
		end})

		context:Register("DELETE",{Name = "Delete", IconMap = Explorer.MiscIcons, Icon = "Delete", DisabledIcon = "Delete_Disabled", Shortcut = "Del", OnClick = function()
			local destroy = game.Destroy
			local sList = selection.List
			for i = 1,#sList do
				pcall(destroy,sList[i].Obj)
			end
			selection:Clear()
		end})

		context:Register("RENAME",{Name = "Rename", IconMap = Explorer.MiscIcons, Icon = "Rename", DisabledIcon = "Rename_Disabled", Shortcut = "F2", OnClick = function()
			local sList = selection.List
			if sList[1] then
				Explorer.SetRenamingNode(sList[1])
			end
		end})

		context:Register("GROUP",{Name = "Group", IconMap = Explorer.MiscIcons, Icon = "Group", DisabledIcon = "Group_Disabled", Shortcut = "Ctrl+G", OnClick = function()
			local sList = selection.List
			if #sList == 0 then return end

			local model = Instance.new("Model",sList[#sList].Obj.Parent)
			for i = 1,#sList do
				pcall(function() sList[i].Obj.Parent = model end)
			end

			if nodes[model] then
				selection:Set(nodes[model])
				Explorer.ViewNode(nodes[model])
			end
		end})

		context:Register("UNGROUP",{Name = "Ungroup", IconMap = Explorer.MiscIcons, Icon = "Ungroup", DisabledIcon = "Ungroup_Disabled", Shortcut = "Ctrl+U", OnClick = function()
			local newSelection = {}
			local count = 1
			local isa = game.IsA

			local function ungroup(node)
				local par = node.Parent.Obj
				local ch = {}
				local chCount = 1

				for i = 1,#node do
					local n = node[i]
					newSelection[count] = n
					ch[chCount] = n
					count = count + 1
					chCount = chCount + 1
				end

				for i = 1,#ch do
					pcall(function() ch[i].Obj.Parent = par end)
				end

				node.Obj:Destroy()
			end

			for i,v in next,selection.List do
				if isa(v.Obj,"Model") then
					ungroup(v)
				end
			end

			selection:SetTable(newSelection)
			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			end
		end})

		context:Register("SELECT_CHILDREN",{Name = "Select Children", IconMap = Explorer.MiscIcons, Icon = "SelectChildren", DisabledIcon = "SelectChildren_Disabled", OnClick = function()
			local newSelection = {}
			local count = 1
			local sList = selection.List

			for i = 1,#sList do
				local node = sList[i]
				for ind = 1,#node do
					local cNode = node[ind]
					if ind == 1 then Explorer.MakeNodeVisible(cNode) end

					newSelection[count] = cNode
					count = count + 1
				end
			end

			selection:SetTable(newSelection)
			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			else
				Explorer.Refresh()
			end
		end})

		context:Register("JUMP_TO_PARENT",{Name = "Jump to Parent", IconMap = Explorer.MiscIcons, Icon = "JumpToParent", OnClick = function()
			local newSelection = {}
			local count = 1
			local sList = selection.List

			for i = 1,#sList do
				local node = sList[i]
				if node.Parent then
					newSelection[count] = node.Parent
					count = count + 1
				end
			end

			selection:SetTable(newSelection)
			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			else
				Explorer.Refresh()
			end
		end})

		context:Register("TELEPORT_TO",{Name = "Teleport To", IconMap = Explorer.MiscIcons, Icon = "TeleportTo", OnClick = function()
			local sList = selection.List
			local plrRP = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")

			if not plrRP then return end

			for _,node in next, sList do
				local Obj = node.Obj

				if Obj:IsA("BasePart") then
					if Obj.CanCollide then
						plr.Character:MoveTo(Obj.Position)
					else
						plrRP.CFrame = CFrame.new(Obj.Position + Settings.Explorer.TeleportToOffset)
					end
					break
				elseif Obj:IsA("Model") then
					if Obj.PrimaryPart then
						if Obj.PrimaryPart.CanCollide then
							plr.Character:MoveTo(Obj.PrimaryPart.Position)
						else
							plrRP.CFrame = CFrame.new(Obj.PrimaryPart.Position + Settings.Explorer.TeleportToOffset)
						end
						break
					else
						local part = Obj:FindFirstChildWhichIsA("BasePart", true)
						if part and nodes[part] then
							if part.CanCollide then
								plr.Character:MoveTo(part.Position)
							else
								plrRP.CFrame = CFrame.new(part.Position + Settings.Explorer.TeleportToOffset)
							end
							break
						elseif Obj.WorldPivot then
							plrRP.CFrame = Obj.WorldPivot
						end
					end
				end
			end
		end})

		local OldAnimation
		context:Register("PLAY_TWEEN",{Name = "Play Tween", IconMap = Explorer.MiscIcons, Icon = "Play", OnClick = function()
			local sList = selection.List

			for i = 1, #sList do
				local node = sList[i]
				local Obj = node.Obj

				if Obj:IsA("Tween") then Obj:Play() end
			end
		end})

		local OldAnimation
		context:Register("LOAD_ANIMATION",{Name = "Load Animation", IconMap = Explorer.MiscIcons, Icon = "Play", OnClick = function()
			local sList = selection.List

			local Humanoid = plr.Character and plr.Character:FindFirstChild("Humanoid")
			if not Humanoid then return end

			for i = 1, #sList do
				local node = sList[i]
				local Obj = node.Obj

				if Obj:IsA("Animation") then
					if OldAnimation then OldAnimation:Stop() end
					OldAnimation = Humanoid:LoadAnimation(Obj)
					OldAnimation:Play()
					break
				end
			end
		end})

		context:Register("STOP_ANIMATION",{Name = "Stop Animation", IconMap = Explorer.MiscIcons, Icon = "Pause", OnClick = function()
			local sList = selection.List

			local Humanoid = plr.Character and plr.Character:FindFirstChild("Humanoid")
			if not Humanoid then return end

			for i = 1, #sList do
				local node = sList[i]
				local Obj = node.Obj

				if Obj:IsA("Animation") then
					if OldAnimation then OldAnimation:Stop() end
					Humanoid:LoadAnimation(Obj):Stop()
					break
				end
			end
		end})

		context:Register("EXPAND_ALL",{Name = "Expand All", OnClick = function()
			local sList = selection.List

			local function expand(node)
				expanded[node] = true
				for i = 1,#node do
					if #node[i] > 0 then
						expand(node[i])
					end
				end
			end

			for i = 1,#sList do
				expand(sList[i])
			end

			Explorer.ForceUpdate()
		end})

		context:Register("COLLAPSE_ALL",{Name = "Collapse All", OnClick = function()
			local sList = selection.List

			local function expand(node)
				expanded[node] = nil
				for i = 1,#node do
					if #node[i] > 0 then
						expand(node[i])
					end
				end
			end

			for i = 1,#sList do
				expand(sList[i])
			end

			Explorer.ForceUpdate()
		end})

		context:Register("CLEAR_SEARCH_AND_JUMP_TO",{Name = "Clear Search and Jump to", OnClick = function()
			local newSelection = {}
			local count = 1
			local sList = selection.List

			for i = 1,#sList do
				newSelection[count] = sList[i]
				count = count + 1
			end

			selection:SetTable(newSelection)
			Explorer.ClearSearch()
			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			end
		end})

		-- this code is very bad but im lazy and it works so cope
		local clth = function(str)
			if str:sub(1, 28) == "game:GetService(\"Workspace\")" then str = str:gsub("game:GetService%(\"Workspace\"%)", "workspace", 1) end
			if str:sub(1, 27 + #plr.Name) == "game:GetService(\"Players\")." .. plr.Name then str = str:gsub("game:GetService%(\"Players\"%)." .. plr.Name, "game:GetService(\"Players\").LocalPlayer", 1) end
			return str
		end

		context:Register("COPY_PATH",{Name = "Copy Path", IconMap = Explorer.ClassIcons, Icon = 50, OnClick = function()
			local sList = selection.List
			if #sList == 1 then
				env.setclipboard(clth(Explorer.GetInstancePath(sList[1].Obj)))
			elseif #sList > 1 then
				local resList = {"{"}
				local count = 2
				for i = 1,#sList do
					local path = "\t"..clth(Explorer.GetInstancePath(sList[i].Obj))..","
					if #path > 0 then
						resList[count] = path
						count = count+1
					end
				end
				resList[count] = "}"
				env.setclipboard(table.concat(resList,"\n"))
			end
		end})

		context:Register("INSERT_OBJECT",{Name = "Insert Object", IconMap = Explorer.MiscIcons, Icon = "InsertObject", OnClick = function()
			local mouse = Main.Mouse
			local x,y = Explorer.LastRightClickX or mouse.X, Explorer.LastRightClickY or mouse.Y
			Explorer.InsertObjectContext:Show(x,y)
		end})

		--[[context:Register("CALL_FUNCTION",{Name = "Call Function", IconMap = Explorer.ClassIcons, Icon = 66, OnClick = function()

		end})

		context:Register("GET_REFERENCES",{Name = "Get Lua References", IconMap = Explorer.ClassIcons, Icon = 34, OnClick = function()

		end})]]

		context:Register("SAVE_INST",{Name = "Save to File", IconMap = Explorer.MiscIcons, Icon = "Save", OnClick = function()
			local sList = selection.List
			if #sList == 1 then
				env.saveinstance(sList[1].Obj, "Place_"..game.PlaceId.."_"..sList[1].Obj.ClassName.."_"..sList[1].Obj.Name.."_"..os.time(), {
					Decompile = true
				})
			elseif #sList > 1 then
				for i = 1,#sList do
					-- sList[i].Obj.Name.." ("..sList[1].Obj.ClassName..")"
					-- "Place_"..game.PlaceId.."_"..sList[1].Obj.ClassName.."_"..sList[i].Obj.Name.."_"..os.time()

					env.saveinstance(sList[i].Obj, "Place_"..game.PlaceId.."_"..sList[i].Obj.ClassName.."_"..sList[i].Obj.Name.."_"..os.time(), {
						Decompile = true
					})
					task.wait(0.1)
				end
			end
		end})

        --[[context:Register("VIEW_CONNECTIONS",{Name = "View Connections", OnClick = function()
            
        end})]]

		context:Register("COPY_API_PAGE",{Name = "Copy Roblox API Page URL", IconMap = Explorer.MiscIcons, Icon = "Reference", OnClick = function()
			local sList = selection.List
			if #sList == 1 then
				env.setclipboard(
					"https://create.roblox.com/docs/reference/engine/classes/"..sList[1].Obj.ClassName
				)
			end
		end})

		context:Register("SPECTATE_OBJECT",{Name = "Spectate Object (Right click to reset)", IconMap = Explorer.ClassIcons, Icon = 5, OnClick = function()
			local sList = selection.List
			local isa = game.IsA

			for i = 1,#sList do
				local node = sList[i]

				if isa(node.Obj,"BasePart") or isa(node.Obj,"Model") then
					workspace.CurrentCamera.CameraSubject = node.Obj
					break
				end
			end
		end, OnRightClick = function()
			workspace.CurrentCamera.CameraSubject = plr.Character
		end})

		context:Register("VIEW_MODEL",{Name = "View Model", IconMap = Explorer.ClassIcons, Icon = 5, OnClick = function()
			local sList = selection.List
			local isa = game.IsA
			
			if #sList == 1 then
				if isa(sList[1].Obj,"BasePart") or isa(sList[1].Obj,"Model") then
					ModelViewer.ViewModel(sList[1].Obj)
					return
				end
			end
		end})

		context:Register("VIEW_SCRIPT",{Name = "View Script", IconMap = Explorer.MiscIcons, Icon = "ViewScript", OnClick = function()
			local scr = selection.List[1] and selection.List[1].Obj
			if scr then ScriptViewer.ViewScript(scr) end
		end})
		context:Register("DUMP_FUNCTIONS",{Name = "Dump Functions", IconMap = Explorer.MiscIcons, Icon = "ViewScript", OnClick = function()
			local scr = selection.List[1] and selection.List[1].Obj
			if scr then ScriptViewer.DumpFunctions(scr) end
		end})

		context:Register("FIRE_TOUCHTRANSMITTER",{Name = "Fire TouchTransmitter", IconMap = Explorer.ClassIcons, Icon = 37, OnClick = function()
			local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
			if not hrp then return end
			for _, v in ipairs(selection.List) do if v.Obj and v.Obj:IsA("TouchTransmitter") then firetouchinterest(hrp, v.Obj.Parent, 0) end end
		end})

		context:Register("FIRE_CLICKDETECTOR",{Name = "Fire ClickDetector", IconMap = Explorer.ClassIcons, Icon = 41, OnClick = function()
			local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
			if not hrp then return end
			for _, v in ipairs(selection.List) do if v.Obj and v.Obj:IsA("ClickDetector") then fireclickdetector(v.Obj) end end
		end})

		context:Register("FIRE_PROXIMITYPROMPT",{Name = "Fire ProximityPrompt", IconMap = Explorer.ClassIcons, Icon = 124, OnClick = function()
			local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
			if not hrp then return end
			for _, v in ipairs(selection.List) do if v.Obj and v.Obj:IsA("ProximityPrompt") then fireproximityprompt(v.Obj) end end
		end})

		context:Register("VIEW_SCRIPT",{Name = "View Script", IconMap = Explorer.MiscIcons, Icon = "ViewScript", OnClick = function()
			local scr = selection.List[1] and selection.List[1].Obj
			if scr then ScriptViewer.ViewScript(scr) end
		end})

		context:Register("SAVE_SCRIPT",{Name = "Save Script", IconMap = Explorer.MiscIcons, Icon = "Save", OnClick = function()
			for _, v in next, selection.List do
				if v.Obj:IsA("LuaSourceContainer") and env.isViableDecompileScript(v.Obj) then
					local success, source = pcall(env.decompile, v.Obj)
					if not success or not source then source = ("-- DEX - %s failed to decompile %s"):format(env.executor, v.Obj.ClassName) end
					local fileName = ("%i.%s.%s.Source.txt"):format(game.PlaceId, v.Obj.ClassName, env.parsefile(v.Obj.Name))
					env.writefile(fileName, source)
					task.wait(0.2)
				end
			end
		end})

		context:Register("SAVE_BYTECODE",{Name = "Save Script Bytecode", IconMap = Explorer.MiscIcons, Icon = "Save", OnClick = function()
			for _, v in next, selection.List do
				if v.Obj:IsA("LuaSourceContainer") and env.isViableDecompileScript(v.Obj) then
					local success, bytecode = pcall(getscriptbytecode, v.Obj)
					if success and type(bytecode) == "string" then
						local fileName = ("%i.%s.%s.Bytecode.txt"):format(game.PlaceId, v.Obj.ClassName, env.parsefile(v.Obj.Name))
						env.writefile(fileName, bytecode)
						task.wait(0.2)
					end
				end
			end
		end})

		context:Register("SELECT_CHARACTER",{Name = "Select Character", IconMap = Explorer.ClassIcons, Icon = 9, OnClick = function()
			local newSelection = {}
			local count = 1
			local sList = selection.List
			local isa = game.IsA

			for i = 1,#sList do
				local node = sList[i]
				if isa(node.Obj,"Player") and nodes[node.Obj.Character] then
					newSelection[count] = nodes[node.Obj.Character]
					count = count + 1
				end
			end

			selection:SetTable(newSelection)
			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			else
				Explorer.Refresh()
			end
		end})

		context:Register("VIEW_PLAYER",{Name = "View Player", IconMap = Explorer.ClassIcons, Icon = 5, OnClick = function()
			local newSelection = {}
			local count = 1
			local sList = selection.List
			local isa = game.IsA

			for i = 1,#sList do
				local node = sList[i]
				local Obj = node.Obj
				if Obj:IsA("Player") and Obj.Character then
					workspace.CurrentCamera.CameraSubject = Obj.Character
					break
				end
			end
		end})

		context:Register("SELECT_LOCAL_PLAYER",{Name = "Select Local Player", IconMap = Explorer.ClassIcons, Icon = 9, OnClick = function()
			pcall(function() if nodes[plr] then selection:Set(nodes[plr]) Explorer.ViewNode(nodes[plr]) end end)
		end})

		context:Register("SELECT_ALL_CHARACTERS",{Name = "Select All Characters", IconMap = Explorer.ClassIcons, Icon = 2, OnClick = function()
			local newSelection = {}
			local sList = selection.List

			for i,v in next, service.Players:GetPlayers() do
				if v.Character and nodes[v.Character] then
					if i == 1 then Explorer.MakeNodeVisible(v.Character) end
					table.insert(newSelection, nodes[v.Character])
				end
			end

			selection:SetTable(newSelection)
			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			else
				Explorer.Refresh()
			end
		end})

		context:Register("REFRESH_NIL",{Name = "Refresh Nil Instances", OnClick = function()
			Explorer.RefreshNilInstances()
		end})

		context:Register("HIDE_NIL",{Name = "Hide Nil Instances", OnClick = function()
			Explorer.HideNilInstances()
		end})

		Explorer.RightClickContext = context
	end

	Explorer.HideNilInstances = function()
		table.clear(nilMap)

		local disconnectCon = Instance.new("Folder").ChildAdded:Connect(function() end).Disconnect
		for i,v in next,nilCons do
			disconnectCon(v[1])
			disconnectCon(v[2])
		end
		table.clear(nilCons)

		for i = 1,#nilNode do
			coroutine.wrap(removeObject)(nilNode[i].Obj)
		end

		Explorer.Update()
		Explorer.Refresh()
	end

	Explorer.RefreshNilInstances = function()
		if not env.getnilinstances then return end

		local nilInsts = env.getnilinstances()
		local game = game
		local getDescs = game.GetDescendants
		--local newNilMap = {}
		--local newNilRoots = {}
		--local nilRoots = Explorer.NilRoots
		--local connect = game.DescendantAdded.Connect
		--local disconnect
		--if not nilRoots then nilRoots = {} Explorer.NilRoots = nilRoots end

		for i = 1,#nilInsts do
			local obj = nilInsts[i]
			if obj ~= game then
				nilMap[obj] = true
				--newNilRoots[obj] = true

				local descs = getDescs(obj)
				for j = 1,#descs do
					nilMap[descs[j]] = true
				end
			end
		end

		-- Remove unmapped nil nodes
		--[[for i = 1,#nilNode do
			local node = nilNode[i]
			if not newNilMap[node.Obj] then
				nilMap[node.Obj] = nil
				coroutine.wrap(removeObject)(node)
			end
		end]]

		--nilMap = newNilMap

		for i = 1,#nilInsts do
			local obj = nilInsts[i]
			local node = nodes[obj]
			if not node then coroutine.wrap(addObject)(obj) end
		end

		--[[
		-- Remove old root connections
		for obj in next,nilRoots do
			if not newNilRoots[obj] then
				if not disconnect then disconnect = obj[1].Disconnect end
				disconnect(obj[1])
				disconnect(obj[2])
			end
		end
		
		for obj in next,newNilRoots do
			if not nilRoots[obj] then
				nilRoots[obj] = {
					connect(obj.DescendantAdded,addObject),
					connect(obj.DescendantRemoving,removeObject)
				}
			end
		end]]

		--nilMap = newNilMap
		--Explorer.NilRoots = newNilRoots

		Explorer.Update()
		Explorer.Refresh()
	end

	Explorer.GetInstancePath = function(obj)
		local ffc = game.FindFirstChild
		local getCh = game.GetChildren
		local path = ""
		local curObj = obj
		local ts = tostring
		local match = string.match
		local gsub = string.gsub
		local tableFind = table.find
		local useGetCh = Settings.Explorer.CopyPathUseGetChildren
		local formatLuaString = Lib.FormatLuaString

		while curObj do
			if curObj == game then
				path = "game"..path
				break
			end

			local className = curObj.ClassName
			local curName = ts(curObj)
			local indexName
			if match(curName,"^[%a_][%w_]*$") then
				indexName = "."..curName
			else
				local cleanName = formatLuaString(curName)
				indexName = '["'..cleanName..'"]'
			end

			local parObj = curObj.Parent
			if parObj then
				local fc = ffc(parObj,curName)
				if useGetCh and fc and fc ~= curObj then
					local parCh = getCh(parObj)
					local fcInd = tableFind(parCh,curObj)
					indexName = ":GetChildren()["..fcInd.."]"
				elseif parObj == game and API.Classes[className] and API.Classes[className].Tags.Service then
					indexName = ':GetService("'..className..'")'
				end
			elseif parObj == nil then
				local getnil = "local getNil = function(name, class) for _, v in next, getnilinstances() do if v.ClassName == class and v.Name == name then return v end end end"
				local gotnil = "\n\ngetNil(\"%s\", \"%s\")"
				indexName = getnil .. gotnil:format(curObj.Name, className)
			end

			path = indexName..path
			curObj = parObj
		end

		return path
	end

	Explorer.DefaultProps = {
		["BasePart"] = {
			Position = function(Obj)
				local Player = service.Players.LocalPlayer
				if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
					Obj.Position = (Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -10)).p
				end
				return Obj.Position
			end,
			Anchored = true
		},
		["GuiObject"] = {
			Position = function(Obj) return (Obj.Parent:IsA("ScreenGui") and UDim2.new(0.5, 0, 0.5, 0)) or Obj.Position end,
			Active = true
		}
	}

	Explorer.InitInsertObject = function()
		local context = Lib.ContextMenu.new()
		context.SearchEnabled = true
		context.MaxHeight = 400
		context:ApplyTheme({
			ContentColor = Settings.Theme.Main2,
			OutlineColor = Settings.Theme.Outline1,
			DividerColor = Settings.Theme.Outline1,
			TextColor = Settings.Theme.Text,
			HighlightColor = Settings.Theme.ButtonHover
		})

		local classes = {}
		for i,class in next,API.Classes do
			local tags = class.Tags
			if not tags.NotCreatable and not tags.Service then
				local rmdEntry = RMD.Classes[class.Name]
				classes[#classes+1] = {class,rmdEntry and rmdEntry.ClassCategory or "Uncategorized"}
			end
		end
		table.sort(classes,function(a,b)
			if a[2] ~= b[2] then
				return a[2] < b[2]
			else
				return a[1].Name < b[1].Name
			end
		end)

		local function defaultProps(obj)
			for class, props in pairs(Explorer.DefaultProps) do
				if obj:IsA(class) then
					for prop, value in pairs(props) do
						obj[prop] = (type(value) == "function" and value(obj)) or value
					end
				end
			end
		end

		local function onClick(className)
			local sList = selection.List
			local instNew = Instance.new
			for i = 1,#sList do
				local node = sList[i]
				local obj = node.Obj
				Explorer.MakeNodeVisible(node, true)
				local success, obj = pcall(instNew, className, obj)
				if success and obj then defaultProps(obj) end
			end
		end

		local lastCategory = ""
		for i = 1,#classes do
			local class = classes[i][1]
			local rmdEntry = RMD.Classes[class.Name]
			local iconInd = rmdEntry and tonumber(rmdEntry.ExplorerImageIndex) or 0
			local category = classes[i][2]

			if lastCategory ~= category then
				context:AddDivider(category)
				lastCategory = category
			end
			context:Add({Name = class.Name, IconMap = Explorer.ClassIcons, Icon = iconInd, OnClick = onClick})
		end

		Explorer.InsertObjectContext = context
	end

	Explorer._SearchFilters = {} do
		local Filters = Explorer._SearchFilters

		local function NewFilter(list, func)
			for _,v in next, list do
				Filters[v:lower() .. ":"] = func
			end
		end

		local Only = {
			remotes = {"RemoteEvent", "RemoteFunction", "BindableEvent", "BindableFunction"},
			scripts = {"Script", "LocalScript", "ModuleScript"},
			players = {"Player"}
		}

		NewFilter({"parent", "p"}, function(Obj, str) return Obj.Parent and (Obj.Parent.Name:lower()):find(str) end)
		NewFilter({"class", "c"}, function(Obj, str) return (Obj.ClassName:lower()):find(str) end)
		NewFilter({"isa", "i"}, function(Obj, str) return Obj:IsA(str) end)

		NewFilter({"only", "o"}, function(Obj, str)
			local Special = Only[str]
			return Special and table.find(Special, Obj.ClassName)
		end)
	end

	Explorer.DoSearch = function(query)
		table.clear(Explorer.SearchExpanded)
		table.clear(searchResults)
		expanded = (#query == 0 and Explorer.Expanded) or Explorer.SearchExpanded

		local tostr = tostring;
		local tfind = table.find;

		local Filters = Explorer._SearchFilters
		local expandTable = Explorer.SearchExpanded

		local allnodes = nodes[game]

		local defaultSearch = (function(Obj, str) return (Obj.Name:lower()):find(str, 1, true) end)

		local function searchTable(root, str, func)
			local expandedpar = false
			for _,node in ipairs(root) do
				if func(node.Obj, str) then
					expandTable[node] = 0
					searchResults[node] = true
					if not expandedpar then
						local parnode = node.Parent
						while parnode and (not searchResults[parnode] or expandTable[parnode] == 0) do
							expanded[parnode] = true
							searchResults[parnode] = true
							parnode = parnode.Parent
						end
						expandedpar = true
					end
				end

				if #node > 0 then searchTable(node, str, func) end
			end
		end

		local function Search(query)
			if query:len() == 0 then return end

			local lower = query:lower()
			local split = lower:split(":")
			local Filter = (Filters[split[1] .. ":"]) or nil

			if Filter then
				searchTable(allnodes, (split[2] or ""), Filter)
			else
				searchTable(allnodes, (lower or ""), defaultSearch)
			end
		end

		for _,v in ipairs(query:split(",")) do
			if v:len() > 0 then
				Search(v)
			end
		end

		--[=[if #query > 0 then
			local expandTable = Explorer.SearchExpanded
			local specFilters
			
			local lower = string.lower
			local find = string.find
			local tostring = tostring
			
			local lowerQuery = lower(query)
			
			local function defaultSearch(root)
				local expandedpar = false
				for i = 1,#root do
					local node = root[i]
					local obj = node.Obj
					
					if find(lower(tostring(obj)),lowerQuery,1,true) then
						expandTable[node] = 0
						searchResults[node] = true
						if not expandedpar then
							local parnode = node.Parent
							while parnode and (not searchResults[parnode] or expandTable[parnode] == 0) do
								expanded[parnode] = true
								searchResults[parnode] = true
								parnode = parnode.Parent
							end
							expandedpar = true
						end
					elseif ExplorerSearch[lower(tostring(obj))] then
						
					end
					
					if #node > 0 then defaultSearch(node) end
				end
			end

			if Main.Elevated then
				local start = tick()
				searchFunc,specFilters = Explorer.BuildSearchFunc(query)
				--print("BUILD SEARCH",tick()-start)
			else
				searchFunc = defaultSearch
			end

			if specFilters then
				table.clear(specResults)
				for i = 1,#specFilters do -- Specific search filers that returns list of matches
					local resMap = {}
					specResults[i] = resMap
					local objs = specFilters[i]()
					for c = 1,#objs do
						local node = nodes[objs[c]]
						if node then
							resMap[node] = true
						end
					end
				end
			end
			
			if searchFunc then
				local start = tick()
				searchFunc(nodes[game])
				searchFunc(nilNode)
				--warn(tick()-start)
			end
		end]=]

		Explorer.ForceUpdate()
	end

	Explorer.ClearSearch = function()
		Explorer.GuiElems.SearchBar.Text = ""
		expanded = Explorer.Expanded
		searchFunc = nil
	end

	Explorer.InitSearch = function()
		local TweenService = service.TweenService
		local SearchFrame = Explorer.GuiElems.ToolBar.SearchFrame
		local searchBox = SearchFrame.SearchBox
		Explorer.GuiElems.SearchBar = searchBox

		local TweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quint)
		local Tweens = {
			Start = TweenService:Create(SearchFrame.UIStroke, TweenInfo, { Color = Color3.fromRGB(0, 120, 215) }),
			End = TweenService:Create(SearchFrame.UIStroke, TweenInfo, { Color = Color3.fromRGB(42, 42, 42) })
		}

		searchBox.FocusLost:Connect(function() Tweens.End:Play() end)
		searchBox.Focused:Connect(function() Tweens.Start:Play() end)

		Lib.ViewportTextBox.convert(searchBox)

		searchBox.FocusLost:Connect(function()
			Explorer.DoSearch(searchBox.Text)
		end)
	end

	Explorer.InitEntryTemplate = function()
		entryTemplate = create({
			{1,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0,0,0),BackgroundTransparency=1,BorderColor3=Color3.new(0,0,0),Font=3,Name="Entry",Position=UDim2.new(0,1,0,1),Size=UDim2.new(0,250,0,20),Text="",TextSize=14,}},
			{2,"Frame",{BackgroundColor3=Color3.new(0.04313725605607,0.35294118523598,0.68627452850342),BackgroundTransparency=1,BorderColor3=Color3.new(0.33725491166115,0.49019610881805,0.73725491762161),BorderSizePixel=0,Name="Indent",Parent={1},Position=UDim2.new(0,20,0,0),Size=UDim2.new(1,-20,1,0),}},
			{3,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="EntryName",Parent={2},Position=UDim2.new(0,26,0,0),Size=UDim2.new(1,-26,1,0),Text="Workspace",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
			{4,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ClipsDescendants=true,Font=3,Name="Expand",Parent={2},Position=UDim2.new(0,-20,0,0),Size=UDim2.new(0,20,0,20),Text="",TextSize=14,}},
			{5,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5642383285",ImageRectOffset=Vector2.new(144,16),ImageRectSize=Vector2.new(16,16),Name="Icon",Parent={4},Position=UDim2.new(0,2,0,2),ScaleType=4,Size=UDim2.new(0,16,0,16),}},
			{6,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ImageRectOffset=Vector2.new(304,0),ImageRectSize=Vector2.new(16,16),Name="Icon",Parent={2},Position=UDim2.new(0,4,0,2),ScaleType=4,Size=UDim2.new(0,16,0,16),}},
		})

		local sys = Lib.ClickSystem.new()
		sys.AllowedButtons = {1,2}
		sys.OnDown:Connect(function(item,combo,button)
			local ind = table.find(listEntries,item)
			if not ind then return end
			local node = tree[ind + Explorer.Index]
			if not node then return end

			local entry = listEntries[ind]

			if button == 1 then
				if combo == 2 then
					if node.Obj:IsA("LuaSourceContainer") then
						ScriptViewer.ViewScript(node.Obj)
					elseif #node > 0 and expanded[node] ~= 0 then
						expanded[node] = not expanded[node]
						Explorer.Update()
					end
				end

				if Properties.SelectObject(node.Obj) then
					sys.IsRenaming = false
					return
				end

				sys.IsRenaming = selection.Map[node]

				if Lib.IsShiftDown() then
					if not selection.Piviot then return end

					local fromIndex = table.find(tree,selection.Piviot)
					local toIndex = table.find(tree,node)
					if not fromIndex or not toIndex then return end
					fromIndex,toIndex = math.min(fromIndex,toIndex),math.max(fromIndex,toIndex)

					local sList = selection.List
					for i = #sList,1,-1 do
						local elem = sList[i]
						if selection.ShiftSet[elem] then
							selection.Map[elem] = nil
							table.remove(sList,i)
						end
					end
					selection.ShiftSet = {}
					for i = fromIndex,toIndex do
						local elem = tree[i]
						if not selection.Map[elem] then
							selection.ShiftSet[elem] = true
							selection.Map[elem] = true
							sList[#sList+1] = elem
						end
					end
					selection.Changed:Fire()
				elseif Lib.IsCtrlDown() then
					selection.ShiftSet = {}
					if selection.Map[node] then selection:Remove(node) else selection:Add(node) end
					selection.Piviot = node
					sys.IsRenaming = false
				elseif not selection.Map[node] then
					selection.ShiftSet = {}
					selection:Set(node)
					selection.Piviot = node
				end
			elseif button == 2 then
				if Properties.SelectObject(node.Obj) then
					return
				end

				if not Lib.IsCtrlDown() and not selection.Map[node] then
					selection.ShiftSet = {}
					selection:Set(node)
					selection.Piviot = node
					Explorer.Refresh()
				end
			end

			Explorer.Refresh()
		end)

		sys.OnRelease:Connect(function(item,combo,button,position)
			local ind = table.find(listEntries,item)
			if not ind then return end
			local node = tree[ind + Explorer.Index]
			if not node then return end

			if button == 1 then
				if selection.Map[node] and not Lib.IsShiftDown() and not Lib.IsCtrlDown() then
					selection.ShiftSet = {}
					selection:Set(node)
					selection.Piviot = node
					Explorer.Refresh()
				end

				local id = sys.ClickId
				Lib.FastWait(sys.ComboTime)
				if combo == 1 and id == sys.ClickId and sys.IsRenaming and selection.Map[node] then
					Explorer.SetRenamingNode(node)
				end
			elseif button == 2 then
				Explorer.ShowRightClick(position)
			end
		end)
		Explorer.ClickSystem = sys
	end

	Explorer.InitDelCleaner = function()
		coroutine.wrap(function()
			local fw = Lib.FastWait
			while true do
				local processed = false
				local c = 0
				for _,node in next,nodes do
					if node.HasDel then
						local delInd
						for i = 1,#node do
							if node[i].Del then
								delInd = i
								break
							end
						end
						if delInd then
							for i = delInd+1,#node do
								local cn = node[i]
								if not cn.Del then
									node[delInd] = cn
									delInd = delInd+1
								end
							end
							for i = delInd,#node do
								node[i] = nil
							end
						end
						node.HasDel = false
						processed = true
						fw()
					end
					c = c + 1
					if c > 10000 then
						c = 0
						fw()
					end
				end
				if processed and not refreshDebounce then Explorer.PerformRefresh() end
				fw(0.5)
			end
		end)()
	end

	Explorer.UpdateSelectionVisuals = function()
		local holder = Explorer.SelectionVisualsHolder
		local isa = game.IsA
		local clone = game.Clone
		if not holder then
			holder = Instance.new("ScreenGui")
			holder.Name = "ExplorerSelections"
			holder.DisplayOrder = Main.DisplayOrders.Core
			Lib.ShowGui(holder)
			Explorer.SelectionVisualsHolder = holder
			Explorer.SelectionVisualCons = {}

			local guiTemplate = create({
				{1,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Size=UDim2.new(0,100,0,100),}},
				{2,"Frame",{BackgroundColor3=Color3.new(0.04313725605607,0.35294118523598,0.68627452850342),BorderSizePixel=0,Parent={1},Position=UDim2.new(0,-1,0,-1),Size=UDim2.new(1,2,0,1),}},
				{3,"Frame",{BackgroundColor3=Color3.new(0.04313725605607,0.35294118523598,0.68627452850342),BorderSizePixel=0,Parent={1},Position=UDim2.new(0,-1,1,0),Size=UDim2.new(1,2,0,1),}},
				{4,"Frame",{BackgroundColor3=Color3.new(0.04313725605607,0.35294118523598,0.68627452850342),BorderSizePixel=0,Parent={1},Position=UDim2.new(0,-1,0,0),Size=UDim2.new(0,1,1,0),}},
				{5,"Frame",{BackgroundColor3=Color3.new(0.04313725605607,0.35294118523598,0.68627452850342),BorderSizePixel=0,Parent={1},Position=UDim2.new(1,0,0,0),Size=UDim2.new(0,1,1,0),}},
			})
			Explorer.SelectionVisualGui = guiTemplate

			local boxTemplate = Instance.new("SelectionBox")
			boxTemplate.LineThickness = 0.03
			boxTemplate.Color3 = Color3.fromRGB(0, 170, 255)
			Explorer.SelectionVisualBox = boxTemplate
		end
		holder:ClearAllChildren()

		-- Updates theme
		for i,v in pairs(Explorer.SelectionVisualGui:GetChildren()) do
			v.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		end

		local attachCons = Explorer.SelectionVisualCons
		for i = 1,#attachCons do
			attachCons[i].Destroy()
		end
		table.clear(attachCons)

		local partEnabled = Settings.Explorer.PartSelectionBox
		local guiEnabled = Settings.Explorer.GuiSelectionBox
		if not partEnabled and not guiEnabled then return end

		local svg = Explorer.SelectionVisualGui
		local svb = Explorer.SelectionVisualBox
		local attachTo = Lib.AttachTo
		local sList = selection.List
		local count = 1
		local boxCount = 0
		local workspaceNode = nodes[workspace]
		for i = 1,#sList do
			if boxCount > 1000 then break end
			local node = sList[i]
			local obj = node.Obj

			if node ~= workspaceNode then
				if isa(obj,"GuiObject") and guiEnabled then
					local newVisual = clone(svg)
					attachCons[count] = attachTo(newVisual,{Target = obj, Resize = true})
					count = count + 1
					newVisual.Parent = holder
					boxCount = boxCount + 1
				elseif isa(obj,"PVInstance") and partEnabled then
					local newBox = clone(svb)
					newBox.Adornee = obj
					newBox.Parent = holder
					boxCount = boxCount + 1
				end
			end
		end
	end

	Explorer.Init = function()
		Explorer.ClassIcons = Lib.IconMap.newLinear("rbxasset://textures/ClassImages.PNG", 16, 16)
		Explorer.MiscIcons = Main.MiscIcons

		clipboard = {}

		selection = Lib.Set.new()
		selection.ShiftSet = {}
		selection.Changed:Connect(Properties.ShowExplorerProps)
		Explorer.Selection = selection

		Explorer.InitRightClick()
		Explorer.InitInsertObject()
		Explorer.SetSortingEnabled(Settings.Explorer.Sorting)
		Explorer.Expanded = setmetatable({},{__mode = "k"})
		Explorer.SearchExpanded = setmetatable({},{__mode = "k"})
		expanded = Explorer.Expanded

		nilNode.Obj.Name = "Nil Instances"
		nilNode.Locked = true

		local explorerItems = create({
			{1,"Folder",{Name="ExplorerItems",}},
			{2,"Frame",{BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="ToolBar",Parent={1},Size=UDim2.new(1,0,0,22),}},
			{3,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.1176470592618,0.1176470592618,0.1176470592618),BorderSizePixel=0,Name="SearchFrame",Parent={2},Position=UDim2.new(0,3,0,1),Size=UDim2.new(1,-6,0,18),}},
			{4,"TextBox",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ClearTextOnFocus=false,Font=3,Name="SearchBox",Parent={3},PlaceholderColor3=Color3.new(0.39215689897537,0.39215689897537,0.39215689897537),PlaceholderText="Search workspace",Position=UDim2.new(0,4,0,0),Size=UDim2.new(1,-24,0,18),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,}},
			{5,"UICorner",{CornerRadius=UDim.new(0,2),Parent={3},}},
			{6,"UIStroke",{Thickness=1.4,Parent={3},Color=Color3.fromRGB(42,42,42)}},
			{7,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Reset",Parent={3},Position=UDim2.new(1,-17,0,1),Size=UDim2.new(0,16,0,16),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
			{8,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5034718129",ImageColor3=Color3.new(0.39215686917305,0.39215686917305,0.39215686917305),Parent={7},Size=UDim2.new(0,16,0,16),}},
			{9,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Refresh",Parent={2},Position=UDim2.new(1,-20,0,1),Size=UDim2.new(0,18,0,18),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,Visible=false,}},
			{10,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5642310344",Parent={9},Position=UDim2.new(0,3,0,3),Size=UDim2.new(0,12,0,12),}},
			{11,"Frame",{BackgroundColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel=0,Name="ScrollCorner",Parent={1},Position=UDim2.new(1,-16,1,-16),Size=UDim2.new(0,16,0,16),Visible=false,}},
			{12,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ClipsDescendants=true,Name="List",Parent={1},Position=UDim2.new(0,0,0,23),Size=UDim2.new(1,0,1,-23),}}
		})

		toolBar = explorerItems.ToolBar
		treeFrame = explorerItems.List

		Explorer.GuiElems.ToolBar = toolBar
		Explorer.GuiElems.TreeFrame = treeFrame

		scrollV = Lib.ScrollBar.new()		
		scrollV.WheelIncrement = 3
		scrollV.Gui.Position = UDim2.new(1,-16,0,23)
		scrollV:SetScrollFrame(treeFrame)
		scrollV.Scrolled:Connect(function()
			Explorer.Index = scrollV.Index
			Explorer.Refresh()
		end)

		scrollH = Lib.ScrollBar.new(true)
		scrollH.Increment = 5
		scrollH.WheelIncrement = Explorer.EntryIndent
		scrollH.Gui.Position = UDim2.new(0,0,1,-16)
		scrollH.Scrolled:Connect(function()
			Explorer.Refresh()
		end)

		local window = Lib.Window.new()
		Explorer.Window = window
		window:SetTitle("Explorer")
		window.GuiElems.Line.Position = UDim2.new(0,0,0,22)

		Explorer.InitEntryTemplate()
		toolBar.Parent = window.GuiElems.Content
		treeFrame.Parent = window.GuiElems.Content
		explorerItems.ScrollCorner.Parent = window.GuiElems.Content
		scrollV.Gui.Parent = window.GuiElems.Content
		scrollH.Gui.Parent = window.GuiElems.Content

		-- Init stuff that requires the window
		Explorer.InitRenameBox()
		Explorer.InitSearch()
		Explorer.InitDelCleaner()
		selection.Changed:Connect(Explorer.UpdateSelectionVisuals)

		-- Window events
		window.GuiElems.Main:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			if Explorer.Active then
				Explorer.UpdateView()
				Explorer.Refresh()
			end
		end)
		window.OnActivate:Connect(function()
			Explorer.Active = true
			Explorer.UpdateView()
			Explorer.Update()
			Explorer.Refresh()
		end)
		window.OnRestore:Connect(function()
			Explorer.Active = true
			Explorer.UpdateView()
			Explorer.Update()
			Explorer.Refresh()
		end)
		window.OnDeactivate:Connect(function() Explorer.Active = false end)
		window.OnMinimize:Connect(function() Explorer.Active = false end)

		-- Settings
		autoUpdateSearch = Settings.Explorer.AutoUpdateSearch

		-- Fill in nodes
		nodes[game] = {Obj = game}
		expanded[nodes[game]] = true

		-- Nil Instances
		if env.getnilinstances then
			nodes[nilNode.Obj] = nilNode
		end

		Explorer.SetupConnections()

		local insts = getDescendants(game)
		if Main.Elevated then
			for i = 1,#insts do
				local obj = insts[i]
				local par = nodes[ffa(obj,"Instance")]
				if not par then continue end
				local newNode = {
					Obj = obj,
					Parent = par,
				}
				nodes[obj] = newNode
				par[#par+1] = newNode
			end
		else
			for i = 1,#insts do
				local obj = insts[i]
				local s,parObj = pcall(ffa,obj,"Instance")
				local par = nodes[parObj]
				if not par then continue end
				local newNode = {
					Obj = obj,
					Parent = par,
				}
				nodes[obj] = newNode
				par[#par+1] = newNode
			end
		end
	end

	return Explorer
end

return {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
end,
["Lib"] = function()
--[[
			Lib Module
			
			Container for functions and classes
		]]

-- Common Locals
local Main,Lib,Apps,Settings -- Main Containers
local Explorer, Properties, ScriptViewer, Notebook -- Major Apps
local API,RMD,env,service,plr,create,createSimple -- Main Locals

local function initDeps(data)
	Main = data.Main
	Lib = data.Lib
	Apps = data.Apps
	Settings = data.Settings

	API = data.API
	RMD = data.RMD
	env = data.env
	service = data.service
	plr = data.plr
	create = data.create
	createSimple = data.createSimple
end

local function initAfterMain()
	Explorer = Apps.Explorer
	Properties = Apps.Properties
	ScriptViewer = Apps.ScriptViewer
	Notebook = Apps.Notebook
end

local function main()
	local Lib = {}

	local renderStepped = service.RunService.RenderStepped
	local signalWait = renderStepped.wait
	local PH = newproxy() -- Placeholder, must be replaced in constructor
	local SIGNAL = newproxy()

	-- Usually for classes that work with a Roblox Object
	local function initObj(props,mt)
		local type = type
		local function copy(t)
			local res = {}
			for i,v in pairs(t) do
				if v == SIGNAL then
					res[i] = Lib.Signal.new()
				elseif type(v) == "table" then
					res[i] = copy(v)
				else
					res[i] = v
				end
			end		
			return res
		end

		local newObj = copy(props)
		return setmetatable(newObj,mt)
	end

	local function getGuiMT(props,funcs)
		return {__index = function(self,ind) if not props[ind] then return funcs[ind] or self.Gui[ind] end end,
		__newindex = function(self,ind,val) if not props[ind] then self.Gui[ind] = val else rawset(self,ind,val) end end}
	end

	-- Functions

	Lib.FormatLuaString = (function()
		local string = string
		local gsub = string.gsub
		local format = string.format
		local char = string.char
		local cleanTable = {['"'] = '\\"', ['\\'] = '\\\\'}
		for i = 0,31 do
			cleanTable[char(i)] = "\\"..format("%03d",i)
		end
		for i = 127,255 do
			cleanTable[char(i)] = "\\"..format("%03d",i)
		end

		return function(str)
			return gsub(str,"[\"\\\0-\31\127-\255]",cleanTable)
		end
	end)()

	Lib.CheckMouseInGui = function(gui)
		if gui == nil then return false end
		local mouse = Main.Mouse
		local guiPosition = gui.AbsolutePosition
		local guiSize = gui.AbsoluteSize	

		return mouse.X >= guiPosition.X and mouse.X < guiPosition.X + guiSize.X and mouse.Y >= guiPosition.Y and mouse.Y < guiPosition.Y + guiSize.Y
	end

	Lib.IsShiftDown = function()
		return service.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or service.UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
	end

	Lib.IsCtrlDown = function()
		return service.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or service.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
	end

	Lib.CreateArrow = function(size,num,dir)
		local max = num
		local arrowFrame = createSimple("Frame",{
			BackgroundTransparency = 1,
			Name = "Arrow",
			Size = UDim2.new(0,size,0,size)
		})
		if dir == "up" then
			for i = 1,num do
				local newLine = createSimple("Frame",{
					BackgroundColor3 = Color3.new(220/255,220/255,220/255),
					BorderSizePixel = 0,
					Position = UDim2.new(0,math.floor(size/2)-(i-1),0,math.floor(size/2)+i-math.floor(max/2)-1),
					Size = UDim2.new(0,i+(i-1),0,1),
					Parent = arrowFrame
				})
			end
			return arrowFrame
		elseif dir == "down" then
			for i = 1,num do
				local newLine = createSimple("Frame",{
					BackgroundColor3 = Color3.new(220/255,220/255,220/255),
					BorderSizePixel = 0,
					Position = UDim2.new(0,math.floor(size/2)-(i-1),0,math.floor(size/2)-i+math.floor(max/2)+1),
					Size = UDim2.new(0,i+(i-1),0,1),
					Parent = arrowFrame
				})
			end
			return arrowFrame
		elseif dir == "left" then
			for i = 1,num do
				local newLine = createSimple("Frame",{
					BackgroundColor3 = Color3.new(220/255,220/255,220/255),
					BorderSizePixel = 0,
					Position = UDim2.new(0,math.floor(size/2)+i-math.floor(max/2)-1,0,math.floor(size/2)-(i-1)),
					Size = UDim2.new(0,1,0,i+(i-1)),
					Parent = arrowFrame
				})
			end
			return arrowFrame
		elseif dir == "right" then
			for i = 1,num do
				local newLine = createSimple("Frame",{
					BackgroundColor3 = Color3.new(220/255,220/255,220/255),
					BorderSizePixel = 0,
					Position = UDim2.new(0,math.floor(size/2)-i+math.floor(max/2)+1,0,math.floor(size/2)-(i-1)),
					Size = UDim2.new(0,1,0,i+(i-1)),
					Parent = arrowFrame
				})
			end
			return arrowFrame
		end
		error("r u ok")
	end

	Lib.ParseXML = (function()
		local func = function()
			-- Only exists to parse RMD
			-- from https://github.com/jonathanpoelen/xmlparser

			local string, print, pairs = string, print, pairs

			-- http://lua-users.org/wiki/StringTrim
			local trim = function(s)
				local from = s:match"^%s*()"
				return from > #s and "" or s:match(".*%S", from)
			end

			local gtchar = string.byte('>', 1)
			local slashchar = string.byte('/', 1)
			local D = string.byte('D', 1)
			local E = string.byte('E', 1)

			function parse(s, evalEntities)
				-- remove comments
				s = s:gsub('<!%-%-(.-)%-%->', '')

				local entities, tentities = {}

				if evalEntities then
					local pos = s:find('<[_%w]')
					if pos then
						s:sub(1, pos):gsub('<!ENTITY%s+([_%w]+)%s+(.)(.-)%2', function(name, q, entity)
							entities[#entities+1] = {name=name, value=entity}
						end)
						tentities = createEntityTable(entities)
						s = replaceEntities(s:sub(pos), tentities)
					end
				end

				local t, l = {}, {}

				local addtext = function(txt)
					txt = txt:match'^%s*(.*%S)' or ''
					if #txt ~= 0 then
						t[#t+1] = {text=txt}
					end		
				end

				s:gsub('<([?!/]?)([-:_%w]+)%s*(/?>?)([^<]*)', function(type, name, closed, txt)
					-- open
					if #type == 0 then
						local a = {}
						if #closed == 0 then
							local len = 0
							for all,aname,_,value,starttxt in string.gmatch(txt, "(.-([-_%w]+)%s*=%s*(.)(.-)%3%s*(/?>?))") do
								len = len + #all
								a[aname] = value
								if #starttxt ~= 0 then
									txt = txt:sub(len+1)
									closed = starttxt
									break
								end
							end
						end
						t[#t+1] = {tag=name, attrs=a, children={}}

						if closed:byte(1) ~= slashchar then
							l[#l+1] = t
							t = t[#t].children
						end

						addtext(txt)
						-- close
					elseif '/' == type then
						t = l[#l]
						l[#l] = nil

						addtext(txt)
						-- ENTITY
					elseif '!' == type then
						if E == name:byte(1) then
							txt:gsub('([_%w]+)%s+(.)(.-)%2', function(name, q, entity)
								entities[#entities+1] = {name=name, value=entity}
							end, 1)
						end
						-- elseif '?' == type then
						--	 print('?	' .. name .. ' // ' .. attrs .. '$$')
						-- elseif '-' == type then
						--	 print('comment	' .. name .. ' // ' .. attrs .. '$$')
						-- else
						--	 print('o	' .. #p .. ' // ' .. name .. ' // ' .. attrs .. '$$')
					end
				end)

				return {children=t, entities=entities, tentities=tentities}
			end

			function parseText(txt)
				return parse(txt)
			end

			function defaultEntityTable()
				return { quot='"', apos='\'', lt='<', gt='>', amp='&', tab='\t', nbsp=' ', }
			end

			function replaceEntities(s, entities)
				return s:gsub('&([^;]+);', entities)
			end

			function createEntityTable(docEntities, resultEntities)
				entities = resultEntities or defaultEntityTable()
				for _,e in pairs(docEntities) do
					e.value = replaceEntities(e.value, entities)
					entities[e.name] = e.value
				end
				return entities
			end

			return parseText
		end
		local newEnv = setmetatable({},{__index = getfenv()})
		setfenv(func,newEnv)
		return func()
	end)()

	Lib.FastWait = function(s)
		if not s then return signalWait(renderStepped) end
		local start = tick()
		while tick() - start < s do signalWait(renderStepped) end
	end

	Lib.ButtonAnim = function(button,data)
		local holding = false
		local disabled = false
		local mode = data and data.Mode or 1
		local control = {}

		if mode == 2 then
			local lerpTo = data.LerpTo or Color3.new(0,0,0)
			local delta = data.LerpDelta or 0.2
			control.StartColor = data.StartColor or button.BackgroundColor3
			control.PressColor = data.PressColor or control.StartColor:lerp(lerpTo,delta)
			control.HoverColor = data.HoverColor or control.StartColor:lerp(control.PressColor,0.6)
			control.OutlineColor = data.OutlineColor
		end

		button.InputBegan:Connect(function(input)
			if disabled then return end

			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if not holding then
					if mode == 1 then
						button.BackgroundTransparency = 0.4
					elseif mode == 2 then
						button.BackgroundColor3 = control.HoverColor
					end
				end
			elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				holding = true
				if mode == 1 then
					button.BackgroundTransparency = 0
				elseif mode == 2 then
					button.BackgroundColor3 = control.PressColor
					if control.OutlineColor then button.BorderColor3 = control.PressColor end
				end
			end
		end)

		button.InputEnded:Connect(function(input)
			if disabled then return end

			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if not holding then
					if mode == 1 then
						button.BackgroundTransparency = 1
					elseif mode == 2 then
						button.BackgroundColor3 = control.StartColor
					end
				end
			elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				holding = false
				if mode == 1 then
					button.BackgroundTransparency = Lib.CheckMouseInGui(button) and 0.4 or 1
				elseif mode == 2 then
					button.BackgroundColor3 = Lib.CheckMouseInGui(button) and control.HoverColor or control.StartColor
					if control.OutlineColor then button.BorderColor3 = control.OutlineColor end
				end
			end
		end)

		control.Disable = function()
			disabled = true
			holding = false

			if mode == 1 then
				button.BackgroundTransparency = 1
			elseif mode == 2 then
				button.BackgroundColor3 = control.StartColor
			end
		end

		control.Enable = function()
			disabled = false
		end

		return control
	end

	Lib.FindAndRemove = function(t,item)
		local pos = table.find(t,item)
		if pos then table.remove(t,pos) end
	end

	Lib.AttachTo = function(obj,data)
		local target,posOffX,posOffY,sizeOffX,sizeOffY,resize,con
		local disabled = false

		local function update()
			if not obj or not target then return end

			local targetPos = target.AbsolutePosition
			local targetSize = target.AbsoluteSize
			obj.Position = UDim2.new(0,targetPos.X + posOffX,0,targetPos.Y + posOffY)
			if resize then obj.Size = UDim2.new(0,targetSize.X + sizeOffX,0,targetSize.Y + sizeOffY) end
		end

		local function setup(o,data)
			obj = o
			data = data or {}
			target = data.Target
			posOffX = data.PosOffX or 0
			posOffY = data.PosOffY or 0
			sizeOffX = data.SizeOffX or 0
			sizeOffY = data.SizeOffY or 0
			resize = data.Resize or false

			if con then con:Disconnect() con = nil end
			if target then
				con = target.Changed:Connect(function(prop)
					if not disabled and prop == "AbsolutePosition" or prop == "AbsoluteSize" then
						update()
					end
				end)
			end

			update()
		end
		setup(obj,data)

		return {
			SetData = function(obj,data)
				setup(obj,data)
			end,
			Enable = function()
				disabled = false
				update()
			end,
			Disable = function()
				disabled = true
			end,
			Destroy = function()
				con:Disconnect()
				con = nil
			end,
		}
	end

	Lib.ProtectedGuis = {}

	Lib.ShowGui = function(gui)
		if env.gethui then
			gui.Parent = env.gethui()
		elseif env.protectgui then
			env.protectgui(gui)
			gui.Parent = Main.GuiHolder
		else
			gui.Parent = Main.GuiHolder
		end
	end

	Lib.ColorToBytes = function(col)
		local round = math.round
		return string.format("%d, %d, %d",round(col.r*255),round(col.g*255),round(col.b*255))
	end

	Lib.ReadFile = function(filename)
		if not env.readfile then return end

		local s,contents = pcall(env.readfile,filename)
		if s and contents then return contents end
	end

	Lib.DeferFunc = function(f,...)
		signalWait(renderStepped)
		return f(...)
	end

	Lib.LoadCustomAsset = function(filepath)
		if not env.getcustomasset or not env.isfile or not env.isfile(filepath) then return end

		return env.getcustomasset(filepath)
	end

	Lib.FetchCustomAsset = function(url,filepath)
		if not env.writefile then return end

		local s,data = pcall(oldgame.HttpGet,game,url)
		if not s then return end

		env.writefile(filepath,data)
		return Lib.LoadCustomAsset(filepath)
	end

	-- Classes

	Lib.Signal = (function()
		local funcs = {}

		local disconnect = function(con)
			local pos = table.find(con.Signal.Connections,con)
			if pos then table.remove(con.Signal.Connections,pos) end
		end

		funcs.Connect = function(self,func)
			if type(func) ~= "function" then error("Attempt to connect a non-function") end		
			local con = {
				Signal = self,
				Func = func,
				Disconnect = disconnect
			}
			self.Connections[#self.Connections+1] = con
			return con
		end

		funcs.Fire = function(self,...)
			for i,v in next,self.Connections do
				xpcall(coroutine.wrap(v.Func),function(e) warn(e.."\n"..debug.traceback()) end,...)
			end
		end

		local mt = {
			__index = funcs,
			__tostring = function(self)
				return "Signal: " .. tostring(#self.Connections) .. " Connections"
			end
		}

		local function new()
			local obj = {}
			obj.Connections = {}

			return setmetatable(obj,mt)
		end

		return {new = new}
	end)()

	Lib.Set = (function()
		local funcs = {}

		funcs.Add = function(self,obj)
			if self.Map[obj] then return end

			local list = self.List
			list[#list+1] = obj
			self.Map[obj] = true
			self.Changed:Fire()
		end

		funcs.AddTable = function(self,t)
			local changed
			local list,map = self.List,self.Map
			for i = 1,#t do
				local elem = t[i]
				if not map[elem] then
					list[#list+1] = elem
					map[elem] = true
					changed = true
				end
			end
			if changed then self.Changed:Fire() end
		end

		funcs.Remove = function(self,obj)
			if not self.Map[obj] then return end

			local list = self.List
			local pos = table.find(list,obj)
			if pos then table.remove(list,pos) end
			self.Map[obj] = nil
			self.Changed:Fire()
		end

		funcs.RemoveTable = function(self,t)
			local changed
			local list,map = self.List,self.Map
			local removeSet = {}
			for i = 1,#t do
				local elem = t[i]
				map[elem] = nil
				removeSet[elem] = true
			end

			for i = #list,1,-1 do
				local elem = list[i]
				if removeSet[elem] then
					table.remove(list,i)
					changed = true
				end
			end
			if changed then self.Changed:Fire() end
		end

		funcs.Set = function(self,obj)
			if #self.List == 1 and self.List[1] == obj then return end

			self.List = {obj}
			self.Map = {[obj] = true}
			self.Changed:Fire()
		end

		funcs.SetTable = function(self,t)
			local newList,newMap = {},{}
			self.List,self.Map = newList,newMap
			table.move(t,1,#t,1,newList)
			for i = 1,#t do
				newMap[t[i]] = true
			end
			self.Changed:Fire()
		end

		funcs.Clear = function(self)
			if #self.List == 0 then return end
			self.List = {}
			self.Map = {}
			self.Changed:Fire()
		end

		local mt = {__index = funcs}

		local function new()
			local obj = setmetatable({
				List = {},
				Map = {},
				Changed = Lib.Signal.new()
			},mt)

			return obj
		end

		return {new = new}
	end)()

	Lib.IconMap = (function()
		local funcs = {}
		local _MapId, _Icons = (483448923), {
			["Accessory"] = 32;
			["Accoutrement"] = 32;
			["AdService"] = 73;
			["Animation"] = 60;
			["AnimationController"] = 60;
			["AnimationTrack"] = 60;
			["Animator"] = 60;
			["ArcHandles"] = 56;
			["AssetService"] = 72;
			["Attachment"] = 34;
			["Backpack"] = 20;
			["BadgeService"] = 75;
			["BallSocketConstraint"] = 89;
			["BillboardGui"] = 64;
			["BinaryStringValue"] = 4;
			["BindableEvent"] = 67;
			["BindableFunction"] = 66;
			["BlockMesh"] = 8;
			["BloomEffect"] = 90;
			["BlurEffect"] = 90;
			["BodyAngularVelocity"] = 14;
			["BodyForce"] = 14;
			["BodyGyro"] = 14;
			["BodyPosition"] = 14;
			["BodyThrust"] = 14;
			["BodyVelocity"] = 14;
			["BoolValue"] = 4;
			["BoxHandleAdornment"] = 54;
			["BrickColorValue"] = 4;
			["Camera"] = 5;
			["CFrameValue"] = 4;
			["CharacterMesh"] = 60;
			["Chat"] = 33;
			["ClickDetector"] = 41;
			["CollectionService"] = 30;
			["Color3Value"] = 4;
			["ColorCorrectionEffect"] = 90;
			["ConeHandleAdornment"] = 54;
			["Configuration"] = 58;
			["ContentProvider"] = 72;
			["ContextActionService"] = 41;
			["CoreGui"] = 46;
			["CoreScript"] = 18;
			["CornerWedgePart"] = 1;
			["CustomEvent"] = 4;
			["CustomEventReceiver"] = 4;
			["CylinderHandleAdornment"] = 54;
			["CylinderMesh"] = 8;
			["CylindricalConstraint"] = 89;
			["Debris"] = 30;
			["Decal"] = 7;
			["Dialog"] = 62;
			["DialogChoice"] = 63;
			["DoubleConstrainedValue"] = 4;
			["Explosion"] = 36;
			["FileMesh"] = 8;
			["Fire"] = 61;
			["Flag"] = 38;
			["FlagStand"] = 39;
			["FloorWire"] = 4;
			["Folder"] = 70;
			["ForceField"] = 37;
			["Frame"] = 48;
			["GamePassService"] = 19;
			["Glue"] = 34;
			["GuiButton"] = 52;
			["GuiMain"] = 47;
			["GuiService"] = 47;
			["Handles"] = 53;
			["HapticService"] = 84;
			["Hat"] = 45;
			["HingeConstraint"] = 89;
			["Hint"] = 33;
			["HopperBin"] = 22;
			["HttpService"] = 76;
			["Humanoid"] = 9;
			["ImageButton"] = 52;
			["ImageLabel"] = 49;
			["InsertService"] = 72;
			["IntConstrainedValue"] = 4;
			["IntValue"] = 4;
			["JointInstance"] = 34;
			["JointsService"] = 34;
			["Keyframe"] = 60;
			["KeyframeSequence"] = 60;
			["KeyframeSequenceProvider"] = 60;
			["Lighting"] = 13;
			["LineHandleAdornment"] = 54;
			["LocalScript"] = 18;
			["LogService"] = 87;
			["MarketplaceService"] = 46;
			["Message"] = 33;
			["Model"] = 2;
			["ModuleScript"] = 71;
			["Motor"] = 34;
			["Motor6D"] = 34;
			["MoveToConstraint"] = 89;
			["NegateOperation"] = 78;
			["NetworkClient"] = 16;
			["NetworkReplicator"] = 29;
			["NetworkServer"] = 15;
			["NumberValue"] = 4;
			["ObjectValue"] = 4;
			["Pants"] = 44;
			["ParallelRampPart"] = 1;
			["Part"] = 1;
			["ParticleEmitter"] = 69;
			["PartPairLasso"] = 57;
			["PathfindingService"] = 37;
			["Platform"] = 35;
			["Player"] = 12;
			["PlayerGui"] = 46;
			["Players"] = 21;
			["PlayerScripts"] = 82;
			["PointLight"] = 13;
			["PointsService"] = 83;
			["Pose"] = 60;
			["PrismaticConstraint"] = 89;
			["PrismPart"] = 1;
			["PyramidPart"] = 1;
			["RayValue"] = 4;
			["ReflectionMetadata"] = 86;
			["ReflectionMetadataCallbacks"] = 86;
			["ReflectionMetadataClass"] = 86;
			["ReflectionMetadataClasses"] = 86;
			["ReflectionMetadataEnum"] = 86;
			["ReflectionMetadataEnumItem"] = 86;
			["ReflectionMetadataEnums"] = 86;
			["ReflectionMetadataEvents"] = 86;
			["ReflectionMetadataFunctions"] = 86;
			["ReflectionMetadataMember"] = 86;
			["ReflectionMetadataProperties"] = 86;
			["ReflectionMetadataYieldFunctions"] = 86;
			["RemoteEvent"] = 80;
			["RemoteFunction"] = 79;
			["ReplicatedFirst"] = 72;
			["ReplicatedStorage"] = 72;
			["RightAngleRampPart"] = 1;
			["RocketPropulsion"] = 14;
			["RodConstraint"] = 89;
			["RopeConstraint"] = 89;
			["Rotate"] = 34;
			["RotateP"] = 34;
			["RotateV"] = 34;
			["RunService"] = 66;
			["ScreenGui"] = 47;
			["Script"] = 6;
			["ScrollingFrame"] = 48;
			["Seat"] = 35;
			["Selection"] = 55;
			["SelectionBox"] = 54;
			["SelectionPartLasso"] = 57;
			["SelectionPointLasso"] = 57;
			["SelectionSphere"] = 54;
			["ServerScriptService"] = 0;
			["ServerStorage"] = 74;
			["Shirt"] = 43;
			["ShirtGraphic"] = 40;
			["SkateboardPlatform"] = 35;
			["Sky"] = 28;
			["SlidingBallConstraint"] = 89;
			["Smoke"] = 59;
			["Snap"] = 34;
			["Sound"] = 11;
			["SoundService"] = 31;
			["Sparkles"] = 42;
			["SpawnLocation"] = 25;
			["SpecialMesh"] = 8;
			["SphereHandleAdornment"] = 54;
			["SpotLight"] = 13;
			["SpringConstraint"] = 89;
			["StarterCharacterScripts"] = 82;
			["StarterGear"] = 20;
			["StarterGui"] = 46;
			["StarterPack"] = 20;
			["StarterPlayer"] = 88;
			["StarterPlayerScripts"] = 82;
			["Status"] = 2;
			["StringValue"] = 4;
			["SunRaysEffect"] = 90;
			["SurfaceGui"] = 64;
			["SurfaceLight"] = 13;
			["SurfaceSelection"] = 55;
			["Team"] = 24;
			["Teams"] = 23;
			["TeleportService"] = 81;
			["Terrain"] = 65;
			["TerrainRegion"] = 65;
			["TestService"] = 68;
			["TextBox"] = 51;
			["TextButton"] = 51;
			["TextLabel"] = 50;
			["Texture"] = 10;
			["TextureTrail"] = 4;
			["Tool"] = 17;
			["TouchTransmitter"] = 37;
			["TrussPart"] = 1;
			["UnionOperation"] = 77;
			["UserInputService"] = 84;
			["Vector3Value"] = 4;
			["VehicleSeat"] = 35;
			["VelocityMotor"] = 34;
			["WedgePart"] = 1;
			["Weld"] = 34;
			["Workspace"] = 19;

		}
		funcs.ExplorerIcons = { ["MapId"] = _MapId, ["Icons"] = _Icons }

		funcs.GetLabel = function(self)
			local label = Instance.new("ImageLabel")
			self:SetupLabel(label)
			return label
		end

		funcs.SetupLabel = function(self,obj)
			obj.BackgroundTransparency = 1
			obj.ImageRectOffset = Vector2.new(0, 0)
			obj.ImageRectSize = Vector2.new(self.IconSizeX, self.IconSizeY)
			obj.ScaleType = Enum.ScaleType.Crop
			obj.Size = UDim2.new(0, self.IconSizeX, 0, self.IconSizeY)
		end

		funcs.Display = function(self,obj,index)
			obj.Image = self.MapId
			if not self.NumX then
				obj.ImageRectOffset = Vector2.new(self.IconSizeX*index, 0)
			else
				obj.ImageRectOffset = Vector2.new(self.IconSizeX*(index % self.NumX), self.IconSizeY*math.floor(index / self.NumX))
			end
		end

		funcs.DisplayByKey = function(self, obj, key)
			if self.IndexDict[key] then
				self:Display(obj, self.IndexDict[key])
			else
				local rmdEntry = RMD.Classes[obj.ClassName]
				Explorer.ClassIcons:Display(obj, rmdEntry and rmdEntry.ExplorerImageIndex or 0)
			end
		end

		funcs.IconDehash = function(self, _id)
			return math.floor(_id / 14 % 14), math.floor(_id % 14)
		end

		funcs.GetExplorerIcon = function(self, obj, index)
			index = (self.ExplorerIcons.Icons[index] or 0)
			local row, col = self:IconDehash(index)
			local MapSize = Vector2.new(256, 256)
			local pad, border = 2, 1
			local IconSize = 16

			obj.Position = UDim2.new(-col - (pad * (col + 1) + border) / IconSize, 0, -row - (pad * (row + 1) + border) / IconSize, 0)
			obj.Size = UDim2.new(MapSize.X / IconSize, 0, MapSize.Y / IconSize, 0)
		end

		funcs.DisplayExplorerIcons = function(self, Frame, index)
			if Frame:FindFirstChild("IconMap") then
				self:GetExplorerIcon(Frame.IconMap, index)
			else
				Frame.ClipsDescendants = true

				local obj = Instance.new("ImageLabel", Frame)
				obj.BackgroundTransparency = 1
				obj.Image = ("http://www.roblox.com/asset/?id=" .. (self.ExplorerIcons.MapId))
				obj.Name = "IconMap"
				self:GetExplorerIcon(obj, index)
			end
		end

		funcs.SetDict = function(self,dict)
			self.IndexDict = dict
		end

		local mt = {}
		mt.__index = funcs

		local function new(mapId,mapSizeX,mapSizeY,iconSizeX,iconSizeY)
			local obj = setmetatable({
				MapId = mapId,
				MapSizeX = mapSizeX,
				MapSizeY = mapSizeY,
				IconSizeX = iconSizeX,
				IconSizeY = iconSizeY,
				NumX = mapSizeX/iconSizeX,
				IndexDict = {}
			}, mt)
			return obj
		end

		local function newLinear(mapId,iconSizeX,iconSizeY)
			local obj = setmetatable({
				MapId = mapId,
				IconSizeX = iconSizeX,
				IconSizeY = iconSizeY,
				IndexDict = {}
			},mt)
			return obj
		end

		return {new = new, newLinear = newLinear}
	end)()

	Lib.ScrollBar = (function()
		local funcs = {}
		local user = service.UserInputService
		local mouse = plr:GetMouse()
		local checkMouseInGui = Lib.CheckMouseInGui
		local createArrow = Lib.CreateArrow

		local function drawThumb(self)
			local total = self.TotalSpace
			local visible = self.VisibleSpace
			local index = self.Index
			local scrollThumb = self.GuiElems.ScrollThumb
			local scrollThumbFrame = self.GuiElems.ScrollThumbFrame

			if not (self:CanScrollUp()	or self:CanScrollDown()) then
				scrollThumb.Visible = false
			else
				scrollThumb.Visible = true
			end

			if self.Horizontal then
				scrollThumb.Size = UDim2.new(visible/total,0,1,0)
				if scrollThumb.AbsoluteSize.X < 16 then
					scrollThumb.Size = UDim2.new(0,16,1,0)
				end
				local fs = scrollThumbFrame.AbsoluteSize.X
				local bs = scrollThumb.AbsoluteSize.X
				scrollThumb.Position = UDim2.new(self:GetScrollPercent()*(fs-bs)/fs,0,0,0)
			else
				scrollThumb.Size = UDim2.new(1,0,visible/total,0)
				if scrollThumb.AbsoluteSize.Y < 16 then
					scrollThumb.Size = UDim2.new(1,0,0,16)
				end
				local fs = scrollThumbFrame.AbsoluteSize.Y
				local bs = scrollThumb.AbsoluteSize.Y
				scrollThumb.Position = UDim2.new(0,0,self:GetScrollPercent()*(fs-bs)/fs,0)
			end
		end

		local function createFrame(self)
			local newFrame = createSimple("Frame",{Style=0,Active=true,AnchorPoint=Vector2.new(0,0),BackgroundColor3=Color3.new(0.35294118523598,0.35294118523598,0.35294118523598),BackgroundTransparency=0,BorderColor3=Color3.new(0.10588236153126,0.16470588743687,0.20784315466881),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1,-16,0,0),Rotation=0,Selectable=false,Size=UDim2.new(0,16,1,0),SizeConstraint=0,Visible=true,ZIndex=1,Name="ScrollBar",})
			local button1, button2

			if self.Horizontal then
				newFrame.Size = UDim2.new(1,0,0,16)
				button1 = createSimple("ImageButton",{
					Parent = newFrame,
					Name = "Left",
					Size = UDim2.new(0,16,0,16),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutoButtonColor = false
				})
				createArrow(16,4,"left").Parent = button1
				button2 = createSimple("ImageButton",{
					Parent = newFrame,
					Name = "Right",
					Position = UDim2.new(1,-16,0,0),
					Size = UDim2.new(0,16,0,16),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutoButtonColor = false
				})
				createArrow(16,4,"right").Parent = button2
			else
				newFrame.Size = UDim2.new(0,16,1,0)
				button1 = createSimple("ImageButton",{
					Parent = newFrame,
					Name = "Up",
					Size = UDim2.new(0,16,0,16),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutoButtonColor = false
				})
				createArrow(16,4,"up").Parent = button1
				button2 = createSimple("ImageButton",{
					Parent = newFrame,
					Name = "Down",
					Position = UDim2.new(0,0,1,-16),
					Size = UDim2.new(0,16,0,16),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutoButtonColor = false
				})
				createArrow(16,4,"down").Parent = button2
			end

			local scrollThumbFrame = createSimple("ImageButton", {
				BackgroundTransparency = 1,
				Parent = newFrame
			})
			if self.Horizontal then
				scrollThumbFrame.Position = UDim2.new(0,16,0,0)
				scrollThumbFrame.Size = UDim2.new(1,-32,1,0)
			else
				scrollThumbFrame.Position = UDim2.new(0,0,0,16)
				scrollThumbFrame.Size = UDim2.new(1,0,1,-32)
			end

			local scrollThumb = createSimple("Frame", {
				BackgroundColor3 = Color3.new(120/255, 120/255, 120/255),
				BorderSizePixel = 0,
				Parent = scrollThumbFrame
			})

			local markerFrame = createSimple("Frame", {
				BackgroundTransparency = 1,
				Name = "Markers",
				Size = UDim2.new(1, 0, 1, 0),
				Parent = scrollThumbFrame
			})

			local buttonPress = false
			local thumbPress = false
			local thumbFramePress = false

			local function handleButtonPress(button, scrollDirection)
				if self:CanScroll(scrollDirection) then
					button.BackgroundTransparency = 0.5
					self:ScrollToDirection(scrollDirection)
					self.Scrolled:Fire()
					local buttonTick = tick()
					local releaseEvent
					releaseEvent = user.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							releaseEvent:Disconnect()
							button.BackgroundTransparency = checkMouseInGui(button) and 0.8 or 1
							buttonPress = false
						end
					end)
					while buttonPress do
						if tick() - buttonTick >= 0.25 and self:CanScroll(scrollDirection) then
							self:ScrollToDirection(scrollDirection)
							self.Scrolled:Fire()
						end
						task.wait()
					end
				end
			end

			button1.MouseButton1Down:Connect(function(input)
				buttonPress = true
				handleButtonPress(button1, "Up")
			end)

			button1.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					button1.BackgroundTransparency = 1
				end
			end)

			button2.MouseButton1Down:Connect(function(input)
				buttonPress = true
				handleButtonPress(button2, "Down")
			end)

			button2.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					button2.BackgroundTransparency = 1
				end
			end)

			scrollThumb.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
					local dir = self.Horizontal and "X" or "Y"
					local lastThumbPos = nil
					thumbPress = true
					scrollThumb.BackgroundTransparency = 0
					local mouseOffset = mouse[dir] - scrollThumb.AbsolutePosition[dir]
					local releaseEvent
					local mouseEvent

					releaseEvent = user.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							releaseEvent:Disconnect()
							if mouseEvent then mouseEvent:Disconnect() end
							scrollThumb.BackgroundTransparency = 0.2
							thumbPress = false
						end
					end)

					mouseEvent = user.InputChanged:Connect(function(input)
						if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and thumbPress then
							local thumbFrameSize = scrollThumbFrame.AbsoluteSize[dir] - scrollThumb.AbsoluteSize[dir]
							local pos = mouse[dir] - scrollThumbFrame.AbsolutePosition[dir] - mouseOffset
							if pos > thumbFrameSize then pos = thumbFrameSize
							elseif pos < 0 then pos = 0 end
							if lastThumbPos ~= pos then
								lastThumbPos = pos
								self:ScrollTo(math.floor(0.5 + pos / thumbFrameSize * (self.TotalSpace - self.VisibleSpace)))
							end
						end
					end)
				end
			end)

			scrollThumb.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					scrollThumb.BackgroundTransparency = 0
				end
			end)

			scrollThumbFrame.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not checkMouseInGui(scrollThumb) then
					local dir = self.Horizontal and "X" or "Y"
					local scrollDir = (mouse[dir] >= scrollThumb.AbsolutePosition[dir] + scrollThumb.AbsoluteSize[dir]) and 1 or 0
					local function doTick()
						local scrollSize = self.VisibleSpace - 1
						if scrollDir == 0 and mouse[dir] < scrollThumb.AbsolutePosition[dir] then
							self:ScrollTo(self.Index - scrollSize)
						elseif scrollDir == 1 and mouse[dir] >= scrollThumb.AbsolutePosition[dir] + scrollThumb.AbsoluteSize[dir] then
							self:ScrollTo(self.Index + scrollSize)
						end
					end

					thumbPress = false
					thumbFramePress = true
					doTick()
					local thumbFrameTick = tick()
					local releaseEvent
					releaseEvent = user.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							releaseEvent:Disconnect()
							thumbFramePress = false
						end
					end)

					while thumbFramePress do
						if tick() - thumbFrameTick >= 0.3 and checkMouseInGui(scrollThumbFrame) then
							doTick()
						end
						task.wait()
					end
				end
			end)

			newFrame.MouseWheelForward:Connect(function()
				self:ScrollTo(self.Index - self.WheelIncrement)
			end)

			newFrame.MouseWheelBackward:Connect(function()
				self:ScrollTo(self.Index + self.WheelIncrement)
			end)

			self.GuiElems.ScrollThumb = scrollThumb
			self.GuiElems.ScrollThumbFrame = scrollThumbFrame
			self.GuiElems.Button1 = button1
			self.GuiElems.Button2 = button2
			self.GuiElems.MarkerFrame = markerFrame

			return newFrame
		end

		funcs.Update = function(self,nocallback)
			local total = self.TotalSpace
			local visible = self.VisibleSpace
			local index = self.Index
			local button1 = self.GuiElems.Button1
			local button2 = self.GuiElems.Button2

			self.Index = math.clamp(self.Index, 0, math.max(0, total - visible))

			if self.LastTotalSpace ~= self.TotalSpace then
				self.LastTotalSpace = self.TotalSpace
				self:UpdateMarkers()
			end

			if self:CanScrollUp() then
				for i,v in pairs(button1.Arrow:GetChildren()) do
					v.BackgroundTransparency = 0
				end
			else
				button1.BackgroundTransparency = 1
				for i,v in pairs(button1.Arrow:GetChildren()) do
					v.BackgroundTransparency = 0.5
				end
			end
			if self:CanScrollDown() then
				for i,v in pairs(button2.Arrow:GetChildren()) do
					v.BackgroundTransparency = 0
				end
			else
				button2.BackgroundTransparency = 1
				for i,v in pairs(button2.Arrow:GetChildren()) do
					v.BackgroundTransparency = 0.5
				end
			end

			drawThumb(self)
		end

		funcs.UpdateMarkers = function(self)
			local markerFrame = self.GuiElems.MarkerFrame
			markerFrame:ClearAllChildren()

			for i,v in pairs(self.Markers) do
				if i < self.TotalSpace then
					createSimple("Frame", {
						BackgroundTransparency = 0,
						BackgroundColor3 = v,
						BorderSizePixel = 0,
						Position = self.Horizontal and UDim2.new(i/self.TotalSpace,0,1,-6) or UDim2.new(1,-6,i/self.TotalSpace,0),
						Size = self.Horizontal and UDim2.new(0,1,0,6) or UDim2.new(0,6,0,1),
						Name = "Marker"..tostring(i),
						Parent = markerFrame
					})
				end
			end
		end

		funcs.AddMarker = function(self,ind,color)
			self.Markers[ind] = color or Color3.new(0,0,0)
		end
		funcs.ScrollTo = function(self, ind, nocallback)
			self.Index = ind
			self:Update()
			if not nocallback then
				self.Scrolled:Fire()
			end
		end
		funcs.ScrollUp = function(self)
			self.Index = self.Index - self.Increment
			self:Update()
		end
		funcs.CanScroll = function(self, direction)
			if direction == "Up" then
				return self:CanScrollUp()
			elseif direction == "Down" then
				return self:CanScrollDown()
			end
			return false
		end
		funcs.ScrollDown = function(self)
			self.Index = self.Index + self.Increment
			self:Update()
		end
		funcs.CanScrollUp = function(self)
			return self.Index > 0
		end
		funcs.CanScrollDown = function(self)
			return self.Index + self.VisibleSpace < self.TotalSpace
		end
		funcs.GetScrollPercent = function(self)
			return self.Index/(self.TotalSpace-self.VisibleSpace)
		end
		funcs.SetScrollPercent = function(self,perc)
			self.Index = math.floor(perc*(self.TotalSpace-self.VisibleSpace))
			self:Update()
		end
		funcs.ScrollToDirection = function(self, Direaction)
			if Direaction == "Up" then
				self:ScrollUp()
			elseif Direaction == "Down" then
				self:ScrollDown()
			end
		end

		funcs.Texture = function(self,data)
			self.ThumbColor = data.ThumbColor or Color3.new(0,0,0)
			self.ThumbSelectColor = data.ThumbSelectColor or Color3.new(0,0,0)
			self.GuiElems.ScrollThumb.BackgroundColor3 = data.ThumbColor or Color3.new(0,0,0)
			self.Gui.BackgroundColor3 = data.FrameColor or Color3.new(0,0,0)
			self.GuiElems.Button1.BackgroundColor3 = data.ButtonColor or Color3.new(0,0,0)
			self.GuiElems.Button2.BackgroundColor3 = data.ButtonColor or Color3.new(0,0,0)
			for i,v in pairs(self.GuiElems.Button1.Arrow:GetChildren()) do
				v.BackgroundColor3 = data.ArrowColor or Color3.new(0,0,0)
			end
			for i,v in pairs(self.GuiElems.Button2.Arrow:GetChildren()) do
				v.BackgroundColor3 = data.ArrowColor or Color3.new(0,0,0)
			end
		end

		funcs.SetScrollFrame = function(self,frame)
			if self.ScrollUpEvent then self.ScrollUpEvent:Disconnect() self.ScrollUpEvent = nil end
			if self.ScrollDownEvent then self.ScrollDownEvent:Disconnect() self.ScrollDownEvent = nil end
			self.ScrollUpEvent = frame.MouseWheelForward:Connect(function() self:ScrollTo(self.Index - self.WheelIncrement) end)
			self.ScrollDownEvent = frame.MouseWheelBackward:Connect(function() self:ScrollTo(self.Index + self.WheelIncrement) end)
		end

		local mt = {}
		mt.__index = funcs

		local function new(hor)
			local obj = setmetatable({
				Index = 0,
				VisibleSpace = 0,
				TotalSpace = 0,
				Increment = 1,
				WheelIncrement = 1,
				Markers = {},
				GuiElems = {},
				Horizontal = hor,
				LastTotalSpace = 0,
				Scrolled = Lib.Signal.new()
			},mt)
			obj.Gui = createFrame(obj)
			obj:Texture({
				ThumbColor = Color3.fromRGB(60,60,60),
				ThumbSelectColor = Color3.fromRGB(75,75,75),
				ArrowColor = Color3.new(1,1,1),
				FrameColor = Color3.fromRGB(40,40,40),
				ButtonColor = Color3.fromRGB(75,75,75)
			})
			return obj
		end

		return {new = new}
	end)()

	Lib.Window = (function()
		local funcs = {}
		local static = {MinWidth = 200, FreeWidth = 200}
		local mouse = plr:GetMouse()
		local sidesGui,alignIndicator
		local visibleWindows = {}
		local leftSide = {Width = 300, Windows = {}, ResizeCons = {}, Hidden = true}
		local rightSide = {Width = 300, Windows = {}, ResizeCons = {}, Hidden = true}

		local displayOrderStart
		local sideDisplayOrder
		local sideTweenInfo = TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		local tweens = {}
		local isA = game.IsA

		local theme = {
			MainColor1 = Color3.fromRGB(52,52,52),
			MainColor2 = Color3.fromRGB(45,45,45),
			Button = Color3.fromRGB(60,60,60)
		}

		local function stopTweens()
			for i = 1,#tweens do
				tweens[i]:Cancel()
			end
			tweens = {}
		end

		local function resizeHook(self,resizer,dir)
			local pressing = false
			
			local guiMain = self.GuiElems.Main
			
			resizer.MouseEnter:Connect(function() resizer.BackgroundTransparency = 0.5 end)
			resizer.MouseButton1Down:Connect(function() pressing = true resizer.BackgroundTransparency = 0.5 end)
			resizer.MouseButton1Up:Connect(function() pressing = false resizer.BackgroundTransparency = 1 end)
			
			
			
			resizer.InputBegan:Connect(function(input)
				if not self.Dragging and not self.Resizing and self.Resizable and self.ResizableInternal and pressing then
					local isH = dir:find("[WE]") and true
					local isV = dir:find("[NS]") and true
					local signX = dir:find("W",1,true) and -1 or 1
					local signY = dir:find("N",1,true) and -1 or 1

					if self.Minimized and isV then return end
					
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						
						local releaseEvent, mouseEvent

						local offX = input.Position.X - resizer.AbsolutePosition.X
						local offY = input.Position.Y - resizer.AbsolutePosition.Y

						self.Resizing = resizer
						
						releaseEvent = service.UserInputService.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								releaseEvent:Disconnect()
								if mouseEvent then mouseEvent:Disconnect() end
								self.Resizing = false
								resizer.BackgroundTransparency = 1
							end
						end)

						mouseEvent = service.UserInputService.InputChanged:Connect(function(input)
							if self.Resizable and self.ResizableInternal and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
								self:StopTweens()
								local deltaX = input.Position.X - resizer.AbsolutePosition.X - offX
								local deltaY = input.Position.Y - resizer.AbsolutePosition.Y - offY

								if guiMain.AbsoluteSize.X + deltaX * signX < self.MinX then deltaX = signX * (self.MinX - guiMain.AbsoluteSize.X) end
								if guiMain.AbsoluteSize.Y + deltaY * signY < self.MinY then deltaY = signY * (self.MinY - guiMain.AbsoluteSize.Y) end
								if signY < 0 and guiMain.AbsolutePosition.Y + deltaY < 0 then deltaY = -guiMain.AbsolutePosition.Y end

								guiMain.Position = guiMain.Position + UDim2.new(0, (signX < 0 and deltaX or 0), 0, (signY < 0 and deltaY or 0))
								self.SizeX = self.SizeX + (isH and deltaX * signX or 0)
								self.SizeY = self.SizeY + (isV and deltaY * signY or 0)
								guiMain.Size = UDim2.new(0, self.SizeX, 0, self.Minimized and 20 or self.SizeY)
							end
						end)
					end
				end
			end)

			resizer.InputEnded:Connect(function(input)
				--if input.UserInputType == Enum.UserInputType.Touch and Main.AllowDraggableOnMobile == false then return end
				if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and self.Resizing ~= resizer then
					resizer.BackgroundTransparency = 1
				end
			end)
		end

		local updateWindows

		local function moveToTop(window)
			local found = table.find(visibleWindows,window)
			if found then
				table.remove(visibleWindows,found)
				table.insert(visibleWindows,1,window)
				updateWindows()
			end
		end

		local function sideHasRoom(side,neededSize)
			local maxY = sidesGui.AbsoluteSize.Y - (math.max(0,#side.Windows - 1) * 4)
			local inc = 0
			for i,v in pairs(side.Windows) do
				inc = inc + (v.MinY or 100)
				if inc > maxY - neededSize then return false end
			end

			return true
		end

		local function getSideInsertPos(side,curY)
			local pos = #side.Windows + 1
			local range = {0,sidesGui.AbsoluteSize.Y}

			for i,v in pairs(side.Windows) do
				local midPos = v.PosY + v.SizeY/2
				if curY <= midPos then
					pos = i
					range[2] = midPos
					break
				else
					range[1] = midPos
				end
			end

			return pos,range
		end

		local function focusInput(self,obj)
			if isA(obj,"GuiButton") then
				obj.MouseButton1Down:Connect(function()
					moveToTop(self)
				end)
			elseif isA(obj,"TextBox") then
				obj.Focused:Connect(function()
					moveToTop(self)
				end)
			end
		end

		local createGui = function(self)
			local gui = create({
				{1,"ScreenGui",{Name="Window",}},
				{2,"Frame",{Active=true,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="Main",Parent={1},Position=UDim2.new(0.40000000596046,0,0.40000000596046,0),Size=UDim2.new(0,300,0,300),}},
				--[[background mod set to 0.05]]	{3,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,Name="Content",Parent={2},Position=UDim2.new(0,0,0,20),Size=UDim2.new(1,0,1,-20),ClipsDescendants=true}},
				{4,"Frame",{BackgroundColor3=Color3.fromRGB(33,33,33),BorderSizePixel=0,Name="Line",Parent={3},Size=UDim2.new(1,0,0,1),}},
				{5,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="TopBar",Parent={2},Size=UDim2.new(1,0,0,20),Text = ""}},
				{6,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={5},Position=UDim2.new(0,5,0,0),Size=UDim2.new(1,-10,0,20),Text="Window",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0}},
				{7,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Close",Parent={5},Position=UDim2.new(1,-18,0,2),Size=UDim2.new(0,16,0,16),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
				{8,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5054663650",Parent={7},Position=UDim2.new(0,3,0,3),Size=UDim2.new(0,10,0,10),}},
				{9,"UICorner",{CornerRadius=UDim.new(0,4),Parent={7},}},
				--[[lol mod]]	{9,"UICorner",{CornerRadius=UDim.new(0,4),Parent={2},}},
				{10,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Minimize",Parent={5},Position=UDim2.new(1,-36,0,2),Size=UDim2.new(0,16,0,16),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
				{11,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5034768003",Parent={10},Position=UDim2.new(0,3,0,3),Size=UDim2.new(0,10,0,10),}},
				{12,"UICorner",{CornerRadius=UDim.new(0,4),Parent={10},}},
				{13,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Image="rbxassetid://1427967925",Name="Outlines",Parent={2},Position=UDim2.new(0,-5,0,-5),ScaleType=1,Size=UDim2.new(1,10,1,10),SliceCenter=Rect.new(6,6,25,25),TileSize=UDim2.new(0,20,0,20),}},
				{14,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="ResizeControls",Parent={2},Position=UDim2.new(0,-5,0,-5),Size=UDim2.new(1,10,1,10),}},
				{15,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="North",Parent={14},Position=UDim2.new(0,5,0,0),Size=UDim2.new(1,-10,0,5),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{16,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="South",Parent={14},Position=UDim2.new(0,5,1,-5),Size=UDim2.new(1,-10,0,5),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{17,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="NorthEast",Parent={14},Position=UDim2.new(1,-5,0,0),Size=UDim2.new(0,5,0,5),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{18,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="East",Parent={14},Position=UDim2.new(1,-5,0,5),Size=UDim2.new(0,5,1,-10),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{19,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="West",Parent={14},Position=UDim2.new(0,0,0,5),Size=UDim2.new(0,5,1,-10),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{20,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="SouthEast",Parent={14},Position=UDim2.new(1,-5,1,-5),Size=UDim2.new(0,5,0,5),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{21,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="NorthWest",Parent={14},Size=UDim2.new(0,5,0,5),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{22,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="SouthWest",Parent={14},Position=UDim2.new(0,0,1,-5),Size=UDim2.new(0,5,0,5),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
			})

			local guiMain = gui.Main
			local guiTopBar = guiMain.TopBar
			local guiResizeControls = guiMain.ResizeControls

			self.GuiElems.Main = guiMain
			self.GuiElems.TopBar = guiMain.TopBar
			self.GuiElems.Content = guiMain.Content
			self.GuiElems.Line = guiMain.Content.Line
			self.GuiElems.Outlines = guiMain.Outlines
			self.GuiElems.Title = guiTopBar.Title
			self.GuiElems.Close = guiTopBar.Close
			self.GuiElems.Minimize = guiTopBar.Minimize
			self.GuiElems.ResizeControls = guiResizeControls
			self.ContentPane = guiMain.Content
			
			local ButtonDown = false
			guiTopBar.MouseButton1Down:Connect(function() ButtonDown = true end)
			guiTopBar.MouseButton1Up:Connect(function() ButtonDown = false end)

			if Settings.Window.TitleOnMiddle then
				self.GuiElems.Title.TextXAlignment = 2
				self.GuiElems.Title.Size = UDim2.new(1,-20,0,20)
			end

			if Settings.Window.Transparency then
				self.GuiElems.Content.BackgroundTransparency = Settings.Window.Transparency
				--self.GuiElems
			end


			guiTopBar.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					if self.Draggable then
						local releaseEvent, mouseEvent

						local maxX = sidesGui.AbsoluteSize.X
						local initX = guiMain.AbsolutePosition.X
						local initY = guiMain.AbsolutePosition.Y
						local offX = input.Position.X - initX
						local offY = input.Position.Y - initY

						local alignInsertPos, alignInsertSide

						guiDragging = true

						releaseEvent = service.UserInputService.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								releaseEvent:Disconnect()
								if mouseEvent then mouseEvent:Disconnect() end
								guiDragging = false
								alignIndicator.Parent = nil
								if alignInsertSide then
									local targetSide = (alignInsertSide == "left" and leftSide) or (alignInsertSide == "right" and rightSide)
									self:AlignTo(targetSide, alignInsertPos)
								end
							end
						end)

						mouseEvent = service.UserInputService.InputChanged:Connect(function(input)
							if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and self.Draggable and not self.Closed and ButtonDown then
								if self.Aligned then
									if leftSide.Resizing or rightSide.Resizing then return end
									local posX, posY = input.Position.X - offX, input.Position.Y - offY
									local delta = math.sqrt((posX - initX)^2 + (posY - initY)^2)
									if delta >= 5 then
										self:SetAligned(false)
									end
								else
									local inputX, inputY = input.Position.X, input.Position.Y
									local posX, posY = inputX - offX, inputY - offY
									if posY < 0 then posY = 0 end
									guiMain.Position = UDim2.new(0, posX, 0, posY)

									if self.Resizable and self.Alignable then
										if inputX < 25 then
											if sideHasRoom(leftSide, self.MinY or 100) then
												local insertPos, range = getSideInsertPos(leftSide, inputY)
												alignIndicator.Indicator.Position = UDim2.new(0, -15, 0, range[1])
												alignIndicator.Indicator.Size = UDim2.new(0, 40, 0, range[2] - range[1])
												Lib.ShowGui(alignIndicator)
												alignInsertPos = insertPos
												alignInsertSide = "left"
												return
											end
										elseif inputX >= maxX - 25 then
											if sideHasRoom(rightSide, self.MinY or 100) then
												local insertPos, range = getSideInsertPos(rightSide, inputY)
												alignIndicator.Indicator.Position = UDim2.new(0, maxX - 25, 0, range[1])
												alignIndicator.Indicator.Size = UDim2.new(0, 40, 0, range[2] - range[1])
												Lib.ShowGui(alignIndicator)
												alignInsertPos = insertPos
												alignInsertSide = "right"
												return
											end
										end
									end
									alignIndicator.Parent = nil
									alignInsertPos = nil
									alignInsertSide = nil
								end
							end
						end)
					end
				end
			end)

			guiTopBar.Close.MouseButton1Click:Connect(function()
				if self.Closed then return end
				self:Close()
			end)

			guiTopBar.Minimize.MouseButton1Click:Connect(function()
				if self.Closed then return end
				if self.Aligned then
					self:SetAligned(false)
				else
					self:SetMinimized()
				end
			end)

			guiTopBar.Minimize.MouseButton2Click:Connect(function()
				if self.Closed then return end
				if not self.Aligned then
					self:SetMinimized(nil,2)
					guiTopBar.Minimize.BackgroundTransparency = 1
				end
			end)

			guiMain.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch and not self.Aligned and not self.Closed then
					moveToTop(self)
				end
			end)

			guiMain:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				local absPos = guiMain.AbsolutePosition
				self.PosX = absPos.X
				self.PosY = absPos.Y
			end)

			resizeHook(self,guiResizeControls.North,"N")
			resizeHook(self,guiResizeControls.NorthEast,"NE")
			resizeHook(self,guiResizeControls.East,"E")
			resizeHook(self,guiResizeControls.SouthEast,"SE")
			resizeHook(self,guiResizeControls.South,"S")
			resizeHook(self,guiResizeControls.SouthWest,"SW")
			resizeHook(self,guiResizeControls.West,"W")
			resizeHook(self,guiResizeControls.NorthWest,"NW")

			guiMain.Size = UDim2.new(0,self.SizeX,0,self.SizeY)

			gui.DescendantAdded:Connect(function(obj) focusInput(self,obj) end)
			local descs = gui:GetDescendants()
			for i = 1,#descs do
				focusInput(self,descs[i])
			end

			self.MinimizeAnim = Lib.ButtonAnim(guiTopBar.Minimize)
			self.CloseAnim = Lib.ButtonAnim(guiTopBar.Close)

			return gui
		end

		local function updateSideFrames(noTween)
			stopTweens()
			leftSide.Frame.Size = UDim2.new(0,leftSide.Width,1,0)
			rightSide.Frame.Size = UDim2.new(0,rightSide.Width,1,0)
			leftSide.Frame.Resizer.Position = UDim2.new(0,leftSide.Width,0,0)
			rightSide.Frame.Resizer.Position = UDim2.new(0,-5,0,0)

			--leftSide.Frame.Visible = (#leftSide.Windows > 0)
			--rightSide.Frame.Visible = (#rightSide.Windows > 0)

			--[[if #leftSide.Windows > 0 and leftSide.Frame.Position == UDim2.new(0,-leftSide.Width-5,0,0) then
				leftSide.Frame:TweenPosition(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.3,true)
			elseif #leftSide.Windows == 0 and leftSide.Frame.Position == UDim2.new(0,0,0,0) then
				leftSide.Frame:TweenPosition(UDim2.new(0,-leftSide.Width-5,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.3,true)
			end
			local rightTweenPos = (#rightSide.Windows == 0 and UDim2.new(1,5,0,0) or UDim2.new(1,-rightSide.Width,0,0))
			rightSide.Frame:TweenPosition(rightTweenPos,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.3,true)]]
			local leftHidden = #leftSide.Windows == 0 or leftSide.Hidden
			local rightHidden = #rightSide.Windows == 0 or rightSide.Hidden
			local leftPos = (leftHidden and UDim2.new(0,-leftSide.Width-10,0,0) or UDim2.new(0,0,0,0))
			local rightPos = (rightHidden and UDim2.new(1,10,0,0) or UDim2.new(1,-rightSide.Width,0,0))

			sidesGui.LeftToggle.Text = leftHidden and ">" or "<"
			sidesGui.RightToggle.Text = rightHidden and "<" or ">"

			if not noTween then
				local function insertTween(...)
					local tween = service.TweenService:Create(...)
					tweens[#tweens+1] = tween
					tween:Play()
				end
				insertTween(leftSide.Frame,sideTweenInfo,{Position = leftPos})
				insertTween(rightSide.Frame,sideTweenInfo,{Position = rightPos})
				insertTween(sidesGui.LeftToggle,sideTweenInfo,{Position = UDim2.new(0,#leftSide.Windows == 0 and -16 or 0,0,-36)})
				insertTween(sidesGui.RightToggle,sideTweenInfo,{Position = UDim2.new(1,#rightSide.Windows == 0 and 0 or -16,0,-36)})
			else
				leftSide.Frame.Position = leftPos
				rightSide.Frame.Position = rightPos
				sidesGui.LeftToggle.Position = UDim2.new(0,#leftSide.Windows == 0 and -16 or 0,0,-36)
				sidesGui.RightToggle.Position = UDim2.new(1,#rightSide.Windows == 0 and 0 or -16,0,-36)
			end
		end

		local function getSideFramePos(side)
			local leftHidden = #leftSide.Windows == 0 or leftSide.Hidden
			local rightHidden = #rightSide.Windows == 0 or rightSide.Hidden
			if side == leftSide then
				return (leftHidden and UDim2.new(0,-leftSide.Width-10,0,0) or UDim2.new(0,0,0,0))
			else
				return (rightHidden and UDim2.new(1,10,0,0) or UDim2.new(1,-rightSide.Width,0,0))
			end
		end

		local function sideResized(side)
			local currentPos = 0
			local sideFramePos = getSideFramePos(side)
			for i,v in pairs(side.Windows) do
				v.SizeX = side.Width
				v.GuiElems.Main.Size = UDim2.new(0,side.Width,0,v.SizeY)
				v.GuiElems.Main.Position = UDim2.new(sideFramePos.X.Scale,sideFramePos.X.Offset,0,currentPos)
				currentPos = currentPos + v.SizeY+4
			end
		end

		local function sideResizerHook(resizer,dir,side,pos)
			local pressing = false
			
			local mouse = Main.Mouse
			local windows = side.Windows

			resizer.MouseEnter:Connect(function() resizer.BackgroundColor3 = theme.MainColor2 end)
			resizer.MouseButton1Down:Connect(function() pressing = true resizer.BackgroundColor3 = theme.MainColor2 end)
			resizer.MouseButton1Up:Connect(function() pressing = false resizer.BackgroundColor3 = theme.Button end)


			resizer.InputBegan:Connect(function(input)
				if not side.Resizing and pressing then
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						resizer.BackgroundColor3 = theme.MainColor2
					end 
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						local releaseEvent,mouseEvent

						local offX = mouse.X - resizer.AbsolutePosition.X
						local offY = mouse.Y - resizer.AbsolutePosition.Y

						side.Resizing = resizer
						resizer.BackgroundColor3 = theme.MainColor2

						releaseEvent = service.UserInputService.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								releaseEvent:Disconnect()
								mouseEvent:Disconnect()
								side.Resizing = false
								resizer.BackgroundColor3 = theme.Button
							end
						end)

						mouseEvent = service.UserInputService.InputChanged:Connect(function(input)
							if not resizer.Parent then
								releaseEvent:Disconnect()
								mouseEvent:Disconnect()
								side.Resizing = false
								return
							end
							if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
								if dir == "V" then
									local delta = input.Position.Y - resizer.AbsolutePosition.Y - offY

									if delta > 0 then
										local neededSize = delta
										for i = pos+1,#windows do
											local window = windows[i]
											local newSize = math.max(window.SizeY-neededSize,(window.MinY or 100))
											neededSize = neededSize - (window.SizeY - newSize)
											window.SizeY = newSize
										end
										windows[pos].SizeY = windows[pos].SizeY + math.max(0,delta-neededSize)
									else
										local neededSize = -delta
										for i = pos,1,-1 do
											local window = windows[i]
											local newSize = math.max(window.SizeY-neededSize,(window.MinY or 100))
											neededSize = neededSize - (window.SizeY - newSize)
											window.SizeY = newSize
										end
										windows[pos+1].SizeY = windows[pos+1].SizeY + math.max(0,-delta-neededSize)
									end

									updateSideFrames()
									sideResized(side)
								elseif dir == "H" then
									local maxWidth = math.max(300,sidesGui.AbsoluteSize.X-static.FreeWidth)
									local otherSide = (side == leftSide and rightSide or leftSide)
									local delta = input.Position.X - resizer.AbsolutePosition.X - offX
									delta = (side == leftSide and delta or -delta)

									local proposedSize = math.max(static.MinWidth,side.Width + delta)
									if proposedSize + otherSide.Width <= maxWidth then
										side.Width = proposedSize
									else
										local newOtherSize = maxWidth - proposedSize
										if newOtherSize >= static.MinWidth then
											side.Width = proposedSize
											otherSide.Width = newOtherSize
										else
											side.Width = maxWidth - static.MinWidth
											otherSide.Width = static.MinWidth
										end
									end

									updateSideFrames(true)
									sideResized(side)
									sideResized(otherSide)
								end
							end
						end)
					end
				end
			end)

			resizer.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch and side.Resizing ~= resizer then
					resizer.BackgroundColor3 = theme.Button
				end
			end)
		end

		local function renderSide(side,noTween) -- TODO: Use existing resizers
			local currentPos = 0
			local sideFramePos = getSideFramePos(side)
			local template = side.WindowResizer:Clone()
			for i,v in pairs(side.ResizeCons) do v:Disconnect() end
			for i,v in pairs(side.Frame:GetChildren()) do if v.Name == "WindowResizer" then v:Destroy() end end
			side.ResizeCons = {}
			side.Resizing = nil

			for i,v in pairs(side.Windows) do
				v.SidePos = i
				local isEnd = i == #side.Windows
				local size = UDim2.new(0,side.Width,0,v.SizeY)
				local pos = UDim2.new(sideFramePos.X.Scale,sideFramePos.X.Offset,0,currentPos)
				Lib.ShowGui(v.Gui)
				--v.GuiElems.Main:TweenSizeAndPosition(size,pos,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.3,true)
				if noTween then
					v.GuiElems.Main.Size = size
					v.GuiElems.Main.Position = pos
				else
					local tween = service.TweenService:Create(v.GuiElems.Main,sideTweenInfo,{Size = size, Position = pos})
					tweens[#tweens+1] = tween
					tween:Play()
				end
				currentPos = currentPos + v.SizeY+4

				if not isEnd then
					local newTemplate = template:Clone()
					newTemplate.Position = UDim2.new(1,-side.Width,0,currentPos-4)
					side.ResizeCons[#side.ResizeCons+1] = v.Gui.Main:GetPropertyChangedSignal("Size"):Connect(function()
						newTemplate.Position = UDim2.new(1,-side.Width,0, v.GuiElems.Main.Position.Y.Offset + v.GuiElems.Main.Size.Y.Offset)
					end)
					side.ResizeCons[#side.ResizeCons+1] = v.Gui.Main:GetPropertyChangedSignal("Position"):Connect(function()
						newTemplate.Position = UDim2.new(1,-side.Width,0, v.GuiElems.Main.Position.Y.Offset + v.GuiElems.Main.Size.Y.Offset)
					end)
					sideResizerHook(newTemplate,"V",side,i)
					newTemplate.Parent = side.Frame
				end
			end

			--side.Frame.Back.Position = UDim2.new(0,0,0,0)
			--side.Frame.Back.Size = UDim2.new(0,side.Width,1,0)
		end

		local function updateSide(side,noTween)
			local oldHeight = 0
			local currentPos = 0
			local neededSize = 0
			local windows = side.Windows
			local height = sidesGui.AbsoluteSize.Y - (math.max(0,#windows - 1) * 4)

			for i,v in pairs(windows) do oldHeight = oldHeight + v.SizeY end
			for i,v in pairs(windows) do
				if i == #windows then
					v.SizeY = height-currentPos
					neededSize = math.max(0,(v.MinY or 100)-v.SizeY)
				else
					v.SizeY = math.max(math.floor(v.SizeY/oldHeight*height),v.MinY or 100)
				end
				currentPos = currentPos + v.SizeY
			end

			if neededSize > 0 then
				for i = #windows-1,1,-1 do
					local window = windows[i]
					local newSize = math.max(window.SizeY-neededSize,(window.MinY or 100))
					neededSize = neededSize - (window.SizeY - newSize)
					window.SizeY = newSize
				end
				local lastWindow = windows[#windows]
				lastWindow.SizeY = (lastWindow.MinY or 100)-neededSize
			end
			renderSide(side,noTween)
		end

		updateWindows = function(noTween)
			updateSideFrames(noTween)
			updateSide(leftSide,noTween)
			updateSide(rightSide,noTween)
			local count = 0
			for i = #visibleWindows,1,-1 do
				visibleWindows[i].Gui.DisplayOrder = displayOrderStart + count
				Lib.ShowGui(visibleWindows[i].Gui)
				count = count + 1
			end

			--[[local leftTweenPos = (#leftSide.Windows == 0 and UDim2.new(0,-leftSide.Width-5,0,0) or UDim2.new(0,0,0,0))
			leftSide.Frame:TweenPosition(leftTweenPos,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.3,true)
			local rightTweenPos = (#rightSide.Windows == 0 and UDim2.new(1,5,0,0) or UDim2.new(1,-rightSide.Width,0,0))
			rightSide.Frame:TweenPosition(rightTweenPos,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.3,true)]]
		end

		funcs.SetMinimized = function(self,set,mode)
			local oldVal = self.Minimized
			local newVal
			if set == nil then newVal = not self.Minimized else newVal = set end
			self.Minimized = newVal
			if not mode then mode = 1 end

			local resizeControls = self.GuiElems.ResizeControls
			local minimizeControls = {"North","NorthEast","NorthWest","South","SouthEast","SouthWest"}
			for i = 1,#minimizeControls do
				local control = resizeControls:FindFirstChild(minimizeControls[i])
				if control then control.Visible = not newVal end
			end

			if mode == 1 or mode == 2 then
				self:StopTweens()
				if mode == 1 then
					self.GuiElems.Main:TweenSize(UDim2.new(0,self.SizeX,0,newVal and 20 or self.SizeY),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
				else
					local maxY = sidesGui.AbsoluteSize.Y
					local newPos = UDim2.new(0,self.PosX,0,newVal and math.min(maxY-20,self.PosY + self.SizeY - 20) or math.max(0,self.PosY - self.SizeY + 20))

					self.GuiElems.Main:TweenPosition(newPos,Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
					self.GuiElems.Main:TweenSize(UDim2.new(0,self.SizeX,0,newVal and 20 or self.SizeY),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
				end
				self.GuiElems.Minimize.ImageLabel.Image = newVal and "rbxassetid://5060023708" or "rbxassetid://5034768003"
			end

			if oldVal ~= newVal then
				if newVal then
					self.OnMinimize:Fire()
				else
					self.OnRestore:Fire()
				end
			end
		end

		funcs.Resize = function(self,sizeX,sizeY)
			self.SizeX = sizeX or self.SizeX
			self.SizeY = sizeY or self.SizeY
			self.GuiElems.Main.Size = UDim2.new(0,self.SizeX,0,self.SizeY)
		end

		funcs.SetSize = funcs.Resize

		funcs.SetTitle = function(self,title)
			self.GuiElems.Title.Text = title
		end

		funcs.SetResizable = function(self,val)
			self.Resizable = val
			self.GuiElems.ResizeControls.Visible = self.Resizable and self.ResizableInternal
		end

		funcs.SetResizableInternal = function(self,val)
			self.ResizableInternal = val
			self.GuiElems.ResizeControls.Visible = self.Resizable and self.ResizableInternal
		end

		funcs.SetAligned = function(self,val)
			self.Aligned = val
			self:SetResizableInternal(not val)
			self.GuiElems.Main.Active = not val
			self.GuiElems.Main.Outlines.Visible = not val
			if not val then
				for i,v in pairs(leftSide.Windows) do if v == self then table.remove(leftSide.Windows,i) break end end
				for i,v in pairs(rightSide.Windows) do if v == self then table.remove(rightSide.Windows,i) break end end
				if not table.find(visibleWindows,self) then table.insert(visibleWindows,1,self) end
				self.GuiElems.Minimize.ImageLabel.Image = "rbxassetid://5034768003"
				self.Side = nil
				updateWindows()
			else
				self:SetMinimized(false,3)
				for i,v in pairs(visibleWindows) do if v == self then table.remove(visibleWindows,i) break end end
				self.GuiElems.Minimize.ImageLabel.Image = "rbxassetid://5448127505"
			end
		end

		funcs.Add = function(self,obj,name)
			if type(obj) == "table" and obj.Gui and obj.Gui:IsA("GuiObject") then
				obj.Gui.Parent = self.ContentPane
			else
				obj.Parent = self.ContentPane
			end
			if name then self.Elements[name] = obj end
		end

		funcs.GetElement = function(self,obj,name)
			return self.Elements[name]
		end

		funcs.AlignTo = function(self,side,pos,size,silent)
			if table.find(side.Windows,self) or self.Closed then return end

			size = size or self.SizeY
			if size > 0 and size <= 1 then
				local totalSideHeight = 0
				for i,v in pairs(side.Windows) do totalSideHeight = totalSideHeight + v.SizeY end
				self.SizeY = (totalSideHeight > 0 and totalSideHeight * size * 2) or size
			else
				self.SizeY = (size > 0 and size or 100)
			end

			self:SetAligned(true)
			self.Side = side
			self.SizeX = side.Width
			self.Gui.DisplayOrder = sideDisplayOrder + 1
			for i,v in pairs(side.Windows) do v.Gui.DisplayOrder = sideDisplayOrder end
			pos = math.min(#side.Windows+1, pos or 1)
			self.SidePos = pos
			table.insert(side.Windows, pos, self)

			if not silent then
				side.Hidden = false
			end
			updateWindows(silent)
		end

		funcs.Close = function(self)
			self.Closed = true
			self:SetResizableInternal(false)

			Lib.FindAndRemove(leftSide.Windows,self)
			Lib.FindAndRemove(rightSide.Windows,self)
			Lib.FindAndRemove(visibleWindows,self)

			self.MinimizeAnim.Disable()
			self.CloseAnim.Disable()
			self.ClosedSide = self.Side
			self.Side = nil
			self.OnDeactivate:Fire()

			if not self.Aligned then
				self:StopTweens()
				local ti = TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)

				local closeTime = tick()
				self.LastClose = closeTime

				self:DoTween(self.GuiElems.Main,ti,{Size = UDim2.new(0,self.SizeX,0,20)})
				self:DoTween(self.GuiElems.Title,ti,{TextTransparency = 1})
				self:DoTween(self.GuiElems.Minimize.ImageLabel,ti,{ImageTransparency = 1})
				self:DoTween(self.GuiElems.Close.ImageLabel,ti,{ImageTransparency = 1})
				Lib.FastWait(0.2)
				if closeTime ~= self.LastClose then return end

				self:DoTween(self.GuiElems.TopBar,ti,{BackgroundTransparency = 1})
				self:DoTween(self.GuiElems.Outlines,ti,{ImageTransparency = 1})
				Lib.FastWait(0.2)
				if closeTime ~= self.LastClose then return end
			end

			self.Aligned = false
			self.Gui.Parent = nil
			updateWindows(true)
		end

		funcs.Hide = funcs.Close

		funcs.IsVisible = function(self)
			return not self.Closed and ((self.Side and not self.Side.Hidden) or not self.Side)
		end

		funcs.IsContentVisible = function(self)
			return self:IsVisible() and not self.Minimized
		end

		funcs.Focus = function(self)
			moveToTop(self)
		end

		funcs.MoveInBoundary = function(self)
			local posX,posY = self.PosX,self.PosY
			local maxX,maxY = sidesGui.AbsoluteSize.X,sidesGui.AbsoluteSize.Y
			posX = math.min(posX,maxX-self.SizeX)
			posY = math.min(posY,maxY-20)
			self.GuiElems.Main.Position = UDim2.new(0,posX,0,posY)
		end

		funcs.DoTween = function(self,...)
			local tween = service.TweenService:Create(...)
			self.Tweens[#self.Tweens+1] = tween
			tween:Play()
		end

		funcs.StopTweens = function(self)
			for i,v in pairs(self.Tweens) do
				v:Cancel()
			end
			self.Tweens = {}
		end

		funcs.Show = function(self,data)
			return static.ShowWindow(self,data)
		end

		funcs.ShowAndFocus = function(self,data)
			static.ShowWindow(self,data)
			service.RunService.RenderStepped:wait()
			self:Focus()
		end

		static.ShowWindow = function(window,data)
			data = data or {}
			local align = data.Align
			local pos = data.Pos
			local size = data.Size
			local targetSide = (align == "left" and leftSide) or (align == "right" and rightSide)

			if not window.Closed then
				if not window.Aligned then
					window:SetMinimized(false)
				elseif window.Side and not data.Silent then
					static.SetSideVisible(window.Side,true)
				end
				return
			end

			window.Closed = false
			window.LastClose = tick()
			window.GuiElems.Title.TextTransparency = 0
			window.GuiElems.Minimize.ImageLabel.ImageTransparency = 0
			window.GuiElems.Close.ImageLabel.ImageTransparency = 0
			window.GuiElems.TopBar.BackgroundTransparency = 0
			window.GuiElems.Outlines.ImageTransparency = 0
			window.GuiElems.Minimize.ImageLabel.Image = "rbxassetid://5034768003"
			window.GuiElems.Main.Active = true
			window.GuiElems.Main.Outlines.Visible = true
			window:SetMinimized(false,3)
			window:SetResizableInternal(true)
			window.MinimizeAnim.Enable()
			window.CloseAnim.Enable()

			if align then
				window:AlignTo(targetSide,pos,size,data.Silent)
			else
				if align == nil and window.ClosedSide then -- Regular open
					window:AlignTo(window.ClosedSide,window.SidePos,size,true)
					static.SetSideVisible(window.ClosedSide,true)
				else
					if table.find(visibleWindows,window) then return end

					-- TODO: make better
					window.GuiElems.Main.Size = UDim2.new(0,window.SizeX,0,20)
					local ti = TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
					window:StopTweens()
					window:DoTween(window.GuiElems.Main,ti,{Size = UDim2.new(0,window.SizeX,0,window.SizeY)})

					window.SizeY = size or window.SizeY
					table.insert(visibleWindows,1,window)
					updateWindows()
				end
			end

			window.ClosedSide = nil
			window.OnActivate:Fire()
		end

		static.ToggleSide = function(name)
			local side = (name == "left" and leftSide or rightSide)
			side.Hidden = not side.Hidden
			for i,v in pairs(side.Windows) do
				if side.Hidden then
					v.OnDeactivate:Fire()
				else
					v.OnActivate:Fire()
				end
			end
			updateWindows()
		end

		static.SetSideVisible = function(s,vis)
			local side = (type(s) == "table" and s) or (s == "left" and leftSide or rightSide)
			side.Hidden = not vis
			for i,v in pairs(side.Windows) do
				if side.Hidden then
					v.OnDeactivate:Fire()
				else
					v.OnActivate:Fire()
				end
			end
			updateWindows()
		end

		static.Init = function()
			displayOrderStart = Main.DisplayOrders.Window
			sideDisplayOrder = Main.DisplayOrders.SideWindow

			sidesGui = Instance.new("ScreenGui")
			local leftFrame = create({
				{1,"Frame",{Active=true,Name="LeftSide",BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,}},
				{2,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2549019753933,0.2549019753933,0.2549019753933),BorderSizePixel=0,Font=3,Name="Resizer",Parent={1},Size=UDim2.new(0,5,1,0),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{3,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderSizePixel=0,Name="Line",Parent={2},Position=UDim2.new(0,0,0,0),Size=UDim2.new(0,1,1,0),}},
				{4,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2549019753933,0.2549019753933,0.2549019753933),BorderSizePixel=0,Font=3,Name="WindowResizer",Parent={1},Position=UDim2.new(1,-300,0,0),Size=UDim2.new(1,0,0,4),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{5,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderSizePixel=0,Name="Line",Parent={4},Size=UDim2.new(1,0,0,1),}},
			})
			leftSide.Frame = leftFrame
			leftFrame.Position = UDim2.new(0,-leftSide.Width-10,0,0)
			leftSide.WindowResizer = leftFrame.WindowResizer
			leftFrame.WindowResizer.Parent = nil
			leftFrame.Parent = sidesGui

			local rightFrame = create({
				{1,"Frame",{Active=true,Name="RightSide",BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,}},
				{2,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2549019753933,0.2549019753933,0.2549019753933),BorderSizePixel=0,Font=3,Name="Resizer",Parent={1},Size=UDim2.new(0,5,1,0),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{3,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderSizePixel=0,Name="Line",Parent={2},Position=UDim2.new(0,4,0,0),Size=UDim2.new(0,1,1,0),}},
				{4,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2549019753933,0.2549019753933,0.2549019753933),BorderSizePixel=0,Font=3,Name="WindowResizer",Parent={1},Position=UDim2.new(1,-300,0,0),Size=UDim2.new(1,0,0,4),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{5,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderSizePixel=0,Name="Line",Parent={4},Size=UDim2.new(1,0,0,1),}},
			})
			rightSide.Frame = rightFrame
			rightFrame.Position = UDim2.new(1,10,0,0)
			rightSide.WindowResizer = rightFrame.WindowResizer
			rightFrame.WindowResizer.Parent = nil
			rightFrame.Parent = sidesGui

			if Settings.Window.Transparency and Settings.Window.Transparency > 0 then
				leftSide.BackgroundTransparency = 1
				rightSide.BackgroundTransparency = 1

				leftFrame.BackgroundTransparency = 1
				rightFrame.BackgroundTransparency = 1
			end

			sideResizerHook(leftFrame.Resizer,"H",leftSide)
			sideResizerHook(rightFrame.Resizer,"H",rightSide)

			alignIndicator = Instance.new("ScreenGui")
			alignIndicator.DisplayOrder = Main.DisplayOrders.Core
			local indicator = Instance.new("Frame",alignIndicator)
			indicator.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
			indicator.BorderSizePixel = 0
			indicator.BackgroundTransparency = 0.8
			indicator.Name = "Indicator"
			local corner = Instance.new("UICorner",indicator)
			corner.CornerRadius = UDim.new(0,10)

			local leftToggle = create({{1,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderMode=2,Font=10,Name="LeftToggle",Position=UDim2.new(0,0,0,-36),Size=UDim2.new(0,16,0,36),Text="<",TextColor3=Color3.new(1,1,1),TextSize=14,}}})
			local rightToggle = leftToggle:Clone()
			rightToggle.Name = "RightToggle"
			rightToggle.Position = UDim2.new(1,-16,0,-36)
			Lib.ButtonAnim(leftToggle,{Mode = 2,PressColor = Color3.fromRGB(32,32,32)})
			Lib.ButtonAnim(rightToggle,{Mode = 2,PressColor = Color3.fromRGB(32,32,32)})

			leftToggle.MouseButton1Click:Connect(function()
				static.ToggleSide("left")
			end)

			rightToggle.MouseButton1Click:Connect(function()
				static.ToggleSide("right")
			end)

			leftToggle.Parent = sidesGui
			rightToggle.Parent = sidesGui

			sidesGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				local maxWidth = math.max(300,sidesGui.AbsoluteSize.X-static.FreeWidth)
				leftSide.Width = math.max(static.MinWidth,math.min(leftSide.Width,maxWidth-rightSide.Width))
				rightSide.Width = math.max(static.MinWidth,math.min(rightSide.Width,maxWidth-leftSide.Width))
				for i = 1,#visibleWindows do
					visibleWindows[i]:MoveInBoundary()
				end
				updateWindows(true)
			end)

			sidesGui.DisplayOrder = sideDisplayOrder - 1
			Lib.ShowGui(sidesGui)
			updateSideFrames()
		end

		local mt = {__index = funcs}
		static.new = function()
			local obj = setmetatable({
				Minimized = false,
				Dragging = false,
				Resizing = false,
				Aligned = false,
				Draggable = true,
				Resizable = true,
				ResizableInternal = true,
				Alignable = true,
				Closed = true,
				SizeX = 300,
				SizeY = 300,
				MinX = 200,
				MinY = 200,
				PosX = 0,
				PosY = 0,
				GuiElems = {},
				Tweens = {},
				Elements = {},
				OnActivate = Lib.Signal.new(),
				OnDeactivate = Lib.Signal.new(),
				OnMinimize = Lib.Signal.new(),
				OnRestore = Lib.Signal.new()
			},mt)
			obj.Gui = createGui(obj)
			return obj
		end

		return static
	end)()

	Lib.ContextMenu = (function()
		local funcs = {}
		local mouse

		local function createGui(self)
			local contextGui = create({
				{1,"ScreenGui",{DisplayOrder=1000000,Name="Context",ZIndexBehavior=1,}},
				{2,"Frame",{Active=true,BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),Name="Main",Parent={1},Position=UDim2.new(0.5,-100,0.5,-150),Size=UDim2.new(0,200,0,100),}},
				{3,"UICorner",{CornerRadius=UDim.new(0,4),Parent={2},}},
				{4,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),Name="Container",Parent={2},Position=UDim2.new(0,1,0,1),Size=UDim2.new(1,-2,1,-2),}},
				{5,"UICorner",{CornerRadius=UDim.new(0,4),Parent={4},}},
				{6,"ScrollingFrame",{Active=true,BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=UDim2.new(0,0,0,0),Name="List",Parent={4},Position=UDim2.new(0,2,0,2),ScrollBarImageColor3=Color3.new(0,0,0),ScrollBarThickness=4,Size=UDim2.new(1,-4,1,-4),VerticalScrollBarInset=1,}},
				{7,"UIListLayout",{Parent={6},SortOrder=2,}},
				{8,"Frame",{BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="SearchFrame",Parent={4},Size=UDim2.new(1,0,0,24),Visible=false,}},
				{9,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.1176470592618,0.1176470592618,0.1176470592618),BorderSizePixel=0,Name="SearchContainer",Parent={8},Position=UDim2.new(0,3,0,3),Size=UDim2.new(1,-6,0,18),}},
				{10,"TextBox",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="SearchBox",Parent={9},PlaceholderColor3=Color3.new(0.39215689897537,0.39215689897537,0.39215689897537),PlaceholderText="Search",Position=UDim2.new(0,4,0,0),Size=UDim2.new(1,-8,0,18),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,}},
				{11,"UICorner",{CornerRadius=UDim.new(0,2),Parent={9},}},
				{12,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderSizePixel=0,Name="Line",Parent={8},Position=UDim2.new(0,0,1,0),Size=UDim2.new(1,0,0,1),}},
				{13,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BackgroundTransparency=1,BorderColor3=Color3.new(0.33725491166115,0.49019610881805,0.73725491762161),BorderSizePixel=0,Font=3,Name="Entry",Parent={1},Size=UDim2.new(1,0,0,22),Text="",TextSize=14,Visible=false,}},
				{14,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="EntryName",Parent={13},Position=UDim2.new(0,24,0,0),Size=UDim2.new(1,-24,1,0),Text="Duplicate",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{15,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Shortcut",Parent={13},Position=UDim2.new(0,24,0,0),Size=UDim2.new(1,-30,1,0),Text="Ctrl+D",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{16,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ImageRectOffset=Vector2.new(304,0),ImageRectSize=Vector2.new(16,16),Name="Icon",Parent={13},Position=UDim2.new(0,2,0,3),ScaleType=4,Size=UDim2.new(0,16,0,16),}},
				{17,"UICorner",{CornerRadius=UDim.new(0,4),Parent={13},}},
				{18,"Frame",{BackgroundColor3=Color3.new(0.21568629145622,0.21568629145622,0.21568629145622),BackgroundTransparency=1,BorderSizePixel=0,Name="Divider",Parent={1},Position=UDim2.new(0,0,0,20),Size=UDim2.new(1,0,0,7),Visible=false,}},
				{19,"Frame",{BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="Line",Parent={18},Position=UDim2.new(0,0,0.5,0),Size=UDim2.new(1,0,0,1),}},
				{20,"TextLabel",{AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="DividerName",Parent={18},Position=UDim2.new(0,2,0.5,0),Size=UDim2.new(1,-4,1,0),Text="Objects",TextColor3=Color3.new(1,1,1),TextSize=14,TextTransparency=0.60000002384186,TextXAlignment=0,Visible=false,}}
			})

			self.GuiElems.Main = contextGui.Main
			self.GuiElems.List = contextGui.Main.Container.List
			self.GuiElems.Entry = contextGui.Entry
			self.GuiElems.Divider = contextGui.Divider
			self.GuiElems.SearchFrame = contextGui.Main.Container.SearchFrame
			self.GuiElems.SearchBar = self.GuiElems.SearchFrame.SearchContainer.SearchBox
			Lib.ViewportTextBox.convert(self.GuiElems.SearchBar)

			self.GuiElems.SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
				local lower,find = string.lower,string.find
				local searchText = lower(self.GuiElems.SearchBar.Text)
				local items = self.Items
				local map = self.ItemToEntryMap

				if searchText ~= "" then
					local results = {}
					local count = 1
					for i = 1,#items do
						local item = items[i]
						local entry = map[item]
						if entry then
							if not item.Divider and find(lower(item.Name),searchText,1,true) then
								results[count] = item
								count = count + 1
							else
								entry.Visible = false
							end
						end
					end
					table.sort(results,function(a,b) return a.Name < b.Name end)
					for i = 1,#results do
						local entry = map[results[i]]
						entry.LayoutOrder = i
						entry.Visible = true
					end
				else
					for i = 1,#items do
						local entry = map[items[i]]
						if entry then entry.LayoutOrder = i entry.Visible = true end
					end
				end

				local toSize = self.GuiElems.List.UIListLayout.AbsoluteContentSize.Y + 6
				self.GuiElems.List.CanvasSize = UDim2.new(0,0,0,toSize-6)
			end)

			return contextGui
		end

		funcs.Add = function(self,item)
			local newItem = {
				Name = item.Name or "Item",
				Icon = item.Icon or "",
				Shortcut = item.Shortcut or "",
				OnClick = item.OnClick,
				OnHover = item.OnHover,
				Disabled = item.Disabled or false,
				DisabledIcon = item.DisabledIcon or "",
				IconMap = item.IconMap,
				OnRightClick = item.OnRightClick
			}

			if self.QueuedDivider then
				local text = self.QueuedDividerText and #self.QueuedDividerText > 0 and self.QueuedDividerText
				self:AddDivider(text)
			end
			self.Items[#self.Items+1] = newItem
			self.Updated = nil
		end

		funcs.AddRegistered = function(self,name,disabled)
			if not self.Registered[name] then error(name.." is not registered") end

			if self.QueuedDivider then
				local text = self.QueuedDividerText and #self.QueuedDividerText > 0 and self.QueuedDividerText
				self:AddDivider(text)
			end
			self.Registered[name].Disabled = disabled
			self.Items[#self.Items+1] = self.Registered[name]
			self.Updated = nil
		end

		funcs.Register = function(self,name,item)
			self.Registered[name] = {
				Name = item.Name or "Item",
				Icon = item.Icon or "",
				Shortcut = item.Shortcut or "",
				OnClick = item.OnClick,
				OnHover = item.OnHover,
				DisabledIcon = item.DisabledIcon or "",
				IconMap = item.IconMap,
				OnRightClick = item.OnRightClick
			}
		end

		funcs.UnRegister = function(self,name)
			self.Registered[name] = nil
		end

		funcs.AddDivider = function(self,text)
			self.QueuedDivider = false
			local textWidth = text and service.TextService:GetTextSize(text,14,Enum.Font.SourceSans,Vector2.new(999999999,20)).X or nil
			table.insert(self.Items,{Divider = true, Text = text, TextSize = textWidth and textWidth+4})
			self.Updated = nil
		end

		funcs.QueueDivider = function(self,text)
			self.QueuedDivider = true
			self.QueuedDividerText = text or ""
		end

		funcs.Clear = function(self)
			self.Items = {}
			self.Updated = nil
		end

		funcs.Refresh = function(self)
			for i,v in pairs(self.GuiElems.List:GetChildren()) do
				if not v:IsA("UIListLayout") then
					v:Destroy()
				end
			end
			local map = {}
			self.ItemToEntryMap = map

			local dividerFrame = self.GuiElems.Divider
			local contextList = self.GuiElems.List
			local entryFrame = self.GuiElems.Entry
			local items = self.Items

			for i = 1,#items do
				local item = items[i]
				if item.Divider then
					local newDivider = dividerFrame:Clone()
					newDivider.Line.BackgroundColor3 = self.Theme.DividerColor
					if item.Text then
						newDivider.Size = UDim2.new(1,0,0,20)
						newDivider.Line.Position = UDim2.new(0,item.TextSize,0.5,0)
						newDivider.Line.Size = UDim2.new(1,-item.TextSize,0,1)
						newDivider.DividerName.TextColor3 = self.Theme.TextColor
						newDivider.DividerName.Text = item.Text
						newDivider.DividerName.Visible = true
					end
					newDivider.Visible = true
					map[item] = newDivider
					newDivider.Parent = contextList
				else
					local newEntry = entryFrame:Clone()
					newEntry.BackgroundColor3 = self.Theme.HighlightColor
					newEntry.EntryName.TextColor3 = self.Theme.TextColor
					newEntry.EntryName.Text = item.Name
					newEntry.Shortcut.Text = item.Shortcut
					if item.Disabled then
						newEntry.EntryName.TextColor3 = Color3.new(150/255,150/255,150/255)
						newEntry.Shortcut.TextColor3 = Color3.new(150/255,150/255,150/255)
					end

					if self.Iconless then
						newEntry.EntryName.Position = UDim2.new(0,2,0,0)
						newEntry.EntryName.Size = UDim2.new(1,-4,0,20)
						newEntry.Icon.Visible = false
					else
						local iconIndex = item.Disabled and item.DisabledIcon or item.Icon
						-- Explorer.MiscIcons:DisplayExplorerIcons(newEntry.Icon, iconIndex)
						if item.IconMap then
							if type(iconIndex) == "number" then
								item.IconMap:Display(newEntry.Icon, iconIndex)
							elseif type(iconIndex) == "string" then
								item.IconMap:DisplayByKey(newEntry.Icon, iconIndex)
							end
						elseif type(iconIndex) == "string" then
							newEntry.Icon.Image = iconIndex
						end
					end

					if not item.Disabled then
						if item.OnClick then
							newEntry.MouseButton1Click:Connect(function()
								item.OnClick(item.Name)
								if not item.NoHide then
									self:Hide()
								end
							end)
						end

						if item.OnRightClick then
							newEntry.MouseButton2Click:Connect(function()
								item.OnRightClick(item.Name)
								if not item.NoHide then
									self:Hide()
								end
							end)
						end
					end

					newEntry.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
							newEntry.BackgroundTransparency = 0
						end
					end)

					newEntry.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
							newEntry.BackgroundTransparency = 1
						end
					end)

					newEntry.Visible = true
					map[item] = newEntry
					newEntry.Parent = contextList
				end
			end
			self.Updated = true
		end

		funcs.Show = function(self,x,y)
			local elems = self.GuiElems
			elems.SearchFrame.Visible = self.SearchEnabled
			elems.List.Position = UDim2.new(0,2,0,2 + (self.SearchEnabled and 24 or 0))
			elems.List.Size = UDim2.new(1,-4,1,-4 - (self.SearchEnabled and 24 or 0))
			if self.SearchEnabled and self.ClearSearchOnShow then elems.SearchBar.Text = "" end
			self.GuiElems.List.CanvasPosition = Vector2.new(0,0)

			if not self.Updated then
				self:Refresh()
			end

			-- Vars
			local reverseY = false
			local x,y = x or mouse.X, y or mouse.Y
			local maxX,maxY = mouse.ViewSizeX,mouse.ViewSizeY

			-- Position and show
			if x + self.Width > maxX then
				x = self.ReverseX and x - self.Width or maxX - self.Width
			end
			elems.Main.Position = UDim2.new(0,x,0,y)
			elems.Main.Size = UDim2.new(0,self.Width,0,0)
			self.Gui.DisplayOrder = Main.DisplayOrders.Menu
			Lib.ShowGui(self.Gui)

			-- Size adjustment
			local toSize = elems.List.UIListLayout.AbsoluteContentSize.Y + 6 -- Padding
			if self.MaxHeight and toSize > self.MaxHeight then
				elems.List.CanvasSize = UDim2.new(0,0,0,toSize-6)
				toSize = self.MaxHeight
			else
				elems.List.CanvasSize = UDim2.new(0,0,0,0)
			end
			if y + toSize > maxY then reverseY = true end

			-- Close event
			local closable
			if self.CloseEvent then self.CloseEvent:Disconnect() end
			self.CloseEvent = service.UserInputService.InputBegan:Connect(function(input)
				if not closable then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					if not Lib.CheckMouseInGui(elems.Main) then
						self.CloseEvent:Disconnect()
						self:Hide()
					end
				end
			end)

			-- Resize
			if reverseY then
				elems.Main.Position = UDim2.new(0,x,0,y-(self.ReverseYOffset or 0))
				local newY = y - toSize - (self.ReverseYOffset or 0)
				y = newY >= 0 and newY or 0
				elems.Main:TweenSizeAndPosition(UDim2.new(0,self.Width,0,toSize),UDim2.new(0,x,0,y),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.2,true)
			else
				elems.Main:TweenSize(UDim2.new(0,self.Width,0,toSize),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.2,true)
			end

			-- Close debounce
			Lib.FastWait()
			if self.SearchEnabled and self.FocusSearchOnShow then elems.SearchBar:CaptureFocus() end
			closable = true
		end

		funcs.Hide = function(self)
			self.Gui.Parent = nil
		end

		funcs.ApplyTheme = function(self,data)
			local theme = self.Theme
			theme.ContentColor = data.ContentColor or Settings.Theme.Menu
			theme.OutlineColor = data.OutlineColor or Settings.Theme.Menu
			theme.DividerColor = data.DividerColor or Settings.Theme.Outline2
			theme.TextColor = data.TextColor or Settings.Theme.Text
			theme.HighlightColor = data.HighlightColor or Settings.Theme.Main1

			self.GuiElems.Main.BackgroundColor3 = theme.OutlineColor
			self.GuiElems.Main.Container.BackgroundColor3 = theme.ContentColor
		end

		local mt = {__index = funcs}
		local function new()
			if not mouse then mouse = Main.Mouse or service.Players.LocalPlayer:GetMouse() end

			local obj = setmetatable({
				Width = 200,
				MaxHeight = nil,
				Iconless = false,
				SearchEnabled = false,
				ClearSearchOnShow = true,
				FocusSearchOnShow = true,
				Updated = false,
				QueuedDivider = false,
				QueuedDividerText = "",
				Items = {},
				Registered = {},
				GuiElems = {},
				Theme = {}
			},mt)
			obj.Gui = createGui(obj)
			obj:ApplyTheme({})
			return obj
		end

		return {new = new}
	end)()

	Lib.CodeFrame = (function()
		local funcs = {}

		local typeMap = {
			[1] = "String",
			[2] = "String",
			[3] = "String",
			[4] = "Comment",
			[5] = "Operator",
			[6] = "Number",
			[7] = "Keyword",
			[8] = "BuiltIn",
			[9] = "LocalMethod",
			[10] = "LocalProperty",
			[11] = "Nil",
			[12] = "Bool",
			[13] = "Function",
			[14] = "Local",
			[15] = "Self",
			[16] = "FunctionName",
			[17] = "Bracket"
		}

		local specialKeywordsTypes = {
			["nil"] = 11,
			["true"] = 12,
			["false"] = 12,
			["function"] = 13,
			["local"] = 14,
			["self"] = 15
		}

		local keywords = {
			["and"] = true,
			["break"] = true, 
			["do"] = true,
			["else"] = true,
			["elseif"] = true,
			["end"] = true,
			["false"] = true,
			["for"] = true,
			["function"] = true,
			["if"] = true,
			["in"] = true,
			["local"] = true,
			["nil"] = true,
			["not"] = true,
			["or"] = true,
			["repeat"] = true,
			["return"] = true,
			["then"] = true,
			["true"] = true,
			["until"] = true,
			["while"] = true,
			["plugin"] = true
		}

		local builtIns = {
			["delay"] = true,
			["elapsedTime"] = true,
			["require"] = true,
			["spawn"] = true,
			["tick"] = true,
			["time"] = true,
			["typeof"] = true,
			["UserSettings"] = true,
			["wait"] = true,
			["warn"] = true,
			["game"] = true,
			["shared"] = true,
			["script"] = true,
			["workspace"] = true,
			["assert"] = true,
			["collectgarbage"] = true,
			["error"] = true,
			["getfenv"] = true,
			["getmetatable"] = true,
			["ipairs"] = true,
			["loadstring"] = true,
			["newproxy"] = true,
			["next"] = true,
			["pairs"] = true,
			["pcall"] = true,
			["print"] = true,
			["rawequal"] = true,
			["rawget"] = true,
			["rawset"] = true,
			["select"] = true,
			["setfenv"] = true,
			["setmetatable"] = true,
			["tonumber"] = true,
			["tostring"] = true,
			["type"] = true,
			["unpack"] = true,
			["xpcall"] = true,
			["_G"] = true,
			["_VERSION"] = true,
			["coroutine"] = true,
			["debug"] = true,
			["math"] = true,
			["os"] = true,
			["string"] = true,
			["table"] = true,
			["bit32"] = true,
			["utf8"] = true,
			["Axes"] = true,
			["BrickColor"] = true,
			["CFrame"] = true,
			["Color3"] = true,
			["ColorSequence"] = true,
			["ColorSequenceKeypoint"] = true,
			["DockWidgetPluginGuiInfo"] = true,
			["Enum"] = true,
			["Faces"] = true,
			["Instance"] = true,
			["NumberRange"] = true,
			["NumberSequence"] = true,
			["NumberSequenceKeypoint"] = true,
			["PathWaypoint"] = true,
			["PhysicalProperties"] = true,
			["Random"] = true,
			["Ray"] = true,
			["Rect"] = true,
			["Region3"] = true,
			["Region3int16"] = true,
			["TweenInfo"] = true,
			["UDim"] = true,
			["UDim2"] = true,
			["Vector2"] = true,
			["Vector2int16"] = true,
			["Vector3"] = true,
			["Vector3int16"] = true,

			["getgenv"] = true,
			["getrenv"] = true,
			["getsenv"] = true,
			["getgc"] = true,
			["getreg"] = true,
			["filtergc"] = true,
			["saveinstave"] = true,
			["decompile"] = true,
			["syn"] = true,
			["getupvalue"] = true,
			["getupvalues"] = true,
			["setupvalue"] = true,
			["getstack"] = true,
			["setstack"] = true,
			["getconstants"] = true,
			["getconstant"] = true,
			["setconstant"] = true,
			["getproto"] = true,
			["getprotos"] = true,
			["checkcaller"] = true,
			["clonefunction"] = true,
			["cloneref"] = true,
			["getfunctionhash"] = true,
			["gethwid"] = true,
			["hookfunction"] = true,
			["hookmetamethod"] = true,
			["iscclosure"] = true,
			["islclosure"] = true,
			["newcclosure"] = true,
			["isexecutorclosure"] = true,
			["restorefunction"] = true,
			["crypt"] = true,
			["Drawing"] = true,

		}

		local builtInInited = false

		local richReplace = {
			["'"] = "&apos;",
			["\""] = "&quot;",
			["<"] = "&lt;",
			[">"] = "&gt;",
			["&"] = "&amp;"
		}

		local tabSub = "\205"
		local tabReplacement = (" %s%s "):format(tabSub,tabSub)

		local tabJumps = {
			[("[^%s] %s"):format(tabSub,tabSub)] = 0,
			[(" %s%s"):format(tabSub,tabSub)] = -1,
			[("%s%s "):format(tabSub,tabSub)] = 2,
			[("%s [^%s]"):format(tabSub,tabSub)] = 1,
		}

		local tweenService = service.TweenService
		local lineTweens = {}

		local function initBuiltIn()
			local env = getfenv()
			local type = type
			local tostring = tostring
			for name,_ in next,builtIns do
				local envVal = env[name]
				if type(envVal) == "table" then
					local items = {}
					for i,v in next,envVal do
						items[i] = true
					end
					builtIns[name] = items
				end
			end

			local enumEntries = {}
			local enums = Enum:GetEnums()
			for i = 1,#enums do
				enumEntries[tostring(enums[i])] = true
			end
			builtIns["Enum"] = enumEntries

			builtInInited = true
		end

		local function setupEditBox(obj)
			local editBox = obj.GuiElems.EditBox

			editBox.Focused:Connect(function()
				obj:ConnectEditBoxEvent()
				obj.Editing = true
			end)

			editBox.FocusLost:Connect(function()
				obj:DisconnectEditBoxEvent()
				obj.Editing = false
			end)

			editBox:GetPropertyChangedSignal("Text"):Connect(function()
				local text = editBox.Text
				if #text == 0 or obj.EditBoxCopying then return end
				editBox.Text = ""
				obj:AppendText(text)
			end)
		end

		local function setupMouseSelection(obj)
			local mouse = plr:GetMouse()
			local codeFrame = obj.GuiElems.LinesFrame
			local lines = obj.Lines

			codeFrame.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					local fontSizeX,fontSizeY = math.ceil(obj.FontSize/2),obj.FontSize

					local relX = mouse.X - codeFrame.AbsolutePosition.X
					local relY = mouse.Y - codeFrame.AbsolutePosition.Y
					local selX = math.round(relX / fontSizeX) + obj.ViewX
					local selY = math.floor(relY / fontSizeY) + obj.ViewY
					local releaseEvent,mouseEvent,scrollEvent
					local scrollPowerV,scrollPowerH = 0,0
					selY = math.min(#lines-1,selY)
					local relativeLine = lines[selY+1] or ""
					selX = math.min(#relativeLine, selX + obj:TabAdjust(selX,selY))

					obj.SelectionRange = {{-1,-1},{-1,-1}}
					obj:MoveCursor(selX,selY)
					obj.FloatCursorX = selX

					local function updateSelection()
						local relX = mouse.X - codeFrame.AbsolutePosition.X
						local relY = mouse.Y - codeFrame.AbsolutePosition.Y
						local sel2X = math.max(0,math.round(relX / fontSizeX) + obj.ViewX)
						local sel2Y = math.max(0,math.floor(relY / fontSizeY) + obj.ViewY)

						sel2Y = math.min(#lines-1,sel2Y)
						local relativeLine = lines[sel2Y+1] or ""
						sel2X = math.min(#relativeLine, sel2X + obj:TabAdjust(sel2X,sel2Y))

						if sel2Y < selY or (sel2Y == selY and sel2X < selX) then
							obj.SelectionRange = {{sel2X,sel2Y},{selX,selY}}
						else						
							obj.SelectionRange = {{selX,selY},{sel2X,sel2Y}}
						end

						obj:MoveCursor(sel2X,sel2Y)
						obj.FloatCursorX = sel2X
						obj:Refresh()
					end

					releaseEvent = service.UserInputService.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							releaseEvent:Disconnect()
							mouseEvent:Disconnect()
							scrollEvent:Disconnect()
							obj:SetCopyableSelection()
							--updateSelection()
						end
					end)

					mouseEvent = service.UserInputService.InputChanged:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
							local upDelta = mouse.Y - codeFrame.AbsolutePosition.Y
							local downDelta = mouse.Y - codeFrame.AbsolutePosition.Y - codeFrame.AbsoluteSize.Y
							local leftDelta = mouse.X - codeFrame.AbsolutePosition.X
							local rightDelta = mouse.X - codeFrame.AbsolutePosition.X - codeFrame.AbsoluteSize.X
							scrollPowerV = 0
							scrollPowerH = 0
							if downDelta > 0 then
								scrollPowerV = math.floor(downDelta*0.05) + 1
							elseif upDelta < 0 then
								scrollPowerV = math.ceil(upDelta*0.05) - 1
							end
							if rightDelta > 0 then
								scrollPowerH = math.floor(rightDelta*0.05) + 1
							elseif leftDelta < 0 then
								scrollPowerH = math.ceil(leftDelta*0.05) - 1
							end
							updateSelection()
						end
					end)

					scrollEvent = game:GetService("RunService").RenderStepped:Connect(function()
						if scrollPowerV ~= 0 or scrollPowerH ~= 0 then
							obj:ScrollDelta(scrollPowerH,scrollPowerV)
							updateSelection()
						end
					end)

					obj:Refresh()
				end
			end)
		end

		local function makeFrame(obj)
			local frame = create({
				{1,"Frame",{BackgroundColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel = 0,Position=UDim2.new(0.5,-300,0.5,-200),Size=UDim2.new(0,600,0,400),}},
			})

			if Settings.Window.Transparency and Settings.Window.Transparency > 0 then
				frame.BackgroundTransparency = 0.5
			end

			local elems = {}

			local linesFrame = Instance.new("Frame")
			linesFrame.Name = "Lines"
			linesFrame.BackgroundTransparency = 1
			linesFrame.Size = UDim2.new(1,0,1,0)
			linesFrame.ClipsDescendants = true
			linesFrame.Parent = frame

			local lineNumbersLabel = Instance.new("TextLabel")
			lineNumbersLabel.Name = "LineNumbers"
			lineNumbersLabel.BackgroundTransparency = 1
			lineNumbersLabel.Font = Enum.Font.Code
			lineNumbersLabel.TextXAlignment = Enum.TextXAlignment.Right
			lineNumbersLabel.TextYAlignment = Enum.TextYAlignment.Top
			lineNumbersLabel.ClipsDescendants = true
			lineNumbersLabel.RichText = true
			lineNumbersLabel.Parent = frame

			local cursor = Instance.new("Frame")
			cursor.Name = "Cursor"
			cursor.BackgroundColor3 = Color3.fromRGB(220,220,220)
			cursor.BorderSizePixel = 0
			cursor.Parent = frame

			local editBox = Instance.new("TextBox")
			editBox.Name = "EditBox"
			editBox.MultiLine = true
			editBox.Visible = false
			editBox.Parent = frame

			lineTweens.Invis = tweenService:Create(cursor,TweenInfo.new(0.4,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{BackgroundTransparency = 1})
			lineTweens.Vis = tweenService:Create(cursor,TweenInfo.new(0.2,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{BackgroundTransparency = 0})

			elems.LinesFrame = linesFrame
			elems.LineNumbersLabel = lineNumbersLabel
			elems.Cursor = cursor
			elems.EditBox = editBox
			elems.ScrollCorner = create({{1,"Frame",{BackgroundColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel=0,Name="ScrollCorner",Position=UDim2.new(1,-16,1,-16),Size=UDim2.new(0,16,0,16),Visible=false,}}})

			elems.ScrollCorner.Parent = frame
			linesFrame.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					obj:SetEditing(true,input)
				end
			end)

			obj.Frame = frame
			obj.Gui = frame
			obj.GuiElems = elems
			setupEditBox(obj)
			setupMouseSelection(obj)

			return frame
		end

		funcs.GetSelectionText = function(self)
			if not self:IsValidRange() then return "" end

			local selectionRange = self.SelectionRange
			local selX,selY = selectionRange[1][1], selectionRange[1][2]
			local sel2X,sel2Y = selectionRange[2][1], selectionRange[2][2]
			local deltaLines = sel2Y-selY
			local lines = self.Lines

			if not lines[selY+1] or not lines[sel2Y+1] then return "" end

			if deltaLines == 0 then
				return self:ConvertText(lines[selY+1]:sub(selX+1,sel2X), false)
			end

			local leftSub = lines[selY+1]:sub(selX+1)
			local rightSub = lines[sel2Y+1]:sub(1,sel2X)

			local result = leftSub.."\n" 
			for i = selY+1,sel2Y-1 do
				result = result..lines[i+1].."\n"
			end
			result = result..rightSub

			return self:ConvertText(result,false)
		end

		funcs.SetCopyableSelection = function(self)
			local text = self:GetSelectionText()
			local editBox = self.GuiElems.EditBox

			self.EditBoxCopying = true
			editBox.Text = text
			editBox.SelectionStart = 1
			editBox.CursorPosition = #editBox.Text + 1
			self.EditBoxCopying = false
		end

		funcs.ConnectEditBoxEvent = function(self)
			if self.EditBoxEvent then
				self.EditBoxEvent:Disconnect()
			end

			self.EditBoxEvent = service.UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType ~= Enum.UserInputType.Keyboard then return end

				local keycodes = Enum.KeyCode
				local keycode = input.KeyCode

				local function setupMove(key,func)
					local endCon,finished
					endCon = service.UserInputService.InputEnded:Connect(function(input)
						if input.KeyCode ~= key then return end
						endCon:Disconnect()
						finished = true
					end)
					func()
					Lib.FastWait(0.5)
					while not finished do func() Lib.FastWait(0.03) end
				end

				if keycode == keycodes.Down then
					setupMove(keycodes.Down,function()
						self.CursorX = self.FloatCursorX
						self.CursorY = self.CursorY + 1
						self:UpdateCursor()
						self:JumpToCursor()
					end)
				elseif keycode == keycodes.Up then
					setupMove(keycodes.Up,function()
						self.CursorX = self.FloatCursorX
						self.CursorY = self.CursorY - 1
						self:UpdateCursor()
						self:JumpToCursor()
					end)
				elseif keycode == keycodes.Left then
					setupMove(keycodes.Left,function()
						local line = self.Lines[self.CursorY+1] or ""
						self.CursorX = self.CursorX - 1 - (line:sub(self.CursorX-3,self.CursorX) == tabReplacement and 3 or 0)
						if self.CursorX < 0 then
							self.CursorY = self.CursorY - 1
							local line2 = self.Lines[self.CursorY+1] or ""
							self.CursorX = #line2
						end
						self.FloatCursorX = self.CursorX
						self:UpdateCursor()
						self:JumpToCursor()
					end)
				elseif keycode == keycodes.Right then
					setupMove(keycodes.Right,function()
						local line = self.Lines[self.CursorY+1] or ""
						self.CursorX = self.CursorX + 1 + (line:sub(self.CursorX+1,self.CursorX+4) == tabReplacement and 3 or 0)
						if self.CursorX > #line then
							self.CursorY = self.CursorY + 1
							self.CursorX = 0
						end
						self.FloatCursorX = self.CursorX
						self:UpdateCursor()
						self:JumpToCursor()
					end)
				elseif keycode == keycodes.Backspace then
					setupMove(keycodes.Backspace,function()
						local startRange,endRange
						if self:IsValidRange() then
							startRange = self.SelectionRange[1]
							endRange = self.SelectionRange[2]
						else
							endRange = {self.CursorX,self.CursorY}
						end

						if not startRange then
							local line = self.Lines[self.CursorY+1] or ""
							self.CursorX = self.CursorX - 1 - (line:sub(self.CursorX-3,self.CursorX) == tabReplacement and 3 or 0)
							if self.CursorX < 0 then
								self.CursorY = self.CursorY - 1
								local line2 = self.Lines[self.CursorY+1] or ""
								self.CursorX = #line2
							end
							self.FloatCursorX = self.CursorX
							self:UpdateCursor()

							startRange = startRange or {self.CursorX,self.CursorY}
						end

						self:DeleteRange({startRange,endRange},false,true)
						self:ResetSelection(true)
						self:JumpToCursor()
					end)
				elseif keycode == keycodes.Delete then
					setupMove(keycodes.Delete,function()
						local startRange,endRange
						if self:IsValidRange() then
							startRange = self.SelectionRange[1]
							endRange = self.SelectionRange[2]
						else
							startRange = {self.CursorX,self.CursorY}
						end

						if not endRange then
							local line = self.Lines[self.CursorY+1] or ""
							local endCursorX = self.CursorX + 1 + (line:sub(self.CursorX+1,self.CursorX+4) == tabReplacement and 3 or 0)
							local endCursorY = self.CursorY
							if endCursorX > #line then
								endCursorY = endCursorY + 1
								endCursorX = 0
							end
							self:UpdateCursor()

							endRange = endRange or {endCursorX,endCursorY}
						end

						self:DeleteRange({startRange,endRange},false,true)
						self:ResetSelection(true)
						self:JumpToCursor()
					end)
				elseif service.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
					if keycode == keycodes.A then
						self.SelectionRange = {{0,0},{#self.Lines[#self.Lines],#self.Lines-1}}
						self:SetCopyableSelection()
						self:Refresh()
					end
				end
			end)
		end

		funcs.DisconnectEditBoxEvent = function(self)
			if self.EditBoxEvent then
				self.EditBoxEvent:Disconnect()
			end
		end

		funcs.ResetSelection = function(self,norefresh)
			self.SelectionRange = {{-1,-1},{-1,-1}}
			if not norefresh then self:Refresh() end
		end

		funcs.IsValidRange = function(self,range)
			local selectionRange = range or self.SelectionRange
			local selX,selY = selectionRange[1][1], selectionRange[1][2]
			local sel2X,sel2Y = selectionRange[2][1], selectionRange[2][2]

			if selX == -1 or (selX == sel2X and selY == sel2Y) then return false end

			return true
		end

		funcs.DeleteRange = function(self,range,noprocess,updatemouse)
			range = range or self.SelectionRange
			if not self:IsValidRange(range) then return end

			local lines = self.Lines
			local selX,selY = range[1][1], range[1][2]
			local sel2X,sel2Y = range[2][1], range[2][2]
			local deltaLines = sel2Y-selY

			if not lines[selY+1] or not lines[sel2Y+1] then return end

			local leftSub = lines[selY+1]:sub(1,selX)
			local rightSub = lines[sel2Y+1]:sub(sel2X+1)
			lines[selY+1] = leftSub..rightSub

			local remove = table.remove
			for i = 1,deltaLines do
				remove(lines,selY+2)
			end

			if range == self.SelectionRange then self.SelectionRange = {{-1,-1},{-1,-1}} end
			if updatemouse then
				self.CursorX = selX
				self.CursorY = selY
				self:UpdateCursor()
			end

			if not noprocess then
				self:ProcessTextChange()
			end
		end

		funcs.AppendText = function(self,text)
			self:DeleteRange(nil,true,true)
			local lines,cursorX,cursorY = self.Lines,self.CursorX,self.CursorY
			local line = lines[cursorY+1]
			local before = line:sub(1,cursorX)
			local after = line:sub(cursorX+1)

			text = text:gsub("\r\n","\n")
			text = self:ConvertText(text,true) -- Tab Convert

			local textLines = text:split("\n")
			local insert = table.insert

			for i = 1,#textLines do
				local linePos = cursorY+i
				if i > 1 then insert(lines,linePos,"") end

				local textLine = textLines[i]
				local newBefore = (i == 1 and before or "")
				local newAfter = (i == #textLines and after or "")

				lines[linePos] = newBefore..textLine..newAfter
			end

			if #textLines > 1 then cursorX = 0 end

			self:ProcessTextChange()
			self.CursorX = cursorX + #textLines[#textLines]
			self.CursorY = cursorY + #textLines-1
			self:UpdateCursor()
		end

		funcs.ScrollDelta = function(self,x,y)
			self.ScrollV:ScrollTo(self.ScrollV.Index + y)
			self.ScrollH:ScrollTo(self.ScrollH.Index + x)
		end

		-- x and y starts at 0
		funcs.TabAdjust = function(self,x,y)
			local lines = self.Lines
			local line = lines[y+1]
			x=x+1

			if line then
				local left = line:sub(x-1,x-1)
				local middle = line:sub(x,x)
				local right = line:sub(x+1,x+1)
				local selRange = (#left > 0 and left or " ") .. (#middle > 0 and middle or " ") .. (#right > 0 and right or " ")

				for i,v in pairs(tabJumps) do
					if selRange:find(i) then
						return v
					end
				end
			end
			return 0
		end

		funcs.SetEditing = function(self,on,input)			
			self:UpdateCursor(input)

			if on then
				if self.Editable then
					self.GuiElems.EditBox.Text = ""
					self.GuiElems.EditBox:CaptureFocus()
				end
			else
				self.GuiElems.EditBox:ReleaseFocus()
			end
		end

		funcs.CursorAnim = function(self,on)
			local cursor = self.GuiElems.Cursor
			local animTime = tick()
			self.LastAnimTime = animTime

			if not on then return end

			lineTweens.Invis:Cancel()
			lineTweens.Vis:Cancel()
			cursor.BackgroundTransparency = 0

			coroutine.wrap(function()
				while self.Editable do
					Lib.FastWait(0.5)
					if self.LastAnimTime ~= animTime then return end
					lineTweens.Invis:Play()
					Lib.FastWait(0.4)
					if self.LastAnimTime ~= animTime then return end
					lineTweens.Vis:Play()
					Lib.FastWait(0.2)
				end
			end)()
		end

		funcs.MoveCursor = function(self,x,y)
			self.CursorX = x
			self.CursorY = y
			self:UpdateCursor()
			self:JumpToCursor()
		end

		funcs.JumpToCursor = function(self)
			self:Refresh()
		end

		funcs.UpdateCursor = function(self,input)
			local linesFrame = self.GuiElems.LinesFrame
			local cursor = self.GuiElems.Cursor			
			local hSize = math.max(0,linesFrame.AbsoluteSize.X)
			local vSize = math.max(0,linesFrame.AbsoluteSize.Y)
			local maxLines = math.ceil(vSize / self.FontSize)
			local maxCols = math.ceil(hSize / math.ceil(self.FontSize/2))
			local viewX,viewY = self.ViewX,self.ViewY
			local totalLinesStr = tostring(#self.Lines)
			local fontWidth = math.ceil(self.FontSize / 2)
			local linesOffset = #totalLinesStr*fontWidth + 4*fontWidth

			if input then
				local linesFrame = self.GuiElems.LinesFrame
				local frameX,frameY = linesFrame.AbsolutePosition.X,linesFrame.AbsolutePosition.Y
				local mouseX,mouseY = input.Position.X,input.Position.Y
				local fontSizeX,fontSizeY = math.ceil(self.FontSize/2),self.FontSize

				self.CursorX = self.ViewX + math.round((mouseX - frameX) / fontSizeX)
				self.CursorY = self.ViewY + math.floor((mouseY - frameY) / fontSizeY)
			end

			local cursorX,cursorY = self.CursorX,self.CursorY

			local line = self.Lines[cursorY+1] or ""
			if cursorX > #line then cursorX = #line
			elseif cursorX < 0 then cursorX = 0 end

			if cursorY >= #self.Lines then
				cursorY = math.max(0,#self.Lines-1)
			elseif cursorY < 0 then
				cursorY = 0
			end

			cursorX = cursorX + self:TabAdjust(cursorX,cursorY)

			-- Update modified
			self.CursorX = cursorX
			self.CursorY = cursorY

			local cursorVisible = (cursorX >= viewX) and (cursorY >= viewY) and (cursorX <= viewX + maxCols) and (cursorY <= viewY + maxLines)
			if cursorVisible then
				local offX = (cursorX - viewX)
				local offY = (cursorY - viewY)
				cursor.Position = UDim2.new(0,linesOffset + offX*math.ceil(self.FontSize/2) - 1,0,offY*self.FontSize)
				cursor.Size = UDim2.new(0,1,0,self.FontSize+2)
				cursor.Visible = true
				self:CursorAnim(true)
			else
				cursor.Visible = false
			end
		end

		funcs.MapNewLines = function(self)
			local newLines = {}
			local count = 1
			local text = self.Text
			local find = string.find
			local init = 1

			local pos = find(text,"\n",init,true)
			while pos do
				newLines[count] = pos
				count = count + 1
				init = pos + 1
				pos = find(text,"\n",init,true)
			end

			self.NewLines = newLines
		end

		funcs.PreHighlight = function(self)
			local start = tick()
			local text = self.Text:gsub("\\\\","  ")
			--print("BACKSLASH SUB",tick()-start)
			local textLen = #text
			local found = {}
			local foundMap = {}
			local extras = {}
			local find = string.find
			local sub = string.sub
			self.ColoredLines = {}

			local function findAll(str,pattern,typ,raw)
				local count = #found+1
				local init = 1
				local x,y,extra = find(str,pattern,init,raw)
				while x do
					found[count] = x
					foundMap[x] = typ
					if extra then
						extras[x] = extra
					end

					count = count+1
					init = y+1
					x,y,extra = find(str,pattern,init,raw)
				end
			end
			local start = tick()
			findAll(text,'"',1,true)
			findAll(text,"'",2,true)
			findAll(text,"%[(=*)%[",3)
			findAll(text,"--",4,true)
			table.sort(found)

			local newLines = self.NewLines
			local curLine = 0
			local lineTableCount = 1
			local lineStart = 0
			local lineEnd = 0
			local lastEnding = 0
			local foundHighlights = {}

			for i = 1,#found do
				local pos = found[i]
				if pos <= lastEnding then continue end

				local ending = pos
				local typ = foundMap[pos]
				if typ == 1 then
					ending = find(text,'"',pos+1,true)
					while ending and sub(text,ending-1,ending-1) == "\\" do
						ending = find(text,'"',ending+1,true)
					end
					if not ending then ending = textLen end
				elseif typ == 2 then
					ending = find(text,"'",pos+1,true)
					while ending and sub(text,ending-1,ending-1) == "\\" do
						ending = find(text,"'",ending+1,true)
					end
					if not ending then ending = textLen end
				elseif typ == 3 then
					_,ending = find(text,"]"..extras[pos].."]",pos+1,true)
					if not ending then ending = textLen end
				elseif typ == 4 then
					local ahead = foundMap[pos+2]

					if ahead == 3 then
						_,ending = find(text,"]"..extras[pos+2].."]",pos+1,true)
						if not ending then ending = textLen end
					else
						ending = find(text,"\n",pos+1,true) or textLen
					end
				end

				while pos > lineEnd do
					curLine = curLine + 1
					--lineTableCount = 1
					lineEnd = newLines[curLine] or textLen+1
				end
				while true do
					local lineTable = foundHighlights[curLine]
					if not lineTable then lineTable = {} foundHighlights[curLine] = lineTable end
					lineTable[pos] = {typ,ending}
					--lineTableCount = lineTableCount + 1

					if ending > lineEnd then
						curLine = curLine + 1
						lineEnd = newLines[curLine] or textLen+1
					else
						break
					end
				end

				lastEnding = ending
				--if i < 200 then print(curLine) end
			end
			self.PreHighlights = foundHighlights
			--print(tick()-start)
			--print(#found,curLine)
		end

		funcs.HighlightLine = function(self,line)
			local cached = self.ColoredLines[line]
			if cached then return cached end

			local sub = string.sub
			local find = string.find
			local match = string.match
			local highlights = {}
			local preHighlights = self.PreHighlights[line] or {}
			local lineText = self.Lines[line] or ""
			local lineLen = #lineText
			local lastEnding = 0
			local currentType = 0
			local lastWord = nil
			local wordBeginsDotted = false
			local funcStatus = 0
			local lineStart = self.NewLines[line-1] or 0

			local preHighlightMap = {}
			for pos,data in next,preHighlights do
				local relativePos = pos-lineStart
				if relativePos < 1 then
					currentType = data[1]
					lastEnding = data[2] - lineStart
					--warn(pos,data[2])
				else
					preHighlightMap[relativePos] = {data[1],data[2]-lineStart}
				end
			end

			for col = 1,#lineText do
				if col <= lastEnding then highlights[col] = currentType continue end

				local pre = preHighlightMap[col]
				if pre then
					currentType = pre[1]
					lastEnding = pre[2]
					highlights[col] = currentType
					wordBeginsDotted = false
					lastWord = nil
					funcStatus = 0
				else
					local char = sub(lineText,col,col)
					if find(char,"[%a_]") then
						local word = match(lineText,"[%a%d_]+",col)
						local wordType = (keywords[word] and 7) or (builtIns[word] and 8)

						lastEnding = col+#word-1

						if wordType ~= 7 then
							if wordBeginsDotted then
								local prevBuiltIn = lastWord and builtIns[lastWord]
								wordType = (prevBuiltIn and type(prevBuiltIn) == "table" and prevBuiltIn[word] and 8) or 10
							end

							if wordType ~= 8 then
								local x,y,br = find(lineText,"^%s*([%({\"'])",lastEnding+1)
								if x then
									wordType = (funcStatus > 0 and br == "(" and 16) or 9
									funcStatus = 0
								end
							end
						else
							wordType = specialKeywordsTypes[word] or wordType
							funcStatus = (word == "function" and 1 or 0)
						end

						lastWord = word
						wordBeginsDotted = false
						if funcStatus > 0 then funcStatus = 1 end

						if wordType then
							currentType = wordType
							highlights[col] = currentType
						else
							currentType = nil
						end
					elseif find(char,"%p") then
						local isDot = (char == ".")
						local isNum = isDot and find(sub(lineText,col+1,col+1),"%d")
						highlights[col] = (isNum and 6 or 5)

						if not isNum then
							local dotStr = isDot and match(lineText,"%.%.?%.?",col)
							if dotStr and #dotStr > 1 then
								currentType = 5
								lastEnding = col+#dotStr-1
								wordBeginsDotted = false
								lastWord = nil
								funcStatus = 0
							else
								if isDot then
									if wordBeginsDotted then
										lastWord = nil
									else
										wordBeginsDotted = true
									end
								else
									wordBeginsDotted = false
									lastWord = nil
								end

								funcStatus = ((isDot or char == ":") and funcStatus == 1 and 2) or 0
							end
						end
					elseif find(char,"%d") then
						local _,endPos = find(lineText,"%x+",col)
						local endPart = sub(lineText,endPos,endPos+1)
						if (endPart == "e+" or endPart == "e-") and find(sub(lineText,endPos+2,endPos+2),"%d") then
							endPos = endPos + 1
						end
						currentType = 6
						lastEnding = endPos
						highlights[col] = 6
						wordBeginsDotted = false
						lastWord = nil
						funcStatus = 0
					else
						highlights[col] = currentType
						local _,endPos = find(lineText,"%s+",col)
						if endPos then
							lastEnding = endPos
						end
					end
				end
			end

			self.ColoredLines[line] = highlights
			return highlights
		end

		funcs.Refresh = function(self)
			local start = tick()

			local linesFrame = self.Frame.Lines
			local hSize = math.max(0,linesFrame.AbsoluteSize.X)
			local vSize = math.max(0,linesFrame.AbsoluteSize.Y)
			local maxLines = math.ceil(vSize / self.FontSize)
			local maxCols = math.ceil(hSize / math.ceil(self.FontSize/2))
			local gsub = string.gsub
			local sub = string.sub

			local viewX,viewY = self.ViewX,self.ViewY

			local lineNumberStr = ""

			for row = 1,maxLines do
				local lineFrame = self.LineFrames[row]
				if not lineFrame then
					lineFrame = Instance.new("Frame")
					lineFrame.Name = "Line"
					lineFrame.Position = UDim2.new(0,0,0,(row-1)*self.FontSize)
					lineFrame.Size = UDim2.new(1,0,0,self.FontSize)
					lineFrame.BorderSizePixel = 0
					lineFrame.BackgroundTransparency = 1

					local selectionHighlight = Instance.new("Frame")
					selectionHighlight.Name = "SelectionHighlight"
					selectionHighlight.BorderSizePixel = 0
					selectionHighlight.BackgroundColor3 = Settings.Theme.Syntax.SelectionBack
					selectionHighlight.Parent = lineFrame

					local label = Instance.new("TextLabel")
					label.Name = "Label"
					label.BackgroundTransparency = 1
					label.Font = Enum.Font.Code
					label.TextSize = self.FontSize
					label.Size = UDim2.new(1,0,0,self.FontSize)
					label.RichText = true
					label.TextXAlignment = Enum.TextXAlignment.Left
					label.TextColor3 = self.Colors.Text
					label.ZIndex = 2
					label.Parent = lineFrame

					lineFrame.Parent = linesFrame
					self.LineFrames[row] = lineFrame
				end

				local relaY = viewY + row
				local lineText = self.Lines[relaY] or ""
				local resText = ""
				local highlights = self:HighlightLine(relaY)
				local colStart = viewX + 1

				local richTemplates = self.RichTemplates
				local textTemplate = richTemplates.Text
				local selectionTemplate = richTemplates.Selection
				local curType = highlights[colStart]
				local curTemplate = richTemplates[typeMap[curType]] or textTemplate

				-- Selection Highlight
				local selectionRange = self.SelectionRange
				local selPos1 = selectionRange[1]
				local selPos2 = selectionRange[2]
				local selRow,selColumn = selPos1[2],selPos1[1]
				local sel2Row,sel2Column = selPos2[2],selPos2[1]
				local selRelaX,selRelaY = viewX,relaY-1

				if selRelaY >= selPos1[2] and selRelaY <= selPos2[2] then
					local fontSizeX = math.ceil(self.FontSize/2)
					local posX = (selRelaY == selPos1[2] and selPos1[1] or 0) - viewX
					local sizeX = (selRelaY == selPos2[2] and selPos2[1]-posX-viewX or maxCols+viewX)

					lineFrame.SelectionHighlight.Position = UDim2.new(0,posX*fontSizeX,0,0)
					lineFrame.SelectionHighlight.Size = UDim2.new(0,sizeX*fontSizeX,1,0)
					lineFrame.SelectionHighlight.Visible = true
				else
					lineFrame.SelectionHighlight.Visible = false
				end

				-- Selection Text Color for first char
				local inSelection = selRelaY >= selRow and selRelaY <= sel2Row and (selRelaY == selRow and viewX >= selColumn or selRelaY ~= selRow) and (selRelaY == sel2Row and viewX < sel2Column or selRelaY ~= sel2Row)
				if inSelection then
					curType = -999
					curTemplate = selectionTemplate
				end

				for col = 2,maxCols do
					local relaX = viewX + col
					local selRelaX = relaX-1
					local posType = highlights[relaX]

					-- Selection Text Color
					local inSelection = selRelaY >= selRow and selRelaY <= sel2Row and (selRelaY == selRow and selRelaX >= selColumn or selRelaY ~= selRow) and (selRelaY == sel2Row and selRelaX < sel2Column or selRelaY ~= sel2Row)
					if inSelection then
						posType = -999
					end

					if posType ~= curType then
						local template = (inSelection and selectionTemplate) or richTemplates[typeMap[posType]] or textTemplate

						if template ~= curTemplate then
							local nextText = gsub(sub(lineText,colStart,relaX-1),"['\"<>&]",richReplace)
							resText = resText .. (curTemplate ~= textTemplate and (curTemplate .. nextText .. "</font>") or nextText)
							colStart = relaX
							curTemplate = template
						end
						curType = posType
					end
				end

				local lastText = gsub(sub(lineText,colStart,viewX+maxCols),"['\"<>&]",richReplace)
				--warn("SUB",colStart,viewX+maxCols-1)
				if #lastText > 0 then
					resText = resText .. (curTemplate ~= textTemplate and (curTemplate .. lastText .. "</font>") or lastText)
				end

				if self.Lines[relaY] then

					-- REMOVED LINE HIGHLIGHT DUE TO BUG OFFSET
					lineNumberStr = lineNumberStr .. (relaY == self.CursorY and ("<b>"..relaY.."</b>\n") or relaY .. "\n")
					--lineNumberStr = lineNumberStr .. (relaY == self.CursorY and (relaY.."\n") or relaY .. "\n")
				end

				lineFrame.Label.Text = resText
			end

			for i = maxLines+1,#self.LineFrames do
				self.LineFrames[i]:Destroy()
				self.LineFrames[i] = nil
			end

			self.Frame.LineNumbers.Text = lineNumberStr
			self:UpdateCursor()

			--print("REFRESH TIME",tick()-start)
		end

		funcs.UpdateView = function(self)
			local totalLinesStr = tostring(#self.Lines)
			local fontWidth = math.ceil(self.FontSize / 2)
			local linesOffset = #totalLinesStr*fontWidth + 4*fontWidth

			local linesFrame = self.Frame.Lines
			local hSize = linesFrame.AbsoluteSize.X
			local vSize = linesFrame.AbsoluteSize.Y
			local maxLines = math.ceil(vSize / self.FontSize)
			local totalWidth = self.MaxTextCols*fontWidth
			local scrollV = self.ScrollV
			local scrollH = self.ScrollH

			scrollV.VisibleSpace = maxLines
			scrollV.TotalSpace = #self.Lines + 1
			scrollH.VisibleSpace = math.ceil(hSize/fontWidth)
			scrollH.TotalSpace = self.MaxTextCols + 1

			scrollV.Gui.Visible = #self.Lines + 1 > maxLines
			scrollH.Gui.Visible = totalWidth > hSize

			local oldOffsets = self.FrameOffsets
			self.FrameOffsets = Vector2.new(scrollV.Gui.Visible and -16 or 0, scrollH.Gui.Visible and -16 or 0)
			if oldOffsets ~= self.FrameOffsets then
				self:UpdateView()
			else
				scrollV:ScrollTo(self.ViewY,true)
				scrollH:ScrollTo(self.ViewX,true)

				if scrollV.Gui.Visible and scrollH.Gui.Visible then
					scrollV.Gui.Size = UDim2.new(0,16,1,-16)
					scrollH.Gui.Size = UDim2.new(1,-16,0,16)
					self.GuiElems.ScrollCorner.Visible = true
				else
					scrollV.Gui.Size = UDim2.new(0,16,1,0)
					scrollH.Gui.Size = UDim2.new(1,0,0,16)
					self.GuiElems.ScrollCorner.Visible = false
				end

				self.ViewY = scrollV.Index
				self.ViewX = scrollH.Index
				self.Frame.Lines.Position = UDim2.new(0,linesOffset,0,0)
				self.Frame.Lines.Size = UDim2.new(1,-linesOffset+oldOffsets.X,1,oldOffsets.Y)
				self.Frame.LineNumbers.Position = UDim2.new(0,fontWidth,0,0)
				self.Frame.LineNumbers.Size = UDim2.new(0,#totalLinesStr*fontWidth,1,oldOffsets.Y)
				self.Frame.LineNumbers.TextSize = self.FontSize
			end
		end

		funcs.ProcessTextChange = function(self)
			local maxCols = 0
			local lines = self.Lines

			for i = 1,#lines do
				local lineLen = #lines[i]
				if lineLen > maxCols then
					maxCols = lineLen
				end
			end

			self.MaxTextCols = maxCols
			self:UpdateView()	
			self.Text = table.concat(self.Lines,"\n")
			self:MapNewLines()
			self:PreHighlight()
			self:Refresh()
			--self.TextChanged:Fire()
		end

		funcs.ConvertText = function(self,text,toEditor)
			if toEditor then
				--return text:gsub("\t",(" %s%s "):format(tabSub,tabSub))
				return text:gsub("\t","    ") -- Fixed unknown unicode showing when pressing TAB
			else
				return text:gsub((" %s%s "):format(tabSub,tabSub),"\t")
			end
		end

		funcs.GetText = function(self) -- TODO: better (use new tab format)
			local source = table.concat(self.Lines,"\n")
			return self:ConvertText(source,false) -- Tab Convert
		end

		funcs.SetText = function(self,txt)
			txt = self:ConvertText(txt,true) -- Tab Convert
			local lines = self.Lines
			table.clear(lines)
			local count = 1

			for line in txt:gmatch("([^\n\r]*)[\n\r]?") do
				local len = #line
				lines[count] = line
				count = count + 1
			end

			self:ProcessTextChange()
		end

		funcs.MakeRichTemplates = function(self)
			local floor = math.floor
			local templates = {}

			for name,color in pairs(self.Colors) do
				templates[name] = ('<font color="rgb(%s,%s,%s)">'):format(floor(color.r*255),floor(color.g*255),floor(color.b*255))
			end

			self.RichTemplates = templates
		end

		funcs.ApplyTheme = function(self)
			local colors = Settings.Theme.Syntax
			self.Colors = colors
			self.Frame.LineNumbers.TextColor3 = colors.Text
			self.Frame.BackgroundColor3 = colors.Background
		end

		local mt = {__index = funcs}

		local function new()
			if not builtInInited then initBuiltIn() end

			local scrollV = Lib.ScrollBar.new()
			local scrollH = Lib.ScrollBar.new(true)
			scrollH.Gui.Position = UDim2.new(0,0,1,-16)
			local obj = setmetatable({
				FontSize = 16,
				ViewX = 0,
				ViewY = 0,
				Colors = Settings.Theme.Syntax,
				ColoredLines = {},
				Lines = {""},
				LineFrames = {},
				Editable = true,
				Editing = false,
				CursorX = 0,
				CursorY = 0,
				FloatCursorX = 0,
				Text = "",
				PreHighlights = {},
				SelectionRange = {{-1,-1},{-1,-1}},
				NewLines = {},
				FrameOffsets = Vector2.new(0,0),
				MaxTextCols = 0,
				ScrollV = scrollV,
				ScrollH = scrollH
			},mt)

			scrollV.WheelIncrement = 3
			scrollH.Increment = 2
			scrollH.WheelIncrement = 7

			scrollV.Scrolled:Connect(function()
				obj.ViewY = scrollV.Index
				obj:Refresh()
			end)

			scrollH.Scrolled:Connect(function()
				obj.ViewX = scrollH.Index
				obj:Refresh()
			end)

			makeFrame(obj)
			obj:MakeRichTemplates()
			obj:ApplyTheme()
			scrollV:SetScrollFrame(obj.Frame.Lines)
			scrollV.Gui.Parent = obj.Frame
			scrollH.Gui.Parent = obj.Frame

			obj:UpdateView()
			obj.Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				obj:UpdateView()
				obj:Refresh()
			end)

			return obj
		end

		return {new = new}
	end)()

	Lib.Checkbox = (function()
		local funcs = {}
		local c3 = Color3.fromRGB
		local v2 = Vector2.new
		local ud2s = UDim2.fromScale
		local ud2o = UDim2.fromOffset
		local ud = UDim.new
		local max = math.max
		local new = Instance.new
		local TweenSize = new("Frame").TweenSize
		local ti = TweenInfo.new
		local delay = delay

		local function ripple(object, color)
			local circle = new('Frame')
			circle.BackgroundColor3 = color
			circle.BackgroundTransparency = 0.75
			circle.BorderSizePixel = 0
			circle.AnchorPoint = v2(0.5, 0.5)
			circle.Size = ud2o()
			circle.Position = ud2s(0.5, 0.5)
			circle.Parent = object
			local rounding = new('UICorner')
			rounding.CornerRadius = ud(1)
			rounding.Parent = circle

			local abssz = object.AbsoluteSize
			local size = max(abssz.X, abssz.Y) * 5/3

			TweenSize(circle, ud2o(size, size), "Out", "Quart", 0.4)
			service.TweenService:Create(circle, ti(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {BackgroundTransparency = 1}):Play()

			service.Debris:AddItem(circle, 0.4)
		end

		local function initGui(self,frame)
			local checkbox = frame or create({
				{1,"ImageButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="Checkbox",Position=UDim2.new(0,3,0,3),Size=UDim2.new(0,16,0,16),}},
				{2,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="ripples",Parent={1},Size=UDim2.new(1,0,1,0),}},
				{3,"Frame",{BackgroundColor3=Color3.new(0.10196078568697,0.10196078568697,0.10196078568697),BorderSizePixel=0,Name="outline",Parent={1},Size=UDim2.new(0,16,0,16),}},
				{4,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderSizePixel=0,Name="filler",Parent={3},Position=UDim2.new(0,1,0,1),Size=UDim2.new(0,14,0,14),}},
				{5,"Frame",{BackgroundColor3=Color3.new(0.90196084976196,0.90196084976196,0.90196084976196),BorderSizePixel=0,Name="top",Parent={4},Size=UDim2.new(0,16,0,0),}},
				{6,"Frame",{AnchorPoint=Vector2.new(0,1),BackgroundColor3=Color3.new(0.90196084976196,0.90196084976196,0.90196084976196),BorderSizePixel=0,Name="bottom",Parent={4},Position=UDim2.new(0,0,0,14),Size=UDim2.new(0,16,0,0),}},
				{7,"Frame",{BackgroundColor3=Color3.new(0.90196084976196,0.90196084976196,0.90196084976196),BorderSizePixel=0,Name="left",Parent={4},Size=UDim2.new(0,0,0,16),}},
				{8,"Frame",{AnchorPoint=Vector2.new(1,0),BackgroundColor3=Color3.new(0.90196084976196,0.90196084976196,0.90196084976196),BorderSizePixel=0,Name="right",Parent={4},Position=UDim2.new(0,14,0,0),Size=UDim2.new(0,0,0,16),}},
				{9,"Frame",{AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=true,Name="checkmark",Parent={4},Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.new(0,0,0,20),}},
				{10,"ImageLabel",{AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Image="rbxassetid://6234266378",Parent={9},Position=UDim2.new(0.5,0,0.5,0),ScaleType=3,Size=UDim2.new(0,15,0,11),}},
				{11,"ImageLabel",{AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://6401617475",ImageColor3=Color3.new(0.20784313976765,0.69803923368454,0.98431372642517),Name="checkmark2",Parent={4},Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.new(0,12,0,12),Visible=false,}},
				{12,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://6425281788",ImageTransparency=0.20000000298023,Name="middle",Parent={4},ScaleType=2,Size=UDim2.new(1,0,1,0),TileSize=UDim2.new(0,2,0,2),Visible=false,}},
				{13,"UICorner",{CornerRadius=UDim.new(0,2),Parent={3},}},
			})
			local outline = checkbox.outline
			local filler = outline.filler
			local checkmark = filler.checkmark
			local ripples_container = checkbox.ripples

			-- walls
			local top, bottom, left, right = filler.top, filler.bottom, filler.left, filler.right

			self.Gui = checkbox
			self.GuiElems = {
				Top = top,
				Bottom = bottom,
				Left = left,
				Right = right,
				Outline = outline,
				Filler = filler,
				Checkmark = checkmark,
				Checkmark2 = filler.checkmark2,
				Middle = filler.middle
			}

			checkbox.Activated:Connect(function()
				if Lib.CheckMouseInGui(checkbox) then
					if self.Style == 0 then
						ripple(ripples_container, self.Disabled and self.Colors.Disabled or self.Colors.Primary)
					end

					if not self.Disabled then
						self:SetState(not self.Toggled,true)
					else
						self:Paint()
					end

					self.OnInput:Fire()
				end
			end)

			-- Old:
			--[[checkbox.InputBegan:Connect(function(i)
				if i.UserInputType == Enum.UserInputType.MouseButton1 then
					local release
					release = service.UserInputService.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							release:Disconnect()

							if Lib.CheckMouseInGui(checkbox) then
								if self.Style == 0 then
									ripple(ripples_container, self.Disabled and self.Colors.Disabled or self.Colors.Primary)
								end

								if not self.Disabled then
									self:SetState(not self.Toggled,true)
								else
									self:Paint()
								end
								
								self.OnInput:Fire()
							end
						end
					end)
				end
			end)]]

			self:Paint()
		end

		funcs.Collapse = function(self,anim)
			local guiElems = self.GuiElems
			if anim then
				TweenSize(guiElems.Top, ud2o(14, 14), "In", "Quart", 4/15, true)
				TweenSize(guiElems.Bottom, ud2o(14, 14), "In", "Quart", 4/15, true)
				TweenSize(guiElems.Left, ud2o(14, 14), "In", "Quart", 4/15, true)
				TweenSize(guiElems.Right, ud2o(14, 14), "In", "Quart", 4/15, true)
			else
				guiElems.Top.Size = ud2o(14, 14)
				guiElems.Bottom.Size = ud2o(14, 14)
				guiElems.Left.Size = ud2o(14, 14)
				guiElems.Right.Size = ud2o(14, 14)
			end
		end

		funcs.Expand = function(self,anim)
			local guiElems = self.GuiElems
			if anim then
				TweenSize(guiElems.Top, ud2o(14, 0), "InOut", "Quart", 4/15, true)
				TweenSize(guiElems.Bottom, ud2o(14, 0), "InOut", "Quart", 4/15, true)
				TweenSize(guiElems.Left, ud2o(0, 14), "InOut", "Quart", 4/15, true)
				TweenSize(guiElems.Right, ud2o(0, 14), "InOut", "Quart", 4/15, true)
			else
				guiElems.Top.Size = ud2o(14, 0)
				guiElems.Bottom.Size = ud2o(14, 0)
				guiElems.Left.Size = ud2o(0, 14)
				guiElems.Right.Size = ud2o(0, 14)
			end
		end

		funcs.Paint = function(self)
			local guiElems = self.GuiElems

			if self.Style == 0 then
				local color_base = self.Disabled and self.Colors.Disabled
				guiElems.Outline.BackgroundColor3 = color_base or (self.Toggled and self.Colors.Primary) or self.Colors.Secondary
				local walls_color = color_base or self.Colors.Primary
				guiElems.Top.BackgroundColor3 = walls_color
				guiElems.Bottom.BackgroundColor3 = walls_color
				guiElems.Left.BackgroundColor3 = walls_color
				guiElems.Right.BackgroundColor3 = walls_color
			else
				guiElems.Outline.BackgroundColor3 = self.Disabled and self.Colors.Disabled or self.Colors.Secondary
				guiElems.Filler.BackgroundColor3 = self.Disabled and self.Colors.DisabledBackground or self.Colors.Background
				guiElems.Checkmark2.ImageColor3 = self.Disabled and self.Colors.DisabledCheck or self.Colors.Primary
			end
		end

		funcs.SetState = function(self,val,anim)
			self.Toggled = val

			if self.OutlineColorTween then self.OutlineColorTween:Cancel() end
			local setStateTime = tick()
			self.LastSetStateTime = setStateTime

			if self.Toggled then
				if self.Style == 0 then
					if anim then
						self.OutlineColorTween = service.TweenService:Create(self.GuiElems.Outline, ti(4/15, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), {BackgroundColor3 = self.Colors.Primary})
						self.OutlineColorTween:Play()
						delay(0.15, function()
							if setStateTime ~= self.LastSetStateTime then return end
							self:Paint()
							TweenSize(self.GuiElems.Checkmark, ud2o(14, 20), "Out", "Bounce", 2/15, true)
						end)
					else
						self.GuiElems.Outline.BackgroundColor3 = self.Colors.Primary
						self:Paint()
						self.GuiElems.Checkmark.Size = ud2o(14, 20)
					end
					self:Collapse(anim)
				else
					self:Paint()
					self.GuiElems.Checkmark2.Visible = true
					self.GuiElems.Middle.Visible = false
				end
			else
				if self.Style == 0 then
					if anim then
						self.OutlineColorTween = service.TweenService:Create(self.GuiElems.Outline, ti(4/15, Enum.EasingStyle.Circular, Enum.EasingDirection.In), {BackgroundColor3 = self.Colors.Secondary})
						self.OutlineColorTween:Play()
						delay(0.15, function()
							if setStateTime ~= self.LastSetStateTime then return end
							self:Paint()
							TweenSize(self.GuiElems.Checkmark, ud2o(0, 20), "Out", "Quad", 1/15, true)
						end)
					else
						self.GuiElems.Outline.BackgroundColor3 = self.Colors.Secondary
						self:Paint()
						self.GuiElems.Checkmark.Size = ud2o(0, 20)
					end
					self:Expand(anim)
				else
					self:Paint()
					self.GuiElems.Checkmark2.Visible = false
					self.GuiElems.Middle.Visible = self.Toggled == nil
				end
			end
		end

		local mt = {__index = funcs}

		local function new(style)
			local obj = setmetatable({
				Toggled = false,
				Disabled = false,
				OnInput = Lib.Signal.new(),
				Style = style or 0,
				Colors = {
					Background = c3(36,36,36),
					Primary = c3(49,176,230),
					Secondary = c3(25,25,25),
					Disabled = c3(64,64,64),
					DisabledBackground = c3(52,52,52),
					DisabledCheck = c3(80,80,80)
				}
			},mt)
			initGui(obj)
			return obj
		end

		local function fromFrame(frame)
			local obj = setmetatable({
				Toggled = false,
				Disabled = false,
				Colors = {
					Background = c3(36,36,36),
					Primary = c3(49,176,230),
					Secondary = c3(25,25,25),
					Disabled = c3(64,64,64),
					DisabledBackground = c3(52,52,52)
				}
			},mt)
			initGui(obj,frame)
			return obj
		end

		return {new = new, fromFrame}
	end)()

	Lib.BrickColorPicker = (function()
		local funcs = {}
		local paletteCount = 0
		local mouse = service.Players.LocalPlayer:GetMouse()
		local hexStartX = 4
		local hexSizeX = 27
		local hexTriangleStart = 1
		local hexTriangleSize = 8

		local bottomColors = {
			Color3.fromRGB(17,17,17),
			Color3.fromRGB(99,95,98),
			Color3.fromRGB(163,162,165),
			Color3.fromRGB(205,205,205),
			Color3.fromRGB(223,223,222),
			Color3.fromRGB(237,234,234),
			Color3.fromRGB(27,42,53),
			Color3.fromRGB(91,93,105),
			Color3.fromRGB(159,161,172),
			Color3.fromRGB(202,203,209),
			Color3.fromRGB(231,231,236),
			Color3.fromRGB(248,248,248)
		}

		local function isMouseInHexagon(hex, touchPos)
			local relativeX = touchPos.X - hex.AbsolutePosition.X
			local relativeY = touchPos.Y - hex.AbsolutePosition.Y
			if relativeX >= hexStartX and relativeX < hexStartX + hexSizeX then
				relativeX = relativeX - 4
				local relativeWidth = (13 - math.min(relativeX, 26 - relativeX)) / 13
				if relativeY >= hexTriangleStart + hexTriangleSize * relativeWidth and relativeY < hex.AbsoluteSize.Y - hexTriangleStart - hexTriangleSize * relativeWidth then
					return true
				end
			end
			return false
		end

		local function hexInput(self, hex, color)
			hex.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					if isMouseInHexagon(hex, input.Position) then
						self.OnSelect:Fire(color)
						self:Close()
					end
				end
			end)

			hex.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					if isMouseInHexagon(hex, input.Position) then
						self.OnPreview:Fire(color)
					end
				end
			end)
		end

		local function createGui(self)
			local gui = create({
				{1,"ScreenGui",{Name="BrickColor",}},
				{2,"Frame",{Active=true,BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderColor3=Color3.new(0.1294117718935,0.1294117718935,0.1294117718935),Parent={1},Position=UDim2.new(0.40000000596046,0,0.40000000596046,0),Size=UDim2.new(0,337,0,380),}},
				{3,"TextButton",{BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),BorderSizePixel=0,Font=3,Name="MoreColors",Parent={2},Position=UDim2.new(0,5,1,-30),Size=UDim2.new(1,-10,0,25),Text="More Colors",TextColor3=Color3.new(1,1,1),TextSize=14,}},
				{4,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Image="rbxassetid://1281023007",ImageColor3=Color3.new(0.33333334326744,0.33333334326744,0.49803924560547),Name="Hex",Parent={2},Size=UDim2.new(0,35,0,35),Visible=false,}},
			})
			local colorFrame = gui.Frame
			local hex = colorFrame.Hex

			for row = 1,13 do
				local columns = math.min(row,14-row)+6
				for column = 1,columns do
					local nextColor = BrickColor.palette(paletteCount).Color
					local newHex = hex:Clone()
					newHex.Position = UDim2.new(0, (column-1)*25-(columns-7)*13+3*26 + 1, 0, (row-1)*23 + 4)
					newHex.ImageColor3 = nextColor
					newHex.Visible = true
					hexInput(self,newHex,nextColor)
					newHex.Parent = colorFrame
					paletteCount = paletteCount + 1
				end
			end

			for column = 1,12 do
				local nextColor = bottomColors[column]
				local newHex = hex:Clone()
				newHex.Position = UDim2.new(0, (column-1)*25-(12-7)*13+3*26 + 3, 0, 308)
				newHex.ImageColor3 = nextColor
				newHex.Visible = true
				hexInput(self,newHex,nextColor)
				newHex.Parent = colorFrame
				paletteCount = paletteCount + 1
			end

			colorFrame.MoreColors.MouseButton1Click:Connect(function()
				self.OnMoreColors:Fire()
				self:Close()
			end)

			self.Gui = gui
		end

		funcs.SetMoreColorsVisible = function(self,vis)
			local colorFrame = self.Gui.Frame
			colorFrame.Size = UDim2.new(0,337,0,380 - (not vis and 33 or 0))
			colorFrame.MoreColors.Visible = vis
		end

		funcs.Show = function(self,x,y,prevColor)
			self.PrevColor = prevColor or self.PrevColor

			local reverseY = false

			local x,y = x or mouse.X, y or mouse.Y
			local maxX,maxY = mouse.ViewSizeX,mouse.ViewSizeY
			Lib.ShowGui(self.Gui)
			local sizeX,sizeY = self.Gui.Frame.AbsoluteSize.X,self.Gui.Frame.AbsoluteSize.Y

			if x + sizeX > maxX then x = self.ReverseX and x - sizeX or maxX - sizeX end
			if y + sizeY > maxY then reverseY = true end

			local closable = false
			if self.CloseEvent then self.CloseEvent:Disconnect() end

			self.CloseEvent = service.UserInputService.InputBegan:Connect(function(input)
				if not closable or (input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch) then
					return
				end

				if not Lib.CheckMouseInGui(self.Gui.Frame) then
					self.CloseEvent:Disconnect()
					self:Close()
				end
			end)


			if reverseY then
				local newY = y - sizeY - (self.ReverseYOffset or 0)
				y = newY >= 0 and newY or 0
			end

			self.Gui.Frame.Position = UDim2.new(0,x,0,y)

			Lib.FastWait()
			closable = true
		end

		funcs.Close = function(self)
			self.Gui.Parent = nil
			self.OnCancel:Fire()
		end

		local mt = {__index = funcs}

		local function new()
			local obj = setmetatable({
				OnPreview = Lib.Signal.new(),
				OnSelect = Lib.Signal.new(),
				OnCancel = Lib.Signal.new(),
				OnMoreColors = Lib.Signal.new(),
				PrevColor = Color3.new(0,0,0)
			}, mt)
			createGui(obj)
			return obj
		end

		return {new = new}
	end)()

	Lib.ColorPicker = (function() -- TODO: Convert to newer class model
		local funcs = {}

		local function new()
			local newMt = setmetatable({},{})

			newMt.OnSelect = Lib.Signal.new()
			newMt.OnCancel = Lib.Signal.new()
			newMt.OnPreview = Lib.Signal.new()

			local guiContents = create({
				{1,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,ClipsDescendants=true,Name="Content",Position=UDim2.new(0,0,0,20),Size=UDim2.new(1,0,1,-20),}},
				{2,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="BasicColors",Parent={1},Position=UDim2.new(0,5,0,5),Size=UDim2.new(0,180,0,200),}},
				{3,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={2},Position=UDim2.new(0,0,0,-5),Size=UDim2.new(1,0,0,26),Text="Basic Colors",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{4,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Blue",Parent={1},Position=UDim2.new(1,-63,0,255),Size=UDim2.new(0,52,0,16),}},
				{5,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),Font=3,Name="Input",Parent={4},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,50,0,16),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{6,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="ArrowFrame",Parent={5},Position=UDim2.new(1,-16,0,0),Size=UDim2.new(0,16,1,0),}},
				{7,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Up",Parent={6},Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{8,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={7},Size=UDim2.new(0,16,0,8),}},
				{9,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={8},Position=UDim2.new(0,8,0,3),Size=UDim2.new(0,1,0,1),}},
				{10,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={8},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{11,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={8},Position=UDim2.new(0,6,0,5),Size=UDim2.new(0,5,0,1),}},
				{12,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Down",Parent={6},Position=UDim2.new(0,0,0,8),Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{13,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={12},Size=UDim2.new(0,16,0,8),}},
				{14,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={13},Position=UDim2.new(0,8,0,5),Size=UDim2.new(0,1,0,1),}},
				{15,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={13},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{16,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={13},Position=UDim2.new(0,6,0,3),Size=UDim2.new(0,5,0,1),}},
				{17,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={4},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Blue:",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{18,"Frame",{BackgroundColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),BorderSizePixel=0,ClipsDescendants=true,Name="ColorSpaceFrame",Parent={1},Position=UDim2.new(1,-261,0,4),Size=UDim2.new(0,222,0,202),}},
				{19,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),BorderSizePixel=0,Image="rbxassetid://1072518406",Name="ColorSpace",Parent={18},Position=UDim2.new(0,1,0,1),Size=UDim2.new(0,220,0,200),}},
				{20,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="Scope",Parent={19},Position=UDim2.new(0,210,0,190),Size=UDim2.new(0,20,0,20),}},
				{21,"Frame",{BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0,Name="Line",Parent={20},Position=UDim2.new(0,9,0,0),Size=UDim2.new(0,2,0,20),}},
				{22,"Frame",{BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0,Name="Line",Parent={20},Position=UDim2.new(0,0,0,9),Size=UDim2.new(0,20,0,2),}},
				{23,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="CustomColors",Parent={1},Position=UDim2.new(0,5,0,210),Size=UDim2.new(0,180,0,90),}},
				{24,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={23},Size=UDim2.new(1,0,0,20),Text="Custom Colors (RC = Set)",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{25,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Green",Parent={1},Position=UDim2.new(1,-63,0,233),Size=UDim2.new(0,52,0,16),}},
				{26,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),Font=3,Name="Input",Parent={25},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,50,0,16),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{27,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="ArrowFrame",Parent={26},Position=UDim2.new(1,-16,0,0),Size=UDim2.new(0,16,1,0),}},
				{28,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Up",Parent={27},Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{29,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={28},Size=UDim2.new(0,16,0,8),}},
				{30,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={29},Position=UDim2.new(0,8,0,3),Size=UDim2.new(0,1,0,1),}},
				{31,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={29},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{32,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={29},Position=UDim2.new(0,6,0,5),Size=UDim2.new(0,5,0,1),}},
				{33,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Down",Parent={27},Position=UDim2.new(0,0,0,8),Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{34,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={33},Size=UDim2.new(0,16,0,8),}},
				{35,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={34},Position=UDim2.new(0,8,0,5),Size=UDim2.new(0,1,0,1),}},
				{36,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={34},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{37,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={34},Position=UDim2.new(0,6,0,3),Size=UDim2.new(0,5,0,1),}},
				{38,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={25},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Green:",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{39,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Hue",Parent={1},Position=UDim2.new(1,-180,0,211),Size=UDim2.new(0,52,0,16),}},
				{40,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),Font=3,Name="Input",Parent={39},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,50,0,16),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{41,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="ArrowFrame",Parent={40},Position=UDim2.new(1,-16,0,0),Size=UDim2.new(0,16,1,0),}},
				{42,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Up",Parent={41},Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{43,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={42},Size=UDim2.new(0,16,0,8),}},
				{44,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={43},Position=UDim2.new(0,8,0,3),Size=UDim2.new(0,1,0,1),}},
				{45,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={43},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{46,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={43},Position=UDim2.new(0,6,0,5),Size=UDim2.new(0,5,0,1),}},
				{47,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Down",Parent={41},Position=UDim2.new(0,0,0,8),Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{48,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={47},Size=UDim2.new(0,16,0,8),}},
				{49,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={48},Position=UDim2.new(0,8,0,5),Size=UDim2.new(0,1,0,1),}},
				{50,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={48},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{51,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={48},Position=UDim2.new(0,6,0,3),Size=UDim2.new(0,5,0,1),}},
				{52,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={39},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Hue:",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{53,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Name="Preview",Parent={1},Position=UDim2.new(1,-260,0,211),Size=UDim2.new(0,35,1,-245),}},
				{54,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Red",Parent={1},Position=UDim2.new(1,-63,0,211),Size=UDim2.new(0,52,0,16),}},
				{55,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),Font=3,Name="Input",Parent={54},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,50,0,16),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{56,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="ArrowFrame",Parent={55},Position=UDim2.new(1,-16,0,0),Size=UDim2.new(0,16,1,0),}},
				{57,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Up",Parent={56},Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{58,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={57},Size=UDim2.new(0,16,0,8),}},
				{59,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={58},Position=UDim2.new(0,8,0,3),Size=UDim2.new(0,1,0,1),}},
				{60,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={58},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{61,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={58},Position=UDim2.new(0,6,0,5),Size=UDim2.new(0,5,0,1),}},
				{62,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Down",Parent={56},Position=UDim2.new(0,0,0,8),Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{63,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={62},Size=UDim2.new(0,16,0,8),}},
				{64,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={63},Position=UDim2.new(0,8,0,5),Size=UDim2.new(0,1,0,1),}},
				{65,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={63},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{66,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={63},Position=UDim2.new(0,6,0,3),Size=UDim2.new(0,5,0,1),}},
				{67,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={54},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Red:",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{68,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Sat",Parent={1},Position=UDim2.new(1,-180,0,233),Size=UDim2.new(0,52,0,16),}},
				{69,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),Font=3,Name="Input",Parent={68},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,50,0,16),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{70,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="ArrowFrame",Parent={69},Position=UDim2.new(1,-16,0,0),Size=UDim2.new(0,16,1,0),}},
				{71,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Up",Parent={70},Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{72,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={71},Size=UDim2.new(0,16,0,8),}},
				{73,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={72},Position=UDim2.new(0,8,0,3),Size=UDim2.new(0,1,0,1),}},
				{74,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={72},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{75,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={72},Position=UDim2.new(0,6,0,5),Size=UDim2.new(0,5,0,1),}},
				{76,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Down",Parent={70},Position=UDim2.new(0,0,0,8),Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{77,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={76},Size=UDim2.new(0,16,0,8),}},
				{78,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={77},Position=UDim2.new(0,8,0,5),Size=UDim2.new(0,1,0,1),}},
				{79,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={77},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{80,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={77},Position=UDim2.new(0,6,0,3),Size=UDim2.new(0,5,0,1),}},
				{81,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={68},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Sat:",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{82,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Val",Parent={1},Position=UDim2.new(1,-180,0,255),Size=UDim2.new(0,52,0,16),}},
				{83,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),Font=3,Name="Input",Parent={82},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,50,0,16),Text="255",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{84,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="ArrowFrame",Parent={83},Position=UDim2.new(1,-16,0,0),Size=UDim2.new(0,16,1,0),}},
				{85,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Up",Parent={84},Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{86,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={85},Size=UDim2.new(0,16,0,8),}},
				{87,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={86},Position=UDim2.new(0,8,0,3),Size=UDim2.new(0,1,0,1),}},
				{88,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={86},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{89,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={86},Position=UDim2.new(0,6,0,5),Size=UDim2.new(0,5,0,1),}},
				{90,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Down",Parent={84},Position=UDim2.new(0,0,0,8),Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{91,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={90},Size=UDim2.new(0,16,0,8),}},
				{92,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={91},Position=UDim2.new(0,8,0,5),Size=UDim2.new(0,1,0,1),}},
				{93,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={91},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{94,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={91},Position=UDim2.new(0,6,0,3),Size=UDim2.new(0,5,0,1),}},
				{95,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={82},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Val:",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{96,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Font=3,Name="Cancel",Parent={1},Position=UDim2.new(1,-105,1,-28),Size=UDim2.new(0,100,0,25),Text="Cancel",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{97,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Font=3,Name="Ok",Parent={1},Position=UDim2.new(1,-210,1,-28),Size=UDim2.new(0,100,0,25),Text="OK",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{98,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Image="rbxassetid://1072518502",Name="ColorStrip",Parent={1},Position=UDim2.new(1,-30,0,5),Size=UDim2.new(0,13,0,200),}},
				{99,"Frame",{BackgroundColor3=Color3.new(0.3137255012989,0.3137255012989,0.3137255012989),BackgroundTransparency=1,BorderSizePixel=0,Name="ArrowFrame",Parent={1},Position=UDim2.new(1,-16,0,1),Size=UDim2.new(0,5,0,208),}},
				{100,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={99},Position=UDim2.new(0,-2,0,-4),Size=UDim2.new(0,8,0,16),}},
				{101,"Frame",{BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0,Parent={100},Position=UDim2.new(0,2,0,8),Size=UDim2.new(0,1,0,1),}},
				{102,"Frame",{BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0,Parent={100},Position=UDim2.new(0,3,0,7),Size=UDim2.new(0,1,0,3),}},
				{103,"Frame",{BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0,Parent={100},Position=UDim2.new(0,4,0,6),Size=UDim2.new(0,1,0,5),}},
				{104,"Frame",{BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0,Parent={100},Position=UDim2.new(0,5,0,5),Size=UDim2.new(0,1,0,7),}},
				{105,"Frame",{BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0,Parent={100},Position=UDim2.new(0,6,0,4),Size=UDim2.new(0,1,0,9),}},
			})
			local window = Lib.Window.new()
			window.Resizable = false
			window.Alignable = false
			window:SetTitle("Color Picker")
			window:Resize(450,330)
			for i,v in pairs(guiContents:GetChildren()) do
				v.Parent = window.GuiElems.Content
			end
			newMt.Window = window
			newMt.Gui = window.Gui
			local pickerGui = window.Gui.Main
			local pickerTopBar = pickerGui.TopBar
			local pickerFrame = pickerGui.Content
			local colorSpace = pickerFrame.ColorSpaceFrame.ColorSpace
			local colorStrip = pickerFrame.ColorStrip
			local previewFrame = pickerFrame.Preview
			local basicColorsFrame = pickerFrame.BasicColors
			local customColorsFrame = pickerFrame.CustomColors
			local okButton = pickerFrame.Ok
			local cancelButton = pickerFrame.Cancel
			local closeButton = pickerTopBar.Close

			local colorScope = colorSpace.Scope
			local colorArrow = pickerFrame.ArrowFrame.Arrow

			local hueInput = pickerFrame.Hue.Input
			local satInput = pickerFrame.Sat.Input
			local valInput = pickerFrame.Val.Input

			local redInput = pickerFrame.Red.Input
			local greenInput = pickerFrame.Green.Input
			local blueInput = pickerFrame.Blue.Input

			local user = service.UserInputService
			local mouse = service.Players.LocalPlayer:GetMouse()

			local hue,sat,val = 0,0,1
			local red,green,blue = 1,1,1
			local chosenColor = Color3.new(0,0,0)

			local basicColors = {Color3.new(0,0,0),Color3.new(0.66666668653488,0,0),Color3.new(0,0.33333334326744,0),Color3.new(0.66666668653488,0.33333334326744,0),Color3.new(0,0.66666668653488,0),Color3.new(0.66666668653488,0.66666668653488,0),Color3.new(0,1,0),Color3.new(0.66666668653488,1,0),Color3.new(0,0,0.49803924560547),Color3.new(0.66666668653488,0,0.49803924560547),Color3.new(0,0.33333334326744,0.49803924560547),Color3.new(0.66666668653488,0.33333334326744,0.49803924560547),Color3.new(0,0.66666668653488,0.49803924560547),Color3.new(0.66666668653488,0.66666668653488,0.49803924560547),Color3.new(0,1,0.49803924560547),Color3.new(0.66666668653488,1,0.49803924560547),Color3.new(0,0,1),Color3.new(0.66666668653488,0,1),Color3.new(0,0.33333334326744,1),Color3.new(0.66666668653488,0.33333334326744,1),Color3.new(0,0.66666668653488,1),Color3.new(0.66666668653488,0.66666668653488,1),Color3.new(0,1,1),Color3.new(0.66666668653488,1,1),Color3.new(0.33333334326744,0,0),Color3.new(1,0,0),Color3.new(0.33333334326744,0.33333334326744,0),Color3.new(1,0.33333334326744,0),Color3.new(0.33333334326744,0.66666668653488,0),Color3.new(1,0.66666668653488,0),Color3.new(0.33333334326744,1,0),Color3.new(1,1,0),Color3.new(0.33333334326744,0,0.49803924560547),Color3.new(1,0,0.49803924560547),Color3.new(0.33333334326744,0.33333334326744,0.49803924560547),Color3.new(1,0.33333334326744,0.49803924560547),Color3.new(0.33333334326744,0.66666668653488,0.49803924560547),Color3.new(1,0.66666668653488,0.49803924560547),Color3.new(0.33333334326744,1,0.49803924560547),Color3.new(1,1,0.49803924560547),Color3.new(0.33333334326744,0,1),Color3.new(1,0,1),Color3.new(0.33333334326744,0.33333334326744,1),Color3.new(1,0.33333334326744,1),Color3.new(0.33333334326744,0.66666668653488,1),Color3.new(1,0.66666668653488,1),Color3.new(0.33333334326744,1,1),Color3.new(1,1,1)}
			local customColors = {}

			local function updateColor(noupdate)
				local relativeX, relativeY, relativeStripY = 219 - hue * 219, 199 - sat * 199, 199 - val * 199
				local hsvColor = Color3.fromHSV(hue, sat, val)

				if noupdate == 2 or not noupdate then
					hueInput.Text = tostring(math.ceil(359 * hue))
					satInput.Text = tostring(math.ceil(255 * sat))
					valInput.Text = tostring(math.floor(255 * val))
				end
				if noupdate == 1 or not noupdate then
					redInput.Text = tostring(math.floor(255 * red))
					greenInput.Text = tostring(math.floor(255 * green))
					blueInput.Text = tostring(math.floor(255 * blue))
				end

				chosenColor = Color3.new(red, green, blue)
				colorScope.Position = UDim2.new(0, (relativeX - 9), 0, (relativeY - 9))
				colorStrip.ImageColor3 = Color3.fromHSV(hue, sat, 1)
				colorArrow.Position = UDim2.new(0, -2, 0, (relativeStripY - 4))
				previewFrame.BackgroundColor3 = chosenColor

				newMt.Color = chosenColor
				newMt.OnPreview:Fire(chosenColor)
			end

			local function handleInputBegan(input, updateFunc)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					while user:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						updateFunc()task.wait()
					end
				end
			end

			local function colorSpaceInput()
				local relativeX = mouse.X - colorSpace.AbsolutePosition.X
				local relativeY = mouse.Y - colorSpace.AbsolutePosition.Y

				if relativeX < 0 then relativeX = 0 elseif relativeX > 219 then relativeX = 219 end
				if relativeY < 0 then relativeY = 0 elseif relativeY > 199 then relativeY = 199 end

				hue = (219 - relativeX) / 219
				sat = (199 - relativeY) / 199

				local hsvColor = Color3.fromHSV(hue, sat, val)
				red, green, blue = hsvColor.R, hsvColor.G, hsvColor.B
				updateColor()
			end

			local function colorStripInput()
				local relativeY = mouse.Y - colorStrip.AbsolutePosition.Y

				if relativeY < 0 then relativeY = 0 elseif relativeY > 199 then relativeY = 199 end	

				val = (199 - relativeY) / 199

				local hsvColor = Color3.fromHSV(hue, sat, val)
				red, green, blue = hsvColor.R, hsvColor.G, hsvColor.B
				updateColor()
			end

			colorSpace.InputBegan:Connect(function(input) handleInputBegan(input, colorSpaceInput) end)
			colorStrip.InputBegan:Connect(function(input) handleInputBegan(input, colorStripInput) end)

			local function hookButtons(frame, func)
				frame.ArrowFrame.Up.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						local releaseEvent, runEvent
						local startTime = tick()
						local pressing = true
						local startNum = tonumber(frame.Text)

						if not startNum then return end

						releaseEvent = user.InputEnded:Connect(function(endInput)
							if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
								releaseEvent:Disconnect()
								pressing = false
							end
						end)

						startNum = startNum + 1
						func(startNum)
						while pressing do
							if tick() - startTime > 0.3 then
								startNum = startNum + 1
								func(startNum)
								startTime = tick()
							end
							task.wait(0.1)
						end
					end
				end)

				frame.ArrowFrame.Down.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						local releaseEvent, runEvent
						local startTime = tick()
						local pressing = true
						local startNum = tonumber(frame.Text)

						if not startNum then return end

						releaseEvent = user.InputEnded:Connect(function(endInput)
							if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
								releaseEvent:Disconnect()
								pressing = false
							end
						end)

						startNum = startNum - 1
						func(startNum)
						while pressing do
							if tick() - startTime > 0.3 then
								startNum = startNum - 1
								func(startNum)
								startTime = tick()
							end
							task.wait(0.1)
						end
					end
				end)
			end

			--[[local function UpdateBox(TextBox, Value, IsHSV, ...)
				local number = tonumber(TextBox.Text)
				if number then
					number = math.clamp(math.floor(number), 0, Value) / Value
					local HSV = Color3.fromHSV(func(number))
					red, green, blue = HSV.R, HSV.G, HSV.B
					
					TextBox.Text = tostring(number):sub(4)
					updateColor(IsHSV)
				end
			end]]

			local function updateHue(str)
				local num = tonumber(str)
				if num then
					hue = math.clamp(math.floor(num),0,359)/359
					local hsvColor = Color3.fromHSV(hue,sat,val)
					red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b

					hueInput.Text = tostring(hue*359)
					updateColor(1)
				end
			end
			hueInput.FocusLost:Connect(function() updateHue(hueInput.Text) end) hookButtons(hueInput, hueInput)

			local function updateSat(str)
				local num = tonumber(str)
				if num then
					sat = math.clamp(math.floor(num),0,255)/255
					local hsvColor = Color3.fromHSV(hue,sat,val)
					red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b
					satInput.Text = tostring(sat*255)
					updateColor(1)
				end
			end
			satInput.FocusLost:Connect(function() updateSat(satInput.Text) end) hookButtons(satInput,updateSat)

			local function updateVal(str)
				local num = tonumber(str)
				if num then
					val = math.clamp(math.floor(num),0,255)/255
					local hsvColor = Color3.fromHSV(hue,sat,val)
					red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b
					valInput.Text = tostring(val*255)
					updateColor(1)
				end
			end
			valInput.FocusLost:Connect(function() updateVal(valInput.Text) end) hookButtons(valInput,updateVal)

			local function updateRed(str)
				local num = tonumber(str)
				if num then
					red = math.clamp(math.floor(num),0,255)/255
					local newColor = Color3.new(red,green,blue)
					hue,sat,val = Color3.toHSV(newColor)
					redInput.Text = tostring(red*255)
					updateColor(2)
				end
			end
			redInput.FocusLost:Connect(function() updateRed(redInput.Text) end) hookButtons(redInput,updateRed)

			local function updateGreen(str)
				local num = tonumber(str)
				if num then
					green = math.clamp(math.floor(num),0,255)/255
					local newColor = Color3.new(red,green,blue)
					hue,sat,val = Color3.toHSV(newColor)
					greenInput.Text = tostring(green*255)
					updateColor(2)
				end
			end
			greenInput.FocusLost:Connect(function() updateGreen(greenInput.Text) end) hookButtons(greenInput,updateGreen)

			local function updateBlue(str)
				local num = tonumber(str)
				if num then
					blue = math.clamp(math.floor(num),0,255)/255
					local newColor = Color3.new(red,green,blue)
					hue,sat,val = Color3.toHSV(newColor)
					blueInput.Text = tostring(blue*255)
					updateColor(2)
				end
			end
			blueInput.FocusLost:Connect(function() updateBlue(blueInput.Text) end) hookButtons(blueInput,updateBlue)

			local colorChoice = Instance.new("TextButton")
			colorChoice.Name = "Choice"
			colorChoice.Size = UDim2.new(0,25,0,18)
			colorChoice.BorderColor3 = Color3.fromRGB(55,55,55)
			colorChoice.Text = ""
			colorChoice.AutoButtonColor = false

			local row = 0
			local column = 0
			for i,v in pairs(basicColors) do
				local newColor = colorChoice:Clone()
				newColor.BackgroundColor3 = v
				newColor.Position = UDim2.new(0,1 + 30*column,0,21 + 23*row)

				newColor.MouseButton1Click:Connect(function()
					red,green,blue = v.r,v.g,v.b
					local newColor = Color3.new(red,green,blue)
					hue,sat,val = Color3.toHSV(newColor)
					updateColor()
				end)

				newColor.Parent = basicColorsFrame
				column = column + 1
				if column == 6 then row = row + 1 column = 0 end
			end

			row = 0
			column = 0
			for i = 1,12 do
				local color = customColors[i] or Color3.new(0,0,0)
				local newColor = colorChoice:Clone()
				newColor.BackgroundColor3 = color
				newColor.Position = UDim2.new(0,1 + 30*column,0,20 + 23*row)

				newColor.MouseButton1Click:Connect(function()
					local curColor = customColors[i] or Color3.new(0,0,0)
					red,green,blue = curColor.r,curColor.g,curColor.b
					hue,sat,val = Color3.toHSV(curColor)
					updateColor()
				end)

				newColor.MouseButton2Click:Connect(function()
					customColors[i] = chosenColor
					newColor.BackgroundColor3 = chosenColor
				end)

				newColor.Parent = customColorsFrame
				column = column + 1
				if column == 6 then row = row + 1 column = 0 end
			end

			okButton.MouseButton1Click:Connect(function() newMt.OnSelect:Fire(chosenColor) window:Close() end)
			okButton.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then okButton.BackgroundTransparency = 0.4 end end)
			okButton.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then okButton.BackgroundTransparency = 0 end end)


			cancelButton.MouseButton1Click:Connect(function() newMt.OnCancel:Fire() window:Close() end)
			cancelButton.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then cancelButton.BackgroundTransparency = 0.4 end end)
			cancelButton.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then cancelButton.BackgroundTransparency = 0 end end)

			updateColor()

			newMt.SetColor = function(self,color)
				red,green,blue = color.r,color.g,color.b
				hue,sat,val = Color3.toHSV(color)
				updateColor()
			end

			newMt.Show = function(self)
				self.Window:Show()
			end

			return newMt
		end

		return {new = new}
	end)()

	Lib.NumberSequenceEditor = (function()
		local function new() -- TODO: Convert to newer class model
			local newMt = setmetatable({},{})
			newMt.OnSelect = Lib.Signal.new()
			newMt.OnCancel = Lib.Signal.new()
			newMt.OnPreview = Lib.Signal.new()

			local guiContents = create({
				{1,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,ClipsDescendants=true,Name="Content",Position=UDim2.new(0,0,0,20),Size=UDim2.new(1,0,1,-20),}},
				{2,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Time",Parent={1},Position=UDim2.new(0,40,0,210),Size=UDim2.new(0,60,0,20),}},
				{3,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),ClipsDescendants=true,Font=3,Name="Input",Parent={2},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,58,0,20),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{4,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={2},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Time",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{5,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Font=3,Name="Close",Parent={1},Position=UDim2.new(1,-90,0,210),Size=UDim2.new(0,80,0,20),Text="Close",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{6,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Font=3,Name="Reset",Parent={1},Position=UDim2.new(1,-180,0,210),Size=UDim2.new(0,80,0,20),Text="Reset",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{7,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Font=3,Name="Delete",Parent={1},Position=UDim2.new(0,380,0,210),Size=UDim2.new(0,80,0,20),Text="Delete",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{8,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Name="NumberLineOutlines",Parent={1},Position=UDim2.new(0,10,0,20),Size=UDim2.new(1,-20,0,170),}},
				{9,"Frame",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),Name="NumberLine",Parent={1},Position=UDim2.new(0,10,0,20),Size=UDim2.new(1,-20,0,170),}},
				{10,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Value",Parent={1},Position=UDim2.new(0,170,0,210),Size=UDim2.new(0,60,0,20),}},
				{11,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={10},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Value",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{12,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),ClipsDescendants=true,Font=3,Name="Input",Parent={10},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,58,0,20),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{13,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Envelope",Parent={1},Position=UDim2.new(0,300,0,210),Size=UDim2.new(0,60,0,20),}},
				{14,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),ClipsDescendants=true,Font=3,Name="Input",Parent={13},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,58,0,20),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{15,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={13},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Envelope",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
			})
			local window = Lib.Window.new()
			window.Resizable = false
			window:Resize(680,265)
			window:SetTitle("NumberSequence Editor")
			newMt.Window = window
			newMt.Gui = window.Gui
			for i,v in pairs(guiContents:GetChildren()) do
				v.Parent = window.GuiElems.Content
			end
			local gui = window.Gui
			local pickerGui = gui.Main
			local pickerTopBar = pickerGui.TopBar
			local pickerFrame = pickerGui.Content
			local numberLine = pickerFrame.NumberLine
			local numberLineOutlines = pickerFrame.NumberLineOutlines
			local timeBox = pickerFrame.Time.Input
			local valueBox = pickerFrame.Value.Input
			local envelopeBox = pickerFrame.Envelope.Input
			local deleteButton = pickerFrame.Delete
			local resetButton = pickerFrame.Reset
			local closeButton = pickerFrame.Close
			local topClose = pickerTopBar.Close

			local points = {{1,0,3},{8,0.05,1},{5,0.6,2},{4,0.7,4},{6,1,4}}
			local lines = {}
			local eLines = {}
			local beginPoint = points[1]
			local endPoint = points[#points]
			local currentlySelected = nil
			local currentPoint = nil
			local resetSequence = nil

			local user = service.UserInputService
			local mouse = service.Players.LocalPlayer:GetMouse()

			for i = 2,10 do
				local newLine = Instance.new("Frame")
				newLine.BackgroundTransparency = 0.5
				newLine.BackgroundColor3 = Color3.new(96/255,96/255,96/255)
				newLine.BorderSizePixel = 0
				newLine.Size = UDim2.new(0,1,1,0)
				newLine.Position = UDim2.new((i-1)/(11-1),0,0,0)
				newLine.Parent = numberLineOutlines
			end

			for i = 2,4 do
				local newLine = Instance.new("Frame")
				newLine.BackgroundTransparency = 0.5
				newLine.BackgroundColor3 = Color3.new(96/255,96/255,96/255)
				newLine.BorderSizePixel = 0
				newLine.Size = UDim2.new(1,0,0,1)
				newLine.Position = UDim2.new(0,0,(i-1)/(5-1),0)
				newLine.Parent = numberLineOutlines
			end

			local lineTemp = Instance.new("Frame")
			lineTemp.BackgroundColor3 = Color3.new(0,0,0)
			lineTemp.BorderSizePixel = 0
			lineTemp.Size = UDim2.new(0,1,0,1)

			local sequenceLine = Instance.new("Frame")
			sequenceLine.BackgroundColor3 = Color3.new(0,0,0)
			sequenceLine.BorderSizePixel = 0
			sequenceLine.Size = UDim2.new(0,1,0,0)

			for i = 1,numberLine.AbsoluteSize.X do
				local line = sequenceLine:Clone()
				eLines[i] = line
				line.Name = "E"..tostring(i)
				line.BackgroundTransparency = 0.5
				line.BackgroundColor3 = Color3.new(199/255,44/255,28/255)
				line.Position = UDim2.new(0,i-1,0,0)
				line.Parent = numberLine
			end

			for i = 1,numberLine.AbsoluteSize.X do
				local line = sequenceLine:Clone()
				lines[i] = line
				line.Name = tostring(i)
				line.Position = UDim2.new(0,i-1,0,0)
				line.Parent = numberLine
			end

			local envelopeDrag = Instance.new("Frame")
			envelopeDrag.BackgroundTransparency = 1
			envelopeDrag.BackgroundColor3 = Color3.new(0,0,0)
			envelopeDrag.BorderSizePixel = 0
			envelopeDrag.Size = UDim2.new(0,7,0,20)
			envelopeDrag.Visible = false
			envelopeDrag.ZIndex = 2
			local envelopeDragLine = Instance.new("Frame",envelopeDrag)
			envelopeDragLine.Name = "Line"
			envelopeDragLine.BackgroundColor3 = Color3.new(0,0,0)
			envelopeDragLine.BorderSizePixel = 0
			envelopeDragLine.Position = UDim2.new(0,3,0,0)
			envelopeDragLine.Size = UDim2.new(0,1,0,20)
			envelopeDragLine.ZIndex = 2

			local envelopeDragTop,envelopeDragBottom = envelopeDrag:Clone(),envelopeDrag:Clone()
			envelopeDragTop.Parent = numberLine
			envelopeDragBottom.Parent = numberLine

			local function buildSequence()
				local newPoints = {}
				for i,v in pairs(points) do
					table.insert(newPoints,NumberSequenceKeypoint.new(v[2],v[1],v[3]))
				end
				newMt.Sequence = NumberSequence.new(newPoints)
				newMt.OnSelect:Fire(newMt.Sequence)
			end

			local function round(num,places)
				local multi = 10^places
				return math.floor(num*multi + 0.5)/multi
			end

			local function updateInputs(point)
				if point then
					currentPoint = point
					local rawT,rawV,rawE = point[2],point[1],point[3]
					timeBox.Text = round(rawT,(rawT < 0.01 and 5) or (rawT < 0.1 and 4) or 3)
					valueBox.Text = round(rawV,(rawV < 0.01 and 5) or (rawV < 0.1 and 4) or (rawV < 1 and 3) or 2)
					envelopeBox.Text = round(rawE,(rawE < 0.01 and 5) or (rawE < 0.1 and 4) or (rawV < 1 and 3) or 2)

					local envelopeDistance = numberLine.AbsoluteSize.Y*(point[3]/10)
					envelopeDragTop.Position = UDim2.new(0,point[4].Position.X.Offset-1,0,point[4].Position.Y.Offset-envelopeDistance-17)
					envelopeDragTop.Visible = true
					envelopeDragBottom.Position = UDim2.new(0,point[4].Position.X.Offset-1,0,point[4].Position.Y.Offset+envelopeDistance+2)
					envelopeDragBottom.Visible = true
				end
			end

			envelopeDragTop.InputBegan:Connect(function(input)
				if (input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch) or not currentPoint or Lib.CheckMouseInGui(currentPoint[4].Select) then return end

				local mouseEvent, releaseEvent
				local maxSize = numberLine.AbsoluteSize.Y
				local mouseDelta = math.abs(envelopeDragTop.AbsolutePosition.Y - mouse.Y)

				envelopeDragTop.Line.Position = UDim2.new(0, 2, 0, 0)
				envelopeDragTop.Line.Size = UDim2.new(0, 3, 0, 20)

				releaseEvent = user.InputEnded:Connect(function(input)
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
					mouseEvent:Disconnect()
					releaseEvent:Disconnect()
					envelopeDragTop.Line.Position = UDim2.new(0, 3, 0, 0)
					envelopeDragTop.Line.Size = UDim2.new(0, 1, 0, 20)
				end)

				mouseEvent = user.InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						local topDiff = (currentPoint[4].AbsolutePosition.Y + 2) - (mouse.Y - mouseDelta) - 19
						local newEnvelope = 10 * (math.max(topDiff, 0) / maxSize)
						local maxEnvelope = math.min(currentPoint[1], 10 - currentPoint[1])
						currentPoint[3] = math.min(newEnvelope, maxEnvelope)
						newMt:Redraw()
						buildSequence()
						updateInputs(currentPoint)
					end
				end)
			end)

			envelopeDragBottom.InputBegan:Connect(function(input)
				if (input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch) or not currentPoint or Lib.CheckMouseInGui(currentPoint[4].Select) then return end

				local mouseEvent, releaseEvent
				local maxSize = numberLine.AbsoluteSize.Y
				local mouseDelta = math.abs(envelopeDragBottom.AbsolutePosition.Y - mouse.Y)

				envelopeDragBottom.Line.Position = UDim2.new(0, 2, 0, 0)
				envelopeDragBottom.Line.Size = UDim2.new(0, 3, 0, 20)

				releaseEvent = user.InputEnded:Connect(function(input)
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
					mouseEvent:Disconnect()
					releaseEvent:Disconnect()
					envelopeDragBottom.Line.Position = UDim2.new(0, 3, 0, 0)
					envelopeDragBottom.Line.Size = UDim2.new(0, 1, 0, 20)
				end)

				mouseEvent = user.InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						local bottomDiff = (mouse.Y + (20 - mouseDelta)) - (currentPoint[4].AbsolutePosition.Y + 2) - 19
						local newEnvelope = 10 * (math.max(bottomDiff, 0) / maxSize)
						local maxEnvelope = math.min(currentPoint[1], 10 - currentPoint[1])
						currentPoint[3] = math.min(newEnvelope, maxEnvelope)
						newMt:Redraw()
						buildSequence()
						updateInputs(currentPoint)
					end
				end)
			end)

			local function placePoint(point)
				local newPoint = Instance.new("Frame")
				newPoint.Name = "Point"
				newPoint.BorderSizePixel = 0
				newPoint.Size = UDim2.new(0,5,0,5)
				newPoint.Position = UDim2.new(0,math.floor((numberLine.AbsoluteSize.X-1) * point[2])-2,0,numberLine.AbsoluteSize.Y*(10-point[1])/10-2)
				newPoint.BackgroundColor3 = Color3.new(0,0,0)

				local newSelect = Instance.new("Frame")
				newSelect.Name = "Select"
				newSelect.BackgroundTransparency = 1
				newSelect.BackgroundColor3 = Color3.new(199/255,44/255,28/255)
				newSelect.Position = UDim2.new(0,-2,0,-2)
				newSelect.Size = UDim2.new(0,9,0,9)
				newSelect.Parent = newPoint

				newPoint.Parent = numberLine


				newSelect.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						for i, v in pairs(points) do 
							v[4].Select.BackgroundTransparency = 1 
						end

						newSelect.BackgroundTransparency = 0
						updateInputs(point)
					end

					if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not currentlySelected then
						currentPoint = point
						local mouseEvent, releaseEvent
						currentlySelected = true
						newSelect.BackgroundColor3 = Color3.new(249/255, 191/255, 59/255)

						local oldEnvelope = point[3]

						releaseEvent = user.InputEnded:Connect(function(input)
							if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then	return end

							mouseEvent:Disconnect()
							releaseEvent:Disconnect()
							currentlySelected = nil
							newSelect.BackgroundColor3 = Color3.new(199/255, 44/255, 28/255)
						end)

						mouseEvent = user.InputChanged:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
								local maxX = numberLine.AbsoluteSize.X - 1
								local relativeX = (input.Position.X - numberLine.AbsolutePosition.X)
								if relativeX < 0 then relativeX = 0 end
								if relativeX > maxX then relativeX = maxX end

								local maxY = numberLine.AbsoluteSize.Y - 1
								local relativeY = (input.Position.Y - numberLine.AbsolutePosition.Y)
								if relativeY < 0 then relativeY = 0 end
								if relativeY > maxY then relativeY = maxY end

								if point ~= beginPoint and point ~= endPoint then
									point[2] = relativeX / maxX
								end

								point[1] = 10 - (relativeY / maxY) * 10
								local maxEnvelope = math.min(point[1], 10 - point[1])
								point[3] = math.min(oldEnvelope, maxEnvelope)
								newMt:Redraw()
								updateInputs(point)

								for i, v in pairs(points) do 
									v[4].Select.BackgroundTransparency = 1 
								end

								newSelect.BackgroundTransparency = 0
								buildSequence()
							end
						end)
					end
				end)

				return newPoint
			end

			local function placePoints()
				for i,v in pairs(points) do
					v[4] = placePoint(v)
				end
			end

			local function redraw(self)
				local numberLineSize = numberLine.AbsoluteSize
				table.sort(points,function(a,b) return a[2] < b[2] end)
				for i,v in pairs(points) do
					v[4].Position = UDim2.new(0,math.floor((numberLineSize.X-1) * v[2])-2,0,(numberLineSize.Y-1)*(10-v[1])/10-2)
				end
				lines[1].Size = UDim2.new(0,1,0,0)
				for i = 1,#points-1 do
					local fromPoint = points[i]
					local toPoint = points[i+1]
					local deltaY = toPoint[4].Position.Y.Offset-fromPoint[4].Position.Y.Offset
					local deltaX = toPoint[4].Position.X.Offset-fromPoint[4].Position.X.Offset
					local slope = deltaY/deltaX

					local fromEnvelope = fromPoint[3]
					local nextEnvelope = toPoint[3]

					local currentRise = math.abs(slope)
					local totalRise = 0
					local maxRise = math.abs(toPoint[4].Position.Y.Offset-fromPoint[4].Position.Y.Offset)

					for lineCount = math.min(fromPoint[4].Position.X.Offset+1,toPoint[4].Position.X.Offset),toPoint[4].Position.X.Offset do
						if deltaX == 0 and deltaY == 0 then return end
						local riseNow = math.floor(currentRise)
						local line = lines[lineCount+3]
						if line then
							if totalRise+riseNow > maxRise then riseNow = maxRise-totalRise end
							if math.sign(slope) == -1 then
								line.Position = UDim2.new(0,lineCount+2,0,fromPoint[4].Position.Y.Offset + -(totalRise+riseNow)+2)
							else
								line.Position = UDim2.new(0,lineCount+2,0,fromPoint[4].Position.Y.Offset + totalRise+2)
							end
							line.Size = UDim2.new(0,1,0,math.max(riseNow,1))
						end
						totalRise = totalRise + riseNow
						currentRise = currentRise - riseNow + math.abs(slope)

						local envPercent = (lineCount-fromPoint[4].Position.X.Offset)/(toPoint[4].Position.X.Offset-fromPoint[4].Position.X.Offset)
						local envLerp = fromEnvelope+(nextEnvelope-fromEnvelope)*envPercent
						local relativeSize = (envLerp/10)*numberLineSize.Y						

						local line = eLines[lineCount + 3]
						if line then
							line.Position = UDim2.new(0,lineCount+2,0,lines[lineCount+3].Position.Y.Offset-math.floor(relativeSize))
							line.Size = UDim2.new(0,1,0,math.floor(relativeSize*2))
						end
					end
				end
			end
			newMt.Redraw = redraw



			local function loadSequence(self,seq)
				resetSequence = seq
				for i,v in pairs(points) do if v[4] then v[4]:Destroy() end end
				points = {}
				for i,v in pairs(seq.Keypoints) do
					local maxEnvelope = math.min(v.Value,10-v.Value)
					local newPoint = {v.Value,v.Time,math.min(v.Envelope,maxEnvelope)}
					newPoint[4] = placePoint(newPoint)
					table.insert(points,newPoint)
				end
				beginPoint = points[1]
				endPoint = points[#points]
				currentlySelected = nil
				redraw()
				envelopeDragTop.Visible = false
				envelopeDragBottom.Visible = false
			end
			newMt.SetSequence = loadSequence

			timeBox.FocusLost:Connect(function()
				local point = currentPoint
				local num = tonumber(timeBox.Text)
				if point and num and point ~= beginPoint and point ~= endPoint then
					num = math.clamp(num,0,1)
					point[2] = num
					redraw()
					buildSequence()
					updateInputs(point)
				end
			end)

			valueBox.FocusLost:Connect(function()
				local point = currentPoint
				local num = tonumber(valueBox.Text)
				if point and num then
					local oldEnvelope = point[3]
					num = math.clamp(num,0,10)
					point[1] = num
					local maxEnvelope = math.min(point[1],10-point[1])
					point[3] = math.min(oldEnvelope,maxEnvelope)
					redraw()
					buildSequence()
					updateInputs(point)
				end
			end)

			envelopeBox.FocusLost:Connect(function()
				local point = currentPoint
				local num = tonumber(envelopeBox.Text)
				if point and num then
					num = math.clamp(num,0,5)
					local maxEnvelope = math.min(point[1],10-point[1])
					point[3] = math.min(num,maxEnvelope)
					redraw()
					buildSequence()
					updateInputs(point)
				end
			end)

			local function buttonAnimations(button,inverse)
				button.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then button.BackgroundTransparency = (inverse and 0.5 or 0.4) end end)
				button.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then button.BackgroundTransparency = (inverse and 1 or 0) end end)
			end

			numberLine.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and #points < 20 then

					if Lib.CheckMouseInGui(envelopeDragTop) or Lib.CheckMouseInGui(envelopeDragBottom) then return end

					for i, v in pairs(points) do
						if Lib.CheckMouseInGui(v[4].Select) then
							return
						end
					end

					local maxX = numberLine.AbsoluteSize.X - 1
					local relativeX = (input.Position.X - numberLine.AbsolutePosition.X)
					if relativeX < 0 then relativeX = 0 end
					if relativeX > maxX then relativeX = maxX end

					local maxY = numberLine.AbsoluteSize.Y - 1
					local relativeY = (input.Position.Y - numberLine.AbsolutePosition.Y)
					if relativeY < 0 then relativeY = 0 end
					if relativeY > maxY then relativeY = maxY end

					local raw = relativeX / maxX
					local newPoint = {10 - (relativeY / maxY) * 10, raw, 0}
					newPoint[4] = placePoint(newPoint)
					table.insert(points, newPoint)
					redraw()
					buildSequence()
				end
			end)

			deleteButton.MouseButton1Click:Connect(function()
				if currentPoint and currentPoint ~= beginPoint and currentPoint ~= endPoint then
					for i,v in pairs(points) do
						if v == currentPoint then
							v[4]:Destroy()
							table.remove(points,i)
							break
						end
					end
					currentlySelected = nil
					redraw()
					buildSequence()
					updateInputs(points[1])
				end
			end)

			resetButton.MouseButton1Click:Connect(function()
				if resetSequence then
					newMt:SetSequence(resetSequence)
					buildSequence()
				end
			end)

			closeButton.MouseButton1Click:Connect(function()
				window:Close()
			end)

			buttonAnimations(deleteButton)
			buttonAnimations(resetButton)
			buttonAnimations(closeButton)

			placePoints()
			redraw()

			newMt.Show = function(self)
				window:Show()
			end

			return newMt
		end

		return {new = new}
	end)()

	Lib.ColorSequenceEditor = (function() -- TODO: Convert to newer class model
		local function new()
			local newMt = setmetatable({},{})
			newMt.OnSelect = Lib.Signal.new()
			newMt.OnCancel = Lib.Signal.new()
			newMt.OnPreview = Lib.Signal.new()
			newMt.OnPickColor = Lib.Signal.new()

			local guiContents = create({
				{1,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,ClipsDescendants=true,Name="Content",Position=UDim2.new(0,0,0,20),Size=UDim2.new(1,0,1,-20),}},
				{2,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Name="ColorLine",Parent={1},Position=UDim2.new(0,10,0,5),Size=UDim2.new(1,-20,0,70),}},
				{3,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0,Name="Gradient",Parent={2},Size=UDim2.new(1,0,1,0),}},
				{4,"UIGradient",{Parent={3},}},
				{5,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="Arrows",Parent={1},Position=UDim2.new(0,1,0,73),Size=UDim2.new(1,-2,0,16),}},
				{6,"Frame",{BackgroundColor3=Color3.new(0,0,0),BackgroundTransparency=0.5,BorderSizePixel=0,Name="Cursor",Parent={1},Position=UDim2.new(0,10,0,0),Size=UDim2.new(0,1,0,80),}},
				{7,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Time",Parent={1},Position=UDim2.new(0,40,0,95),Size=UDim2.new(0,100,0,20),}},
				{8,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),ClipsDescendants=true,Font=3,Name="Input",Parent={7},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,98,0,20),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{9,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={7},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Time",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{10,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Name="ColorBox",Parent={1},Position=UDim2.new(0,220,0,95),Size=UDim2.new(0,20,0,20),}},
				{11,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={10},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Color",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{12,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),BorderSizePixel=0,Font=3,Name="Close",Parent={1},Position=UDim2.new(1,-90,0,95),Size=UDim2.new(0,80,0,20),Text="Close",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{13,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),BorderSizePixel=0,Font=3,Name="Reset",Parent={1},Position=UDim2.new(1,-180,0,95),Size=UDim2.new(0,80,0,20),Text="Reset",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{14,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),BorderSizePixel=0,Font=3,Name="Delete",Parent={1},Position=UDim2.new(0,280,0,95),Size=UDim2.new(0,80,0,20),Text="Delete",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{15,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={1},Size=UDim2.new(0,16,0,16),Visible=false,}},
				{16,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={15},Position=UDim2.new(0,8,0,3),Size=UDim2.new(0,1,0,2),}},
				{17,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={15},Position=UDim2.new(0,7,0,5),Size=UDim2.new(0,3,0,2),}},
				{18,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={15},Position=UDim2.new(0,6,0,7),Size=UDim2.new(0,5,0,2),}},
				{19,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={15},Position=UDim2.new(0,5,0,9),Size=UDim2.new(0,7,0,2),}},
				{20,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={15},Position=UDim2.new(0,4,0,11),Size=UDim2.new(0,9,0,2),}},
			})
			local window = Lib.Window.new()
			window.Resizable = false
			window:Resize(650,150)
			window:SetTitle("ColorSequence Editor")
			newMt.Window = window
			newMt.Gui = window.Gui
			for i,v in pairs(guiContents:GetChildren()) do
				v.Parent = window.GuiElems.Content
			end
			local gui = window.Gui
			local pickerGui = gui.Main
			local pickerTopBar = pickerGui.TopBar
			local pickerFrame = pickerGui.Content
			local colorLine = pickerFrame.ColorLine
			local gradient = colorLine.Gradient.UIGradient
			local arrowFrame = pickerFrame.Arrows
			local arrow = pickerFrame.Arrow
			local cursor = pickerFrame.Cursor
			local timeBox = pickerFrame.Time.Input
			local colorBox = pickerFrame.ColorBox
			local deleteButton = pickerFrame.Delete
			local resetButton = pickerFrame.Reset
			local closeButton = pickerFrame.Close
			local topClose = pickerTopBar.Close

			local user = service.UserInputService
			local mouse = service.Players.LocalPlayer:GetMouse()

			local colors = {{Color3.new(1,0,1),0},{Color3.new(0.2,0.9,0.2),0.2},{Color3.new(0.4,0.5,0.9),0.7},{Color3.new(0.6,1,1),1}}
			local resetSequence = nil

			local beginPoint = colors[1]
			local endPoint = colors[#colors]

			local currentlySelected = nil
			local currentPoint = nil

			local sequenceLine = Instance.new("Frame")
			sequenceLine.BorderSizePixel = 0
			sequenceLine.Size = UDim2.new(0,1,1,0)

			newMt.Sequence = ColorSequence.new(Color3.new(1,1,1))
			local function buildSequence(noupdate)
				local newPoints = {}
				table.sort(colors,function(a,b) return a[2] < b[2] end)
				for i,v in pairs(colors) do
					table.insert(newPoints,ColorSequenceKeypoint.new(v[2],v[1]))
				end
				newMt.Sequence = ColorSequence.new(newPoints)
				if not noupdate then newMt.OnSelect:Fire(newMt.Sequence) end
			end

			local function round(num,places)
				local multi = 10^places
				return math.floor(num*multi + 0.5)/multi
			end

			local function updateInputs(point)
				if point then
					currentPoint = point
					local raw = point[2]
					timeBox.Text = round(raw,(raw < 0.01 and 5) or (raw < 0.1 and 4) or 3)
					colorBox.BackgroundColor3 = point[1]
				end
			end

			local function placeArrow(ind,point)
				local newArrow = arrow:Clone()
				newArrow.Position = UDim2.new(0,ind-1,0,0)
				newArrow.Visible = true
				newArrow.Parent = arrowFrame

				newArrow.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						cursor.Visible = true
						cursor.Position = UDim2.new(0, 9 + newArrow.Position.X.Offset, 0, 0)
					end

					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						updateInputs(point)
						if point == beginPoint or point == endPoint or currentlySelected then return end

						local mouseEvent, releaseEvent
						currentlySelected = true

						releaseEvent = user.InputEnded:Connect(function(input)
							if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
							mouseEvent:Disconnect()
							releaseEvent:Disconnect()
							currentlySelected = nil
							cursor.Visible = false
						end)

						mouseEvent = user.InputChanged:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
								local maxSize = colorLine.AbsoluteSize.X - 1
								local relativeX = (input.Position.X - colorLine.AbsolutePosition.X)
								if relativeX < 0 then relativeX = 0 end
								if relativeX > maxSize then relativeX = maxSize end
								local raw = relativeX / maxSize
								point[2] = relativeX / maxSize
								updateInputs(point)
								cursor.Visible = true
								cursor.Position = UDim2.new(0, 9 + newArrow.Position.X.Offset, 0, 0)
								buildSequence()
								newMt:Redraw()
							end
						end)
					end
				end)

				newArrow.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						cursor.Visible = false
					end
				end)



				return newArrow
			end

			local function placeArrows()
				for i,v in pairs(colors) do
					v[3] = placeArrow(math.floor((colorLine.AbsoluteSize.X-1) * v[2]) + 1,v)
				end
			end

			local function redraw(self)
				gradient.Color = newMt.Sequence or ColorSequence.new(Color3.new(1,1,1))

				for i = 2,#colors do
					local nextColor = colors[i]
					local endPos = math.floor((colorLine.AbsoluteSize.X-1) * nextColor[2]) + 1
					nextColor[3].Position = UDim2.new(0,endPos,0,0)
				end		
			end
			newMt.Redraw = redraw

			local function loadSequence(self,seq)
				resetSequence = seq
				for i,v in pairs(colors) do if v[3] then v[3]:Destroy() end end
				colors = {}
				currentlySelected = nil
				for i,v in pairs(seq.Keypoints) do
					local newPoint = {v.Value,v.Time}
					newPoint[3] = placeArrow(v.Time,newPoint)
					table.insert(colors,newPoint)
				end
				beginPoint = colors[1]
				endPoint = colors[#colors]
				currentlySelected = nil
				updateInputs(colors[1])
				buildSequence(true)
				redraw()
			end
			newMt.SetSequence = loadSequence

			local function buttonAnimations(button,inverse)
				button.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then button.BackgroundTransparency = (inverse and 0.5 or 0.4) end end)
				button.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then button.BackgroundTransparency = (inverse and 1 or 0) end end)
			end

			colorLine.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and #colors < 20 then
					local maxSize = colorLine.AbsoluteSize.X - 1
					local relativeX = (input.Position.X - colorLine.AbsolutePosition.X)
					if relativeX < 0 then relativeX = 0 end
					if relativeX > maxSize then relativeX = maxSize end

					local raw = relativeX / maxSize
					local fromColor = nil
					local toColor = nil
					for i, col in pairs(colors) do
						if col[2] >= raw then
							fromColor = colors[math.max(i - 1, 1)]
							toColor = colors[i]
							break
						end
					end
					local lerpColor = fromColor[1]:lerp(toColor[1], (raw - fromColor[2]) / (toColor[2] - fromColor[2]))
					local newPoint = {lerpColor, raw}
					newPoint[3] = placeArrow(newPoint[2], newPoint)
					table.insert(colors, newPoint)
					updateInputs(newPoint)
					buildSequence()
					redraw()
				end
			end)

			colorLine.InputChanged:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					local maxSize = colorLine.AbsoluteSize.X - 1
					local relativeX = (input.Position.X - colorLine.AbsolutePosition.X)
					if relativeX < 0 then relativeX = 0 end
					if relativeX > maxSize then relativeX = maxSize end
					cursor.Visible = true
					cursor.Position = UDim2.new(0, 10 + relativeX, 0, 0)
				end
			end)

			colorLine.InputEnded:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					local inArrow = false
					for i, v in pairs(colors) do
						if Lib.CheckMouseInGui(v[3]) then
							inArrow = v[3]
						end
					end
					cursor.Visible = inArrow and true or false
					if inArrow then cursor.Position = UDim2.new(0, 9 + inArrow.Position.X.Offset, 0, 0) end
				end
			end)

			timeBox:GetPropertyChangedSignal("Text"):Connect(function()
				local point = currentPoint
				local num = tonumber(timeBox.Text)
				if point and num and point ~= beginPoint and point ~= endPoint then
					num = math.clamp(num,0,1)
					point[2] = num
					buildSequence()
					redraw()
				end
			end)

			colorBox.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
					local editor = newMt.ColorPicker
					if not editor then
						editor = Lib.ColorPicker.new()
						editor.Window:SetTitle("ColorSequence Color Picker")

						editor.OnSelect:Connect(function(col)
							if currentPoint then
								currentPoint[1] = col
							end
							buildSequence()
							redraw()
						end)

						newMt.ColorPicker = editor
					end

					editor.Window:ShowAndFocus()
				end
			end)

			deleteButton.MouseButton1Click:Connect(function()
				if currentPoint and currentPoint ~= beginPoint and currentPoint ~= endPoint then
					for i,v in pairs(colors) do
						if v == currentPoint then
							v[3]:Destroy()
							table.remove(colors,i)
							break
						end
					end
					currentlySelected = nil
					updateInputs(colors[1])
					buildSequence()
					redraw()
				end
			end)

			resetButton.MouseButton1Click:Connect(function()
				if resetSequence then
					newMt:SetSequence(resetSequence)
				end
			end)

			closeButton.MouseButton1Click:Connect(function()
				window:Close()
			end)

			topClose.MouseButton1Click:Connect(function()
				window:Close()
			end)

			buttonAnimations(deleteButton)
			buttonAnimations(resetButton)
			buttonAnimations(closeButton)

			placeArrows()
			redraw()

			newMt.Show = function(self)
				window:Show()
			end

			return newMt
		end

		return {new = new}
	end)()

	Lib.ViewportTextBox = (function()
		local textService = service.TextService

		local props = {
			OffsetX = 0,
			TextBox = PH,
			CursorPos = -1,
			Gui = PH,
			View = PH
		}
		local funcs = {}
		funcs.Update = function(self)
			local cursorPos = self.CursorPos or -1
			local text = self.TextBox.Text
			if text == "" then self.TextBox.Position = UDim2.new(0,0,0,0) return end
			if cursorPos == -1 then return end

			local cursorText = text:sub(1,cursorPos-1)
			local pos = nil
			local leftEnd = -self.TextBox.Position.X.Offset
			local rightEnd = leftEnd + self.View.AbsoluteSize.X

			local totalTextSize = textService:GetTextSize(text,self.TextBox.TextSize,self.TextBox.Font,Vector2.new(999999999,100)).X
			local cursorTextSize = textService:GetTextSize(cursorText,self.TextBox.TextSize,self.TextBox.Font,Vector2.new(999999999,100)).X

			if cursorTextSize > rightEnd then
				pos = math.max(-1,cursorTextSize - self.View.AbsoluteSize.X + 2)
			elseif cursorTextSize < leftEnd then
				pos = math.max(-1,cursorTextSize-2)
			elseif totalTextSize < rightEnd then
				pos = math.max(-1,totalTextSize - self.View.AbsoluteSize.X + 2)
			end

			if pos then
				self.TextBox.Position = UDim2.new(0,-pos,0,0)
				self.TextBox.Size = UDim2.new(1,pos,1,0)
			end
		end

		funcs.GetText = function(self)
			return self.TextBox.Text
		end

		funcs.SetText = function(self,text)
			self.TextBox.Text = text
		end

		local mt = getGuiMT(props,funcs)

		local function convert(textbox)
			local obj = initObj(props,mt)

			local view = Instance.new("Frame")
			view.BackgroundTransparency = textbox.BackgroundTransparency
			view.BackgroundColor3 = textbox.BackgroundColor3
			view.BorderSizePixel = textbox.BorderSizePixel
			view.BorderColor3 = textbox.BorderColor3
			view.Position = textbox.Position
			view.Size = textbox.Size
			view.ClipsDescendants = true
			view.Name = textbox.Name
			textbox.BackgroundTransparency = 1
			textbox.Position = UDim2.new(0,0,0,0)
			textbox.Size = UDim2.new(1,0,1,0)
			textbox.TextXAlignment = Enum.TextXAlignment.Left
			textbox.Name = "Input"

			obj.TextBox = textbox
			obj.View = view
			obj.Gui = view

			textbox.Changed:Connect(function(prop)
				if prop == "Text" or prop == "CursorPosition" or prop == "AbsoluteSize" then
					local cursorPos = obj.TextBox.CursorPosition
					if cursorPos ~= -1 then obj.CursorPos = cursorPos end
					obj:Update()
				end
			end)

			obj:Update()

			view.Parent = textbox.Parent
			textbox.Parent = view

			return obj
		end

		local function new()
			local textBox = Instance.new("TextBox")
			textBox.Size = UDim2.new(0,100,0,20)
			textBox.BackgroundColor3 = Settings.Theme.TextBox
			textBox.BorderColor3 = Settings.Theme.Outline3
			textBox.ClearTextOnFocus = false
			textBox.TextColor3 = Settings.Theme.Text
			textBox.Font = Enum.Font.SourceSans
			textBox.TextSize = 14
			textBox.Text = ""
			return convert(textBox)
		end

		return {new = new, convert = convert}
	end)()

	Lib.Label = (function()
		local props,funcs = {},{}

		local mt = getGuiMT(props,funcs)

		local function new()
			local label = Instance.new("TextLabel")
			label.BackgroundTransparency = 1
			label.TextXAlignment = Enum.TextXAlignment.Left
			label.TextColor3 = Settings.Theme.Text
			label.TextTransparency = 0.1
			label.Size = UDim2.new(0,100,0,20)
			label.Font = Enum.Font.SourceSans
			label.TextSize = 14

			local obj = setmetatable({
				Gui = label
			},mt)
			return obj
		end

		return {new = new}
	end)()

	Lib.Frame = (function()
		local props,funcs = {},{}

		local mt = getGuiMT(props,funcs)

		local function new()
			local fr = Instance.new("Frame")
			fr.BackgroundColor3 = Settings.Theme.Main1
			fr.BorderColor3 = Settings.Theme.Outline1
			fr.Size = UDim2.new(0,50,0,50)

			local obj = setmetatable({
				Gui = fr
			},mt)
			return obj
		end

		return {new = new}
	end)()

	Lib.Button = (function()
		local props = {
			Gui = PH,
			Anim = PH,
			Disabled = false,
			OnClick = SIGNAL,
			OnDown = SIGNAL,
			OnUp = SIGNAL,
			AllowedButtons = {1}
		}
		local funcs = {}
		local tableFind = table.find

		funcs.Trigger = function(self,event,button)
			if not self.Disabled and tableFind(self.AllowedButtons,button) then
				self["On"..event]:Fire(button)
			end
		end

		funcs.SetDisabled = function(self,dis)
			self.Disabled = dis

			if dis then
				self.Anim:Disable()
				self.Gui.TextTransparency = 0.5
			else
				self.Anim.Enable()
				self.Gui.TextTransparency = 0
			end
		end

		local mt = getGuiMT(props,funcs)

		local function new()
			local b = Instance.new("TextButton")
			b.AutoButtonColor = false
			b.TextColor3 = Settings.Theme.Text
			b.TextTransparency = 0.1
			b.Size = UDim2.new(0,100,0,20)
			b.Font = Enum.Font.SourceSans
			b.TextSize = 14
			b.BackgroundColor3 = Settings.Theme.Button
			b.BorderColor3 = Settings.Theme.Outline2

			local obj = initObj(props,mt)
			obj.Gui = b
			obj.Anim = Lib.ButtonAnim(b,{Mode = 2, StartColor = Settings.Theme.Button, HoverColor = Settings.Theme.ButtonHover, PressColor = Settings.Theme.ButtonPress, OutlineColor = Settings.Theme.Outline2})

			b.MouseButton1Click:Connect(function() obj:Trigger("Click",1) end)
			b.MouseButton1Down:Connect(function() obj:Trigger("Down",1) end)
			b.MouseButton1Up:Connect(function() obj:Trigger("Up",1) end)

			b.MouseButton2Click:Connect(function() obj:Trigger("Click",2) end)
			b.MouseButton2Down:Connect(function() obj:Trigger("Down",2) end)
			b.MouseButton2Up:Connect(function() obj:Trigger("Up",2) end)

			return obj
		end

		return {new = new}
	end)()

	Lib.DropDown = (function()
		local props = {
			Gui = PH,
			Anim = PH,
			Context = PH,
			Selected = PH,
			Disabled = false,
			CanBeEmpty = true,
			Options = {},
			GuiElems = {},
			OnSelect = SIGNAL
		}
		local funcs = {}

		funcs.Update = function(self)
			local options = self.Options

			if #options > 0 then
				if not self.Selected then
					if not self.CanBeEmpty then
						self.Selected = options[1]
						self.GuiElems.Label.Text = options[1]
					else
						self.GuiElems.Label.Text = "- Select -"
					end
				else
					self.GuiElems.Label.Text = self.Selected
				end
			else
				self.GuiElems.Label.Text = "- Select -"
			end
		end

		funcs.ShowOptions = function(self)
			local context = self.Context

			context.Width = self.Gui.AbsoluteSize.X
			context.ReverseYOffset = self.Gui.AbsoluteSize.Y
			context:Show(self.Gui.AbsolutePosition.X, self.Gui.AbsolutePosition.Y + context.ReverseYOffset)
		end

		funcs.SetOptions = function(self,opts)
			self.Options = opts

			local context = self.Context
			local options = self.Options
			context:Clear()

			local onClick = function(option) self.Selected = option self.OnSelect:Fire(option) self:Update() end

			if self.CanBeEmpty then
				context:Add({Name = "- Select -", function() self.Selected = nil self.OnSelect:Fire(nil) self:Update() end})
			end

			for i = 1,#options do
				context:Add({Name = options[i], OnClick = onClick})
			end

			self:Update()
		end

		funcs.SetSelected = function(self,opt)
			self.Selected = type(opt) == "number" and self.Options[opt] or opt
			self:Update()
		end

		local mt = getGuiMT(props,funcs)

		local function new()
			local f = Instance.new("TextButton")
			f.AutoButtonColor = false
			f.Text = ""
			f.Size = UDim2.new(0,100,0,20)
			f.BackgroundColor3 = Settings.Theme.TextBox
			f.BorderColor3 = Settings.Theme.Outline3

			local label = Lib.Label.new()
			label.Position = UDim2.new(0,2,0,0)
			label.Size = UDim2.new(1,-22,1,0)
			label.TextTruncate = Enum.TextTruncate.AtEnd
			label.Parent = f
			local arrow = create({
				{1,"Frame",{BackgroundTransparency=1,Name="EnumArrow",Position=UDim2.new(1,-16,0,2),Size=UDim2.new(0,16,0,16),}},
				{2,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={1},Position=UDim2.new(0,8,0,9),Size=UDim2.new(0,1,0,1),}},
				{3,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={1},Position=UDim2.new(0,7,0,8),Size=UDim2.new(0,3,0,1),}},
				{4,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={1},Position=UDim2.new(0,6,0,7),Size=UDim2.new(0,5,0,1),}},
			})
			arrow.Parent = f

			local obj = initObj(props,mt)
			obj.Gui = f
			obj.Anim = Lib.ButtonAnim(f,{Mode = 2, StartColor = Settings.Theme.TextBox, LerpTo = Settings.Theme.Button, LerpDelta = 0.15})
			obj.Context = Lib.ContextMenu.new()
			obj.Context.Iconless = true
			obj.Context.MaxHeight = 200
			obj.Selected = nil
			obj.GuiElems = {Label = label}
			f.MouseButton1Down:Connect(function() obj:ShowOptions() end)
			obj:Update()
			return obj
		end

		return {new = new}
	end)()

	Lib.ClickSystem = (function()
		local props = {
			LastItem = PH,
			OnDown = SIGNAL,
			OnRelease = SIGNAL,
			AllowedButtons = {1},
			Combo = 0,
			MaxCombo = 2,
			ComboTime = 0.5,
			Items = {},
			ItemCons = {},
			ClickId = -1,
			LastButton = ""
		}
		local funcs = {}
		local tostring = tostring

		local disconnect = function(con)
			local pos = table.find(con.Signal.Connections,con)
			if pos then table.remove(con.Signal.Connections,pos) end
		end

		funcs.Trigger = function(self, item, button, X, Y)
			if table.find(self.AllowedButtons, button) then
				if self.LastButton ~= button or self.LastItem ~= item or self.Combo == self.MaxCombo or tick() - self.ClickId > self.ComboTime then
					self.Combo = 0
					self.LastButton = button
					self.LastItem = item
				end

				self.Combo = self.Combo + 1
				self.ClickId = tick()

				task.spawn(function()
					if self.InputDown then
						self.InputDown = false
					else
						self.InputDown = tick()

						local Connection = item.MouseButton1Up:Once(function()
							self.InputDown = false
						end)

						while self.InputDown and not Explorer.Dragging do
							if (tick() - self.InputDown) >= 0.4 then
								self.InputDown = false
								self["OnRelease"]:Fire(item, self.Combo, 2, Vector2.new(X, Y))
								break
							end;task.wait()
						end
					end
				end)

				local release
				release = service.UserInputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType["MouseButton" .. button] then
						release:Disconnect()
						if Lib.CheckMouseInGui(item) and self.LastButton == button and self.LastItem == item then
							self["OnRelease"]:Fire(item,self.Combo,button)
						end
					end
				end)

				self["OnDown"]:Fire(item,self.Combo,button)
			end
		end

		funcs.Add = function(self,item)
			if table.find(self.Items,item) then return end

			local cons = {}
			cons[1] = item.MouseButton1Down:Connect(function(X, Y) self:Trigger(item, 1, X, Y) end)
			cons[2] = item.MouseButton2Down:Connect(function(X, Y) self:Trigger(item, 2, X, Y) end)

			self.ItemCons[item] = cons
			self.Items[#self.Items+1] = item
		end

		funcs.Remove = function(self,item)
			local ind = table.find(self.Items,item)
			if not ind then return end

			for i,v in pairs(self.ItemCons[item]) do
				v:Disconnect()
			end
			self.ItemCons[item] = nil
			table.remove(self.Items,ind)
		end

		local mt = {__index = funcs}

		local function new()
			local obj = initObj(props,mt)

			return obj
		end

		return {new = new}
	end)()

	return Lib
end

return {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
end,
["ModelViewer"] = function()
--[[
	Model Viewer App Module
	
	A model viewer :3
]]

-- Common Locals
local Main,Lib,Apps,Settings -- Main Containers
local Explorer, Properties, ScriptViewer, ModelViewer, Notebook -- Major Apps
local API,RMD,env,service,plr,create,createSimple -- Main Locals

local function initDeps(data)
	Main = data.Main
	Lib = data.Lib
	Apps = data.Apps
	Settings = data.Settings

	API = data.API
	RMD = data.RMD
	env = data.env
	service = data.service
	plr = data.plr
	create = data.create
	createSimple = data.createSimple
end

local function initAfterMain()
	Explorer = Apps.Explorer
	Properties = Apps.Properties
	ScriptViewer = Apps.ScriptViewer
	Notebook = Apps.Notebook
end

local function getPath(obj)
	if obj.Parent == nil then
		return "Nil parented"
	else
		return Explorer.GetInstancePath(obj)
	end
end

local function main()
	local RunService = game:GetService("RunService")
	
	local ModelViewer = {
		EnableInputCamera = true,
		IsViewing = false,
		AutoRefresh = false,
		ZoomMultiplier = 2,
		AutoRotate = true,
		RotationSpeed = 0.01,
		RefreshRate = 30 -- hertz
	}
	
	local window, viewportFrame, pathLabel, settingsButton
	local model, camera, originalModel
	
	
	ModelViewer.StopViewModel = function(updating)
		if updating then
			viewportFrame:FindFirstChildOfClass("Model"):Destroy()
		else
			if camera then camera = nil end
			if model then model = nil end
			viewportFrame:ClearAllChildren()
			
			ModelViewer.IsViewing = false
			window:SetTitle("Model Viewer")
			pathLabel.Gui.Text = ""
		end
	end

	ModelViewer.ViewModel = function(item, updating)
		if not item then return end
		ModelViewer.StopViewModel(updating)
		
		if item:IsA("BasePart") and not item:IsA("Model") then			
			model = Instance.new("Model")
			model.Parent = viewportFrame
			
			local clone = item:Clone()
			clone.Parent = model
			model.PrimaryPart = clone
			model:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))
		elseif item:IsA("Model") and item ~= workspace and not item:IsA("Terrain")  then
			local noClone = false
			if not item.Archivable then item.Archivable = true noClone = true end
		
			if not item.PrimaryPart then
				pathLabel.Gui.Text = "Failed to view model: No PrimaryPart is found."
				return
			end
			
			model = item:Clone()
			
			item.Archivable = false
			
			model.Parent = viewportFrame
			model:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))
		else
			return
		end
		
		originalModel = item
		
		if ModelViewer.AutoRefresh and not updating then
			task.spawn(function()
				while model and ModelViewer.AutoRefresh do
					
					ModelViewer.ViewModel(originalModel, true)
					task.wait(1 / ModelViewer.RefreshRate)
				end
			end)
		end
		
		if not updating then
			camera = Instance.new("Camera")
			viewportFrame.CurrentCamera = camera

			camera.Parent = viewportFrame
			camera.FieldOfView = 60
			
			window:SetTitle(item.Name.." - Model Viewer")
			pathLabel.Gui.Text = "path: " .. getPath(originalModel)
			window:Show()
			ModelViewer.IsViewing = true
		end
	end

	ModelViewer.Init = function()
		window = Lib.Window.new()
		window:SetTitle("Model Viewer")
		window:Resize(350,200)
		ModelViewer.Window =  window
		
		viewportFrame = Instance.new("ViewportFrame")
		viewportFrame.Parent = window.GuiElems.Content
		viewportFrame.BackgroundTransparency = 1
		viewportFrame.Size = UDim2.new(1,0,1,0)
		
		pathLabel = Lib.Label.new()
		pathLabel.Gui.Parent = window.GuiElems.Content
		pathLabel.Gui.AnchorPoint = Vector2.new(0,1)
		pathLabel.Gui.Text = ""
		pathLabel.Gui.TextSize = 12
		pathLabel.Gui.TextTransparency = 0.8
		pathLabel.Gui.Position = UDim2.new(0,1,1,0)
		pathLabel.Gui.Size = UDim2.new(1,-1,0,15)
		pathLabel.Gui.BackgroundTransparency = 1
		
		settingsButton = Instance.new("ImageButton",window.GuiElems.Content)
		settingsButton.AnchorPoint = Vector2.new(1,0)
		settingsButton.BackgroundTransparency = 1
		settingsButton.Size = UDim2.new(0,15,0,15)
		settingsButton.Position = UDim2.new(1,-3,0,3)
		settingsButton.Image = "rbxassetid://6578871732"
		settingsButton.ImageTransparency = 0.5

		local rotationX, rotationY = -15, 0
		local distance = 10
		local dragging = false
		local hovering = false
		local lastpos = Vector2.zero

		local UIS = game:GetService("UserInputService")

		viewportFrame.InputBegan:Connect(function(input)
			if not ModelViewer.EnableInputCamera then return end
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				lastpos = input.Position
			elseif input.KeyCode == Enum.KeyCode.LeftShift then
				ModelViewer.ZoomMultiplier = 10
			end
		end)
		

		viewportFrame.MouseEnter:Connect(function()
			hovering = true
		end)
		viewportFrame.MouseLeave:Connect(function()
			hovering = false
		end)

		viewportFrame.InputEnded:Connect(function(input)
			if not ModelViewer.EnableInputCamera then return end
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = false
			elseif input.KeyCode == Enum.KeyCode.LeftShift then
				ModelViewer.ZoomMultiplier = 2
			end
		end)

		viewportFrame.InputChanged:Connect(function(input)
			if not ModelViewer.EnableInputCamera then return end
			if dragging and input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				local delta = input.Position - lastpos
				lastpos = input.Position

				rotationY -= delta.X * 0.01
				rotationX -= delta.Y * 0.01
				rotationX = math.clamp(rotationX, -math.pi/2 + 0.1, math.pi/2 - 0.1)
			end

			if input.UserInputType == Enum.UserInputType.MouseWheel and hovering then
				distance = math.clamp(distance - (input.Position.Z * ModelViewer.ZoomMultiplier), 0.1, math.huge)
			end
		end)

		game:GetService("RunService").RenderStepped:Connect(function()
			if camera and model then
				if not dragging and ModelViewer.AutoRotate then
					rotationY += ModelViewer.RotationSpeed
				end
				
				local center = model.PrimaryPart.Position
				local offset = CFrame.new(0, 0, distance)
				local rotation = CFrame.Angles(0, rotationY, 0) * CFrame.Angles(rotationX, 0, 0)

				local camCF = CFrame.new(center) * rotation * offset

				camera.CFrame = CFrame.lookAt(camCF.Position, center)
				
			end
		end)
		
		-- context stuffs
		local context = Lib.ContextMenu.new()
		
		local absoluteSize = context.Gui.AbsoluteSize
		context.MaxHeight = (absoluteSize.Y <= 600 and (absoluteSize.Y - 40)) or nil

		-- Registers
		context:Register("STOP",{Name = "Stop Viewing", OnClick = function()
			ModelViewer.StopViewModel()
		end})
		context:Register("EXIT",{Name = "Exit", OnClick = function()
			ModelViewer.StopViewModel()
			context:Hide()
			window:Hide()
		end})
		context:Register("COPY_PATH",{Name = "Copy Path", OnClick = function()
			if model then
				env.setclipboard(getPath(originalModel))
			end
		end})
		context:Register("REFRESH",{Name = "Refresh", OnClick = function()
			if originalModel then
				ModelViewer.ViewModel(originalModel)
			end
		end})
		context:Register("ENABLE_AUTO_REFRESH",{Name = "Enable Auto Refresh", OnClick = function()
			if originalModel then
				ModelViewer.AutoRefresh = true
				ModelViewer.ViewModel(originalModel)
			end
		end})
		context:Register("DISABLE_AUTO_REFRESH",{Name = "Disable Auto Refresh", OnClick = function()
			if originalModel then
				ModelViewer.AutoRefresh = false
				ModelViewer.ViewModel(originalModel)
			end
		end})
		context:Register("SAVE_INST",{Name = "Save to File", OnClick = function()
			if model then
				window:SetTitle(originalModel.Name.." - Model Viewer - Saving")
				local success, result = pcall(env.saveinstance,
					originalModel, "Place_"..game.PlaceId.."_"..originalModel.Name.."_"..os.time(),
					{
						Decompile = true
					}
				)
				if success then
					window:SetTitle(originalModel.Name.." - Model Viewer - Saved")
					context:Hide()
					task.wait(5)
					if model then
						window:SetTitle(originalModel.Name.." - Model Viewer")
					end
				else
					window:SetTitle(originalModel.Name.." - Model Viewer - Error")
					warn("Error while saving model: "..result)
					context:Hide()
					task.wait(5)
					if model then
						window:SetTitle(originalModel.Name.." - Model Viewer")
					end
				end
			end
		end})
		
		context:Register("ENABLE_AUTO_ROTATE",{Name = "Enable Auto Rotate", OnClick = function()
			ModelViewer.AutoRotate = true
			
		end})
		context:Register("DISABLE_AUTO_ROTATE",{Name = "Disable Auto Rotate", OnClick = function()
			ModelViewer.AutoRotate = false
		end})
		context:Register("LOCK_CAM",{Name = "Lock Camera", OnClick = function()
			ModelViewer.EnableInputCamera = false
		end})
		context:Register("UNLOCK_CAM",{Name = "Unlock Camera", OnClick = function()
			ModelViewer.EnableInputCamera = true
		end})
		
		context:Register("ZOOM_IN",{Name = "Zoom In", OnClick = function()
			distance = math.clamp(distance - (ModelViewer.ZoomMultiplier * 2), 2, math.huge)
		end})
		
		context:Register("ZOOM_OUT",{Name = "Zoom Out", OnClick = function()
			distance = math.clamp(distance + (ModelViewer.ZoomMultiplier * 2), 2, math.huge)
		end})
		
		local function ShowContext()
			context:Clear()

			context:AddRegistered("STOP", not ModelViewer.IsViewing)	
			context:AddRegistered("REFRESH", not ModelViewer.IsViewing)
			context:AddRegistered("COPY_PATH", not ModelViewer.IsViewing)
			context:AddRegistered("SAVE_INST", not ModelViewer.IsViewing)
			context:AddDivider()
			
			if env.isonmobile then
				context:AddRegistered("ZOOM_IN")
				context:AddRegistered("ZOOM_OUT")
				context:AddDivider()
			end

			if ModelViewer.AutoRotate then
				context:AddRegistered("DISABLE_AUTO_ROTATE")
			else
				context:AddRegistered("ENABLE_AUTO_ROTATE")
			end
			if ModelViewer.AutoRefresh then
				context:AddRegistered("DISABLE_AUTO_REFRESH")
			else
				context:AddRegistered("ENABLE_AUTO_REFRESH")
			end
			if ModelViewer.EnableInputCamera then
				context:AddRegistered("LOCK_CAM")
			else
				context:AddRegistered("UNLOCK_CAM")
			end

			context:AddDivider()

			context:AddRegistered("EXIT")

			context:Show()
		end
		
		local function HideContext()
			context:Hide()
		end
		
		viewportFrame.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton2 then
				ShowContext()
			elseif input.UserInputType == Enum.UserInputType.MouseButton1 and Lib.CheckMouseInGui(context.Gui) then
				HideContext()
			end
		end)
		settingsButton.MouseButton1Click:Connect(function()
			ShowContext()
		end)
	end

	return ModelViewer
end

-- TODO: Remove when open source
if gethsfuncs then
	_G.moduleData = {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
else
	return {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
end
end,
["Properties"] = function()
--[[
	Properties App Module
	
	The main properties interface
]]

-- Common Locals
local Main,Lib,Apps,Settings -- Main Containers
local Explorer, Properties, ScriptViewer, Notebook -- Major Apps
local API,RMD,env,service,plr,create,createSimple -- Main Locals

local function initDeps(data)
	Main = data.Main
	Lib = data.Lib
	Apps = data.Apps
	Settings = data.Settings

	API = data.API
	RMD = data.RMD
	env = data.env
	service = data.service
	plr = data.plr
	create = data.create
	createSimple = data.createSimple
end

local function initAfterMain()
	Explorer = Apps.Explorer
	Properties = Apps.Properties
	ScriptViewer = Apps.ScriptViewer
	Notebook = Apps.Notebook
end

local function main()
	local Properties = {}

	local window, toolBar, propsFrame
	local scrollV, scrollH
	local categoryOrder
	local props,viewList,expanded,indexableProps,propEntries,autoUpdateObjs = {},{},{},{},{},{}
	local inputBox,inputTextBox,inputProp
	local checkboxes,propCons = {},{}
	local table,string = table,string
	local getPropChangedSignal = game.GetPropertyChangedSignal
	local getAttributeChangedSignal = game.GetAttributeChangedSignal
	local isa = game.IsA
	local getAttribute = game.GetAttribute
	local setAttribute = game.SetAttribute

	Properties.GuiElems = {}
	Properties.Index = 0
	Properties.ViewWidth = 0
	Properties.MinInputWidth = 100
	Properties.EntryIndent = 16
	Properties.EntryOffset = 4
	Properties.NameWidthCache = {}
	Properties.SubPropCache = {}
	Properties.ClassLists = {}
	Properties.SearchText = ""

	Properties.AddAttributeProp = {Category = "Attributes", Class = "", Name = "", SpecialRow = "AddAttribute", Tags = {}}
	Properties.SoundPreviewProp = {Category = "Data", ValueType = {Name = "SoundPlayer"}, Class = "Sound", Name = "Preview", Tags = {}}

	Properties.IgnoreProps = {
		["DataModel"] = {
			["PrivateServerId"] = true,
			["PrivateServerOwnerId"] = true,
			["VIPServerId"] = true,
			["VIPServerOwnerId"] = true
		}
	}

	Properties.ExpandableTypes = {
		["Vector2"] = true,
		["Vector3"] = true,
		["UDim"] = true,
		["UDim2"] = true,
		["CFrame"] = true,
		["Rect"] = true,
		["PhysicalProperties"] = true,
		["Ray"] = true,
		["NumberRange"] = true,
		["Faces"] = true,
		["Axes"] = true,
	}

	Properties.ExpandableProps = {
		["Sound.SoundId"] = true
	}

	Properties.CollapsedCategories = {
		["Surface Inputs"] = true,
		["Surface"] = true
	}

	Properties.ConflictSubProps = {
		["Vector2"] = {"X","Y"},
		["Vector3"] = {"X","Y","Z"},
		["UDim"] = {"Scale","Offset"},
		["UDim2"] = {"X","X.Scale","X.Offset","Y","Y.Scale","Y.Offset"},
		["CFrame"] = {"Position","Position.X","Position.Y","Position.Z",
			"RightVector","RightVector.X","RightVector.Y","RightVector.Z",
			"UpVector","UpVector.X","UpVector.Y","UpVector.Z",
			"LookVector","LookVector.X","LookVector.Y","LookVector.Z"},
		["Rect"] = {"Min.X","Min.Y","Max.X","Max.Y"},
		["PhysicalProperties"] = {"Density","Elasticity","ElasticityWeight","Friction","FrictionWeight"},
		["Ray"] = {"Origin","Origin.X","Origin.Y","Origin.Z","Direction","Direction.X","Direction.Y","Direction.Z"},
		["NumberRange"] = {"Min","Max"},
		["Faces"] = {"Back","Bottom","Front","Left","Right","Top"},
		["Axes"] = {"X","Y","Z"}
	}

	Properties.ConflictIgnore = {
		["BasePart"] = {
			["ResizableFaces"] = true
		}
	}

	Properties.RoundableTypes = {
		["float"] = true,
		["double"] = true,
		["Color3"] = true,
		["UDim"] = true,
		["UDim2"] = true,
		["Vector2"] = true,
		["Vector3"] = true,
		["NumberRange"] = true,
		["Rect"] = true,
		["NumberSequence"] = true,
		["ColorSequence"] = true,
		["Ray"] = true,
		["CFrame"] = true
	}

	Properties.TypeNameConvert = {
		["number"] = "double",
		["boolean"] = "bool"
	}

	Properties.ToNumberTypes = {
		["int"] = true,
		["int64"] = true,
		["float"] = true,
		["double"] = true
	}

	Properties.DefaultPropValue = {
		string = "",
		bool = false,
		double = 0,
		UDim = UDim.new(0,0),
		UDim2 = UDim2.new(0,0,0,0),
		BrickColor = BrickColor.new("Medium stone grey"),
		Color3 = Color3.new(1,1,1),
		Vector2 = Vector2.new(0,0),
		Vector3 = Vector3.new(0,0,0),
		NumberSequence = NumberSequence.new(1),
		ColorSequence = ColorSequence.new(Color3.new(1,1,1)),
		NumberRange = NumberRange.new(0),
		Rect = Rect.new(0,0,0,0)
	}

	Properties.AllowedAttributeTypes = {"string","boolean","number","UDim","UDim2","BrickColor","Color3","Vector2","Vector3","NumberSequence","ColorSequence","NumberRange","Rect"}

	Properties.StringToValue = function(prop,str)
		local typeData = prop.ValueType
		local typeName = typeData.Name

		if typeName == "string" or typeName == "Content" then
			return str
		elseif Properties.ToNumberTypes[typeName] then
			return tonumber(str)
		elseif typeName == "Vector2" then
			local vals = str:split(",")
			local x,y = tonumber(vals[1]),tonumber(vals[2])
			if x and y and #vals >= 2 then return Vector2.new(x,y) end
		elseif typeName == "Vector3" then
			local vals = str:split(",")
			local x,y,z = tonumber(vals[1]),tonumber(vals[2]),tonumber(vals[3])
			if x and y and z and #vals >= 3 then return Vector3.new(x,y,z) end
		elseif typeName == "UDim" then
			local vals = str:split(",")
			local scale,offset = tonumber(vals[1]),tonumber(vals[2])
			if scale and offset and #vals >= 2 then return UDim.new(scale,offset) end
		elseif typeName == "UDim2" then
			local vals = str:gsub("[{}]",""):split(",")
			local xScale,xOffset,yScale,yOffset = tonumber(vals[1]),tonumber(vals[2]),tonumber(vals[3]),tonumber(vals[4])
			if xScale and xOffset and yScale and yOffset and #vals >= 4 then return UDim2.new(xScale,xOffset,yScale,yOffset) end
		elseif typeName == "CFrame" then
			local vals = str:split(",")
			local s,result = pcall(CFrame.new,unpack(vals))
			if s and #vals >= 12 then return result end
		elseif typeName == "Rect" then
			local vals = str:split(",")
			local s,result = pcall(Rect.new,unpack(vals))
			if s and #vals >= 4 then return result end
		elseif typeName == "Ray" then
			local vals = str:gsub("[{}]",""):split(",")
			local s,origin = pcall(Vector3.new,unpack(vals,1,3))
			local s2,direction = pcall(Vector3.new,unpack(vals,4,6))
			if s and s2 and #vals >= 6 then return Ray.new(origin,direction) end
		elseif typeName == "NumberRange" then
			local vals = str:split(",")
			local s,result = pcall(NumberRange.new,unpack(vals))
			if s and #vals >= 1 then return result end
		elseif typeName == "Color3" then
			local vals = str:gsub("[{}]",""):split(",")
			local s,result = pcall(Color3.fromRGB,unpack(vals))
			if s and #vals >= 3 then return result end
		end

		return nil
	end

	Properties.ValueToString = function(prop,val)
		local typeData = prop.ValueType
		local typeName = typeData.Name

		if typeName == "Color3" then
			return Lib.ColorToBytes(val)
		elseif typeName == "NumberRange" then
			return val.Min..", "..val.Max
		end

		return tostring(val)
	end

	Properties.GetIndexableProps = function(obj,classData)
		if not Main.Elevated then
			if not pcall(function() return obj.ClassName end) then return nil end
		end

		local ignoreProps = Properties.IgnoreProps[classData.Name] or {}

		local result = {}
		local count = 1
		local props = classData.Properties
		for i = 1,#props do
			local prop = props[i]
			if not ignoreProps[prop.Name] then
				local s = pcall(function() return obj[prop.Name] end)
				if s then
					result[count] = prop
					count = count + 1
				end
			end
		end

		return result
	end

	Properties.FindFirstObjWhichIsA = function(class)
		local classList = Properties.ClassLists[class] or {}
		if classList and #classList > 0 then
			return classList[1]
		end

		return nil
	end

	Properties.ComputeConflicts = function(p)
		local maxConflictCheck = Settings.Properties.MaxConflictCheck
		local sList = Explorer.Selection.List
		local classLists = Properties.ClassLists
		local stringSplit = string.split
		local t_clear = table.clear
		local conflictIgnore = Properties.ConflictIgnore
		local conflictMap = {}
		local propList = p and {p} or props

		if p then
			local gName = p.Class.."."..p.Name
			autoUpdateObjs[gName] = nil
			local subProps = Properties.ConflictSubProps[p.ValueType.Name] or {}
			for i = 1,#subProps do
				autoUpdateObjs[gName.."."..subProps[i]] = nil
			end
		else
			table.clear(autoUpdateObjs)
		end

		if #sList > 0 then
			for i = 1,#propList do
				local prop = propList[i]
				local propName,propClass = prop.Name,prop.Class
				local typeData = prop.RootType or prop.ValueType
				local typeName = typeData.Name
				local attributeName = prop.AttributeName
				local gName = propClass.."."..propName

				local checked = 0
				local subProps = Properties.ConflictSubProps[typeName] or {}
				local subPropCount = #subProps
				local toCheck = subPropCount + 1
				local conflictsFound = 0
				local indexNames = {}
				local ignored = conflictIgnore[propClass] and conflictIgnore[propClass][propName]
				local truthyCheck = (typeName == "PhysicalProperties")
				local isAttribute = prop.IsAttribute
				local isMultiType = prop.MultiType

				t_clear(conflictMap)

				if not isMultiType then
					local firstVal,firstObj,firstSet
					local classList = classLists[prop.Class] or {}
					for c = 1,#classList do
						local obj = classList[c]
						if not firstSet then
							if isAttribute then
								firstVal = getAttribute(obj,attributeName)
								if firstVal ~= nil then
									firstObj = obj
									firstSet = true
								end
							else
								firstVal = obj[propName]
								firstObj = obj
								firstSet = true
							end
							if ignored then break end
						else
							local propVal,skip
							if isAttribute then
								propVal = getAttribute(obj,attributeName)
								if propVal == nil then skip = true end
							else
								propVal = obj[propName]
							end

							if not skip then
								if not conflictMap[1] then
									if truthyCheck then
										if (firstVal and true or false) ~= (propVal and true or false) then
											conflictMap[1] = true
											conflictsFound = conflictsFound + 1
										end
									elseif firstVal ~= propVal then
										conflictMap[1] = true
										conflictsFound = conflictsFound + 1
									end
								end

								if subPropCount > 0 then
									for sPropInd = 1,subPropCount do
										local indexes = indexNames[sPropInd]
										if not indexes then indexes = stringSplit(subProps[sPropInd],".") indexNames[sPropInd] = indexes end

										local firstValSub = firstVal
										local propValSub = propVal

										for j = 1,#indexes do
											if not firstValSub or not propValSub then break end -- PhysicalProperties
											local indexName = indexes[j]
											firstValSub = firstValSub[indexName]
											propValSub = propValSub[indexName]
										end

										local mapInd = sPropInd + 1
										if not conflictMap[mapInd] and firstValSub ~= propValSub then
											conflictMap[mapInd] = true
											conflictsFound = conflictsFound + 1
										end
									end
								end

								if conflictsFound == toCheck then break end
							end
						end

						checked = checked + 1
						if checked == maxConflictCheck then break end
					end

					if not conflictMap[1] then autoUpdateObjs[gName] = firstObj end
					for sPropInd = 1,subPropCount do
						if not conflictMap[sPropInd+1] then
							autoUpdateObjs[gName.."."..subProps[sPropInd]] = firstObj
						end
					end
				end
			end
		end

		if p then
			Properties.Refresh()
		end
	end

	-- Fetches the properties to be displayed based on the explorer selection
	Properties.ShowExplorerProps = function()
		local maxConflictCheck = Settings.Properties.MaxConflictCheck
		local sList = Explorer.Selection.List
		local foundClasses = {}
		local propCount = 1
		local elevated = Main.Elevated
		local showDeprecated,showHidden = Settings.Properties.ShowDeprecated,Settings.Properties.ShowHidden
		local Classes = API.Classes
		local classLists = {}
		local lower = string.lower
		local RMDCustomOrders = RMD.PropertyOrders
		local getAttributes = game.GetAttributes
		local maxAttrs = Settings.Properties.MaxAttributes
		local showingAttrs = Settings.Properties.ShowAttributes
		local foundAttrs = {}
		local attrCount = 0
		local typeof = typeof
		local typeNameConvert = Properties.TypeNameConvert

		table.clear(props)

		for i = 1,#sList do
			local node = sList[i]
			local obj = node.Obj
			local class = node.Class
			if not class then class = obj.ClassName node.Class = class end

			local apiClass = Classes[class]
			while apiClass do
				local APIClassName = apiClass.Name
				if not foundClasses[APIClassName] then
					local apiProps = indexableProps[APIClassName]
					if not apiProps then apiProps = Properties.GetIndexableProps(obj,apiClass) indexableProps[APIClassName] = apiProps end

					for i = 1,#apiProps do
						local prop = apiProps[i]
						local tags = prop.Tags
						if (not tags.Deprecated or showDeprecated) and (not tags.Hidden or showHidden) then
							props[propCount] = prop
							propCount = propCount + 1
						end
					end
					foundClasses[APIClassName] = true
				end

				local classList = classLists[APIClassName]
				if not classList then classList = {} classLists[APIClassName] = classList end
				classList[#classList+1] = obj

				apiClass = apiClass.Superclass
			end

			if showingAttrs and attrCount < maxAttrs then
				local attrs = getAttributes(obj)
				for name,val in pairs(attrs) do
					local typ = typeof(val)
					if not foundAttrs[name] then
						local category = (typ == "Instance" and "Class") or (typ == "EnumItem" and "Enum") or "Other"
						local valType = {Name = typeNameConvert[typ] or typ, Category = category}
						local attrProp = {IsAttribute = true, Name = "ATTR_"..name, AttributeName = name, DisplayName = name, Class = "Instance", ValueType = valType, Category = "Attributes", Tags = {}}
						props[propCount] = attrProp
						propCount = propCount + 1
						attrCount = attrCount + 1
						foundAttrs[name] = {typ,attrProp}
						if attrCount == maxAttrs then break end
					elseif foundAttrs[name][1] ~= typ then
						foundAttrs[name][2].MultiType = true
						foundAttrs[name][2].Tags.ReadOnly = true
						foundAttrs[name][2].ValueType = {Name = "string"}
					end
				end
			end
		end

		table.sort(props,function(a,b)
			if a.Category ~= b.Category then
				return (categoryOrder[a.Category] or 9999) < (categoryOrder[b.Category] or 9999)
			else
				local aOrder = (RMDCustomOrders[a.Class] and RMDCustomOrders[a.Class][a.Name]) or 9999999
				local bOrder = (RMDCustomOrders[b.Class] and RMDCustomOrders[b.Class][b.Name]) or 9999999
				if aOrder ~= bOrder then
					return aOrder < bOrder
				else
					return lower(a.Name) < lower(b.Name)
				end
			end
		end)

		-- Find conflicts and get auto-update instances
		Properties.ClassLists = classLists
		Properties.ComputeConflicts()
		--warn("CONFLICT",tick()-start)
		if #props > 0 then
			props[#props+1] = Properties.AddAttributeProp
		end

		Properties.Update()
		Properties.Refresh()
	end

	Properties.UpdateView = function()
		local maxEntries = math.ceil(propsFrame.AbsoluteSize.Y / 23)
		local maxX = propsFrame.AbsoluteSize.X
		local totalWidth = Properties.ViewWidth + Properties.MinInputWidth

		scrollV.VisibleSpace = maxEntries
		scrollV.TotalSpace = #viewList + 1
		scrollH.VisibleSpace = maxX
		scrollH.TotalSpace = totalWidth

		scrollV.Gui.Visible = #viewList + 1 > maxEntries
		scrollH.Gui.Visible = Settings.Properties.ScaleType == 0 and totalWidth > maxX

		local oldSize = propsFrame.Size
		propsFrame.Size = UDim2.new(1,(scrollV.Gui.Visible and -16 or 0),1,(scrollH.Gui.Visible and -39 or -23))
		if oldSize ~= propsFrame.Size then
			Properties.UpdateView()
		else
			scrollV:Update()
			scrollH:Update()

			if scrollV.Gui.Visible and scrollH.Gui.Visible then
				scrollV.Gui.Size = UDim2.new(0,16,1,-39)
				scrollH.Gui.Size = UDim2.new(1,-16,0,16)
				Properties.Window.GuiElems.Content.ScrollCorner.Visible = true
			else
				scrollV.Gui.Size = UDim2.new(0,16,1,-23)
				scrollH.Gui.Size = UDim2.new(1,0,0,16)
				Properties.Window.GuiElems.Content.ScrollCorner.Visible = false
			end

			Properties.Index = scrollV.Index
		end
	end

	Properties.MakeSubProp = function(prop,subName,valueType,displayName)
		local subProp = {}
		for i,v in pairs(prop) do
			subProp[i] = v
		end
		subProp.RootType = subProp.RootType or subProp.ValueType
		subProp.ValueType = valueType
		subProp.SubName = subProp.SubName and (subProp.SubName..subName) or subName
		subProp.DisplayName = displayName

		return subProp
	end

	Properties.GetExpandedProps = function(prop) -- TODO: Optimize using table
		local result = {}
		local typeData = prop.ValueType
		local typeName = typeData.Name
		local makeSubProp = Properties.MakeSubProp

		if typeName == "Vector2" then
			result[1] = makeSubProp(prop,".X",{Name = "float"})
			result[2] = makeSubProp(prop,".Y",{Name = "float"})
		elseif typeName == "Vector3" then
			result[1] = makeSubProp(prop,".X",{Name = "float"})
			result[2] = makeSubProp(prop,".Y",{Name = "float"})
			result[3] = makeSubProp(prop,".Z",{Name = "float"})
		elseif typeName == "CFrame" then
			result[1] = makeSubProp(prop,".Position",{Name = "Vector3"})
			result[2] = makeSubProp(prop,".RightVector",{Name = "Vector3"})
			result[3] = makeSubProp(prop,".UpVector",{Name = "Vector3"})
			result[4] = makeSubProp(prop,".LookVector",{Name = "Vector3"})
		elseif typeName == "UDim" then
			result[1] = makeSubProp(prop,".Scale",{Name = "float"})
			result[2] = makeSubProp(prop,".Offset",{Name = "int"})
		elseif typeName == "UDim2" then
			result[1] = makeSubProp(prop,".X",{Name = "UDim"})
			result[2] = makeSubProp(prop,".Y",{Name = "UDim"})
		elseif typeName == "Rect" then
			result[1] = makeSubProp(prop,".Min.X",{Name = "float"},"X0")
			result[2] = makeSubProp(prop,".Min.Y",{Name = "float"},"Y0")
			result[3] = makeSubProp(prop,".Max.X",{Name = "float"},"X1")
			result[4] = makeSubProp(prop,".Max.Y",{Name = "float"},"Y1")
		elseif typeName == "PhysicalProperties" then
			result[1] = makeSubProp(prop,".Density",{Name = "float"})
			result[2] = makeSubProp(prop,".Elasticity",{Name = "float"})
			result[3] = makeSubProp(prop,".ElasticityWeight",{Name = "float"})
			result[4] = makeSubProp(prop,".Friction",{Name = "float"})
			result[5] = makeSubProp(prop,".FrictionWeight",{Name = "float"})
		elseif typeName == "Ray" then
			result[1] = makeSubProp(prop,".Origin",{Name = "Vector3"})
			result[2] = makeSubProp(prop,".Direction",{Name = "Vector3"})
		elseif typeName == "NumberRange" then
			result[1] = makeSubProp(prop,".Min",{Name = "float"})
			result[2] = makeSubProp(prop,".Max",{Name = "float"})
		elseif typeName == "Faces" then
			result[1] = makeSubProp(prop,".Back",{Name = "bool"})
			result[2] = makeSubProp(prop,".Bottom",{Name = "bool"})
			result[3] = makeSubProp(prop,".Front",{Name = "bool"})
			result[4] = makeSubProp(prop,".Left",{Name = "bool"})
			result[5] = makeSubProp(prop,".Right",{Name = "bool"})
			result[6] = makeSubProp(prop,".Top",{Name = "bool"})
		elseif typeName == "Axes" then
			result[1] = makeSubProp(prop,".X",{Name = "bool"})
			result[2] = makeSubProp(prop,".Y",{Name = "bool"})
			result[3] = makeSubProp(prop,".Z",{Name = "bool"})
		end

		if prop.Name == "SoundId" and prop.Class == "Sound" then
			result[1] = Properties.SoundPreviewProp
		end

		return result
	end

	Properties.Update = function()
		table.clear(viewList)

		local nameWidthCache = Properties.NameWidthCache
		local lastCategory
		local count = 1
		local maxWidth,maxDepth = 0,1

		local textServ = service.TextService
		local getTextSize = textServ.GetTextSize
		local font = Enum.Font.SourceSans
		local size = Vector2.new(math.huge,20)
		local stringSplit = string.split
		local entryIndent = Properties.EntryIndent
		local isFirstScaleType = Settings.Properties.ScaleType == 0
		local find,lower = string.find,string.lower
		local searchText = (#Properties.SearchText > 0 and lower(Properties.SearchText))

		local function recur(props,depth)
			for i = 1,#props do
				local prop = props[i]
				local propName = prop.Name
				local subName = prop.SubName
				local category = prop.Category

				local visible
				if searchText and depth == 1 then
					if find(lower(propName),searchText,1,true) then
						visible = true
					end
				else
					visible = true
				end

				if visible and lastCategory ~= category then
					viewList[count] = {CategoryName = category}
					count = count + 1
					lastCategory = category
				end

				if (expanded["CAT_"..category] and visible) or prop.SpecialRow then
					if depth > 1 then prop.Depth = depth if depth > maxDepth then maxDepth = depth end end

					if isFirstScaleType then
						local nameArr = subName and stringSplit(subName,".")
						local displayName = prop.DisplayName or (nameArr and nameArr[#nameArr]) or propName

						local nameWidth = nameWidthCache[displayName]
						if not nameWidth then nameWidth = getTextSize(textServ,displayName,14,font,size).X nameWidthCache[displayName] = nameWidth end

						local totalWidth = nameWidth + entryIndent*depth
						if totalWidth > maxWidth then
							maxWidth = totalWidth
						end
					end

					viewList[count] = prop
					count = count + 1

					local fullName = prop.Class.."."..prop.Name..(prop.SubName or "")
					if expanded[fullName] then
						local nextDepth = depth+1
						local expandedProps = Properties.GetExpandedProps(prop)
						if #expandedProps > 0 then
							recur(expandedProps,nextDepth)
						end
					end
				end
			end
		end
		recur(props,1)

		inputProp = nil
		Properties.ViewWidth = maxWidth + 9 + Properties.EntryOffset
		Properties.UpdateView()
	end

	Properties.NewPropEntry = function(index)
		local newEntry = Properties.EntryTemplate:Clone()
		local nameFrame = newEntry.NameFrame
		local valueFrame = newEntry.ValueFrame
		local newCheckbox = Lib.Checkbox.new(1)
		newCheckbox.Gui.Position = UDim2.new(0,3,0,3)
		newCheckbox.Gui.Parent = valueFrame
		newCheckbox.OnInput:Connect(function()
			local prop = viewList[index + Properties.Index]
			if not prop then return end

			if prop.ValueType.Name == "PhysicalProperties" then
				Properties.SetProp(prop,newCheckbox.Toggled and true or nil)
			else
				Properties.SetProp(prop,newCheckbox.Toggled)
			end
		end)
		checkboxes[index] = newCheckbox

		local iconFrame = Main.MiscIcons:GetLabel()
		iconFrame.Position = UDim2.new(0,2,0,3)
		iconFrame.Parent = newEntry.ValueFrame.RightButton

		newEntry.Position = UDim2.new(0,0,0,23*(index-1))

		nameFrame.Expand.InputBegan:Connect(function(input)
			local prop = viewList[index + Properties.Index]
			if not prop or input.UserInputType ~= Enum.UserInputType.MouseMovement then return end

			local fullName = (prop.CategoryName and "CAT_"..prop.CategoryName) or prop.Class.."."..prop.Name..(prop.SubName or "")

			Main.MiscIcons:DisplayByKey(newEntry.NameFrame.Expand.Icon, expanded[fullName] and "Collapse_Over" or "Expand_Over")
		end)

		nameFrame.Expand.InputEnded:Connect(function(input)
			local prop = viewList[index + Properties.Index]
			if not prop or input.UserInputType ~= Enum.UserInputType.MouseMovement then return end

			local fullName = (prop.CategoryName and "CAT_"..prop.CategoryName) or prop.Class.."."..prop.Name..(prop.SubName or "")

			Main.MiscIcons:DisplayByKey(newEntry.NameFrame.Expand.Icon, expanded[fullName] and "Collapse" or "Expand")
		end)

		nameFrame.Expand.MouseButton1Down:Connect(function()
			local prop = viewList[index + Properties.Index]
			if not prop then return end

			local fullName = (prop.CategoryName and "CAT_"..prop.CategoryName) or prop.Class.."."..prop.Name..(prop.SubName or "")
			if not prop.CategoryName and not Properties.ExpandableTypes[prop.ValueType and prop.ValueType.Name] and not Properties.ExpandableProps[fullName] then return end

			expanded[fullName] = not expanded[fullName]
			Properties.Update()
			Properties.Refresh()
		end)

		nameFrame.PropName.InputBegan:Connect(function(input)
			local prop = viewList[index + Properties.Index]
			if not prop then return end
			if input.UserInputType == Enum.UserInputType.MouseMovement and not nameFrame.PropName.TextFits then
				local fullNameFrame = Properties.FullNameFrame	
				local nameArr = string.split(prop.Class.."."..prop.Name..(prop.SubName or ""),".")
				local dispName = prop.DisplayName or nameArr[#nameArr]
				local sizeX = service.TextService:GetTextSize(dispName,14,Enum.Font.SourceSans,Vector2.new(math.huge,20)).X

				fullNameFrame.TextLabel.Text = dispName
				--fullNameFrame.Position = UDim2.new(0,Properties.EntryIndent*(prop.Depth or 1) + Properties.EntryOffset,0,23*(index-1))
				fullNameFrame.Size = UDim2.new(0,sizeX + 4,0,22)
				fullNameFrame.Visible = true
				Properties.FullNameFrameIndex = index
				Properties.FullNameFrameAttach.SetData(fullNameFrame, {Target = nameFrame})
				Properties.FullNameFrameAttach.Enable()
			end
		end)

		nameFrame.PropName.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement and Properties.FullNameFrameIndex == index then
				Properties.FullNameFrame.Visible = false
				Properties.FullNameFrameAttach.Disable()
			end
		end)

		valueFrame.ValueBox.MouseButton1Down:Connect(function()
			local prop = viewList[index + Properties.Index]
			if not prop then return end

			Properties.SetInputProp(prop,index)
		end)

		valueFrame.ColorButton.MouseButton1Down:Connect(function()
			local prop = viewList[index + Properties.Index]
			if not prop then return end

			Properties.SetInputProp(prop,index,"color")
		end)

		valueFrame.RightButton.MouseButton1Click:Connect(function()
			local prop = viewList[index + Properties.Index]
			if not prop then return end

			local fullName = prop.Class.."."..prop.Name..(prop.SubName or "")
			local inputFullName = inputProp and (inputProp.Class.."."..inputProp.Name..(inputProp.SubName or ""))

			if fullName == inputFullName and inputProp.ValueType.Category == "Class" then
				inputProp = nil
				Properties.SetProp(prop,nil)
			else
				Properties.SetInputProp(prop,index,"right")
			end
		end)

		nameFrame.ToggleAttributes.MouseButton1Click:Connect(function()
			Settings.Properties.ShowAttributes = not Settings.Properties.ShowAttributes
			Properties.ShowExplorerProps()
		end)

		newEntry.RowButton.MouseButton1Click:Connect(function()
			Properties.DisplayAddAttributeWindow()
		end)

		newEntry.EditAttributeButton.MouseButton1Down:Connect(function()
			local prop = viewList[index + Properties.Index]
			if not prop then return end

			Properties.DisplayAttributeContext(prop)
		end)

		valueFrame.SoundPreview.ControlButton.MouseButton1Click:Connect(function()
			if Properties.PreviewSound and Properties.PreviewSound.Playing then
				Properties.SetSoundPreview(false)
			else
				local soundObj = Properties.FindFirstObjWhichIsA("Sound")
				if soundObj then Properties.SetSoundPreview(soundObj) end
			end
		end)

		valueFrame.SoundPreview.InputBegan:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end

			local releaseEvent,mouseEvent
			releaseEvent = service.UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
				releaseEvent:Disconnect()
				mouseEvent:Disconnect()
			end)

			local timeLine = newEntry.ValueFrame.SoundPreview.TimeLine
			local soundObj = Properties.FindFirstObjWhichIsA("Sound")
			if soundObj then Properties.SetSoundPreview(soundObj,true) end

			local function update(input)
				local sound = Properties.PreviewSound
				if not sound or sound.TimeLength == 0 then return end

				local mouseX = input.Position.X
				local timeLineSize = timeLine.AbsoluteSize
				local relaX = mouseX - timeLine.AbsolutePosition.X

				if timeLineSize.X <= 1 then return end
				if relaX < 0 then relaX = 0 elseif relaX >= timeLineSize.X then relaX = timeLineSize.X-1 end

				local perc = (relaX/(timeLineSize.X-1))
				sound.TimePosition = perc*sound.TimeLength
				timeLine.Slider.Position = UDim2.new(perc,-4,0,-8)
			end
			update(input)

			mouseEvent = service.UserInputService.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					update(input)
				end
			end)
		end)

		newEntry.Parent = propsFrame

		return {
			Gui = newEntry,
			GuiElems = {
				NameFrame = nameFrame,
				ValueFrame = valueFrame,
				PropName = nameFrame.PropName,
				ValueBox = valueFrame.ValueBox,
				Expand = nameFrame.Expand,
				ColorButton = valueFrame.ColorButton,
				ColorPreview = valueFrame.ColorButton.ColorPreview,
				Gradient = valueFrame.ColorButton.ColorPreview.UIGradient,
				EnumArrow = valueFrame.EnumArrow,
				Checkbox = valueFrame.Checkbox,
				RightButton = valueFrame.RightButton,
				RightButtonIcon = iconFrame,
				RowButton = newEntry.RowButton,
				EditAttributeButton = newEntry.EditAttributeButton,
				ToggleAttributes = nameFrame.ToggleAttributes,
				SoundPreview = valueFrame.SoundPreview,
				SoundPreviewSlider = valueFrame.SoundPreview.TimeLine.Slider
			}
		}
	end

	Properties.GetSoundPreviewEntry = function()
		for i = 1,#viewList do
			if viewList[i] == Properties.SoundPreviewProp then
				return propEntries[i - Properties.Index]
			end
		end
	end

	Properties.SetSoundPreview = function(soundObj,noplay)
		local sound = Properties.PreviewSound
		if not sound then
			sound = Instance.new("Sound")
			sound.Name = "Preview"
			sound.Paused:Connect(function()
				local entry = Properties.GetSoundPreviewEntry()
				if entry then Main.MiscIcons:DisplayByKey(entry.GuiElems.SoundPreview.ControlButton.Icon, "Play") end
			end)
			sound.Resumed:Connect(function() Properties.Refresh() end)
			sound.Ended:Connect(function()
				local entry = Properties.GetSoundPreviewEntry()
				if entry then entry.GuiElems.SoundPreviewSlider.Position = UDim2.new(0,-4,0,-8) end
				Properties.Refresh()
			end)
			sound.Parent = window.Gui
			Properties.PreviewSound = sound
		end

		if not soundObj then
			sound:Pause()
		else
			local newId = sound.SoundId ~= soundObj.SoundId
			sound.SoundId = soundObj.SoundId
			sound.PlaybackSpeed = soundObj.PlaybackSpeed
			sound.Volume = soundObj.Volume
			if newId then sound.TimePosition = 0 end
			if not noplay then sound:Resume() end

			coroutine.wrap(function()
				local previewTime = tick()
				Properties.SoundPreviewTime = previewTime
				while previewTime == Properties.SoundPreviewTime and sound.Playing do
					local entry = Properties.GetSoundPreviewEntry()
					if entry then
						local tl = sound.TimeLength
						local perc = sound.TimePosition/(tl == 0 and 1 or tl)
						entry.GuiElems.SoundPreviewSlider.Position = UDim2.new(perc,-4,0,-8)
					end
					Lib.FastWait()
				end
			end)()
			Properties.Refresh()
		end
	end

	Properties.DisplayAttributeContext = function(prop)
		local context = Properties.AttributeContext
		if not context then
			context = Lib.ContextMenu.new()
			context.Iconless = true
			context.Width = 80
		end
		context:Clear()

		context:Add({Name = "Edit", OnClick = function()
			Properties.DisplayAddAttributeWindow(prop)
		end})
		context:Add({Name = "Delete", OnClick = function()
			Properties.SetProp(prop,nil,true)
			Properties.ShowExplorerProps()
		end})

		context:Show()
	end

	Properties.DisplayAddAttributeWindow = function(editAttr)
		local win = Properties.AddAttributeWindow
		if not win then
			win = Lib.Window.new()
			win.Alignable = false
			win.Resizable = false
			win:SetTitle("Add Attribute")
			win:SetSize(200,130)

			local saveButton = Lib.Button.new()
			local nameLabel = Lib.Label.new()
			nameLabel.Text = "Name"
			nameLabel.Position = UDim2.new(0,30,0,10)
			nameLabel.Size = UDim2.new(0,40,0,20)
			win:Add(nameLabel)

			local nameBox = Lib.ViewportTextBox.new()
			nameBox.Position = UDim2.new(0,75,0,10)
			nameBox.Size = UDim2.new(0,120,0,20)
			win:Add(nameBox,"NameBox")
			nameBox.TextBox:GetPropertyChangedSignal("Text"):Connect(function()
				saveButton:SetDisabled(#nameBox:GetText() == 0)
			end)

			local typeLabel = Lib.Label.new()
			typeLabel.Text = "Type"
			typeLabel.Position = UDim2.new(0,30,0,40)
			typeLabel.Size = UDim2.new(0,40,0,20)
			win:Add(typeLabel)

			local typeChooser = Lib.DropDown.new()
			typeChooser.CanBeEmpty = false
			typeChooser.Position = UDim2.new(0,75,0,40)
			typeChooser.Size = UDim2.new(0,120,0,20)
			typeChooser:SetOptions(Properties.AllowedAttributeTypes)
			win:Add(typeChooser,"TypeChooser")

			local errorLabel = Lib.Label.new()
			errorLabel.Text = ""
			errorLabel.Position = UDim2.new(0,5,1,-45)
			errorLabel.Size = UDim2.new(1,-10,0,20)
			errorLabel.TextColor3 = Settings.Theme.Important
			win.ErrorLabel = errorLabel
			win:Add(errorLabel,"Error")

			local cancelButton = Lib.Button.new()
			cancelButton.Text = "Cancel"
			cancelButton.Position = UDim2.new(1,-97,1,-25)
			cancelButton.Size = UDim2.new(0,92,0,20)
			cancelButton.OnClick:Connect(function()
				win:Close()
			end)
			win:Add(cancelButton)

			saveButton.Text = "Save"
			saveButton.Position = UDim2.new(0,5,1,-25)
			saveButton.Size = UDim2.new(0,92,0,20)
			saveButton.OnClick:Connect(function()
				local name = nameBox:GetText()
				if #name > 100 then
					errorLabel.Text = "Error: Name over 100 chars"
					return
				elseif name:sub(1,3) == "RBX" then
					errorLabel.Text = "Error: Name begins with 'RBX'"
					return
				end

				local typ = typeChooser.Selected
				local valType = {Name = Properties.TypeNameConvert[typ] or typ, Category = "DataType"}
				local attrProp = {IsAttribute = true, Name = "ATTR_"..name, AttributeName = name, DisplayName = name, Class = "Instance", ValueType = valType, Category = "Attributes", Tags = {}}

				Settings.Properties.ShowAttributes = true
				Properties.SetProp(attrProp,Properties.DefaultPropValue[valType.Name],true,Properties.EditingAttribute)
				Properties.ShowExplorerProps()
				win:Close()
			end)
			win:Add(saveButton,"SaveButton")

			Properties.AddAttributeWindow = win
		end

		Properties.EditingAttribute = editAttr
		win:SetTitle(editAttr and "Edit Attribute "..editAttr.AttributeName or "Add Attribute")
		win.Elements.Error.Text = ""
		win.Elements.NameBox:SetText("")
		win.Elements.SaveButton:SetDisabled(true)
		win.Elements.TypeChooser:SetSelected(1)
		win:Show()
	end

	Properties.IsTextEditable = function(prop)
		local typeData = prop.ValueType
		local typeName = typeData.Name

		return typeName ~= "bool" and typeData.Category ~= "Enum" and typeData.Category ~= "Class" and typeName ~= "BrickColor"
	end

	Properties.DisplayEnumDropdown = function(entryIndex)
		local context = Properties.EnumContext
		if not context then
			context = Lib.ContextMenu.new()
			context.Iconless = true
			context.MaxHeight = 200
			context.ReverseYOffset = 22
			Properties.EnumDropdown = context
		end

		if not inputProp or inputProp.ValueType.Category ~= "Enum" then return end
		local prop = inputProp

		local entry = propEntries[entryIndex]
		local valueFrame = entry.GuiElems.ValueFrame

		local enum = Enum[prop.ValueType.Name]
		if not enum then return end

		local sorted = {}
		for name,enum in next,enum:GetEnumItems() do
			sorted[#sorted+1] = enum
		end
		table.sort(sorted,function(a,b) return a.Name < b.Name end)

		context:Clear()

		local function onClick(name)
			if prop ~= inputProp then return end

			local enumItem = enum[name]
			inputProp = nil
			Properties.SetProp(prop,enumItem)
		end

		for i = 1,#sorted do
			local enumItem = sorted[i]
			context:Add({Name = enumItem.Name, OnClick = onClick})
		end

		context.Width = valueFrame.AbsoluteSize.X
		context:Show(valueFrame.AbsolutePosition.X, valueFrame.AbsolutePosition.Y + 22)
	end

	Properties.DisplayBrickColorEditor = function(prop,entryIndex,col)
		local editor = Properties.BrickColorEditor
		if not editor then
			editor = Lib.BrickColorPicker.new()
			editor.Gui.DisplayOrder = Main.DisplayOrders.Menu
			editor.ReverseYOffset = 22

			editor.OnSelect:Connect(function(col)
				if not editor.CurrentProp or editor.CurrentProp.ValueType.Name ~= "BrickColor" then return end

				if editor.CurrentProp == inputProp then inputProp = nil end
				Properties.SetProp(editor.CurrentProp,BrickColor.new(col))
			end)

			editor.OnMoreColors:Connect(function() -- TODO: Special Case BasePart.BrickColor to BasePart.Color
				editor:Close()
				local colProp
				for i,v in pairs(API.Classes.BasePart.Properties) do
					if v.Name == "Color" then
						colProp = v
						break
					end
				end
				Properties.DisplayColorEditor(colProp,editor.SavedColor.Color)
			end)

			Properties.BrickColorEditor = editor
		end

		local entry = propEntries[entryIndex]
		local valueFrame = entry.GuiElems.ValueFrame

		editor.CurrentProp = prop
		editor.SavedColor = col
		if prop and prop.Class == "BasePart" and prop.Name == "BrickColor" then
			editor:SetMoreColorsVisible(true)
		else
			editor:SetMoreColorsVisible(false)
		end
		editor:Show(valueFrame.AbsolutePosition.X, valueFrame.AbsolutePosition.Y + 22)
	end

	Properties.DisplayColorEditor = function(prop,col)
		local editor = Properties.ColorEditor
		if not editor then
			editor = Lib.ColorPicker.new()

			editor.OnSelect:Connect(function(col)
				if not editor.CurrentProp then return end
				local typeName = editor.CurrentProp.ValueType.Name
				if typeName ~= "Color3" and typeName ~= "BrickColor" then return end

				local colVal = (typeName == "Color3" and col or BrickColor.new(col))

				if editor.CurrentProp == inputProp then inputProp = nil end
				Properties.SetProp(editor.CurrentProp,colVal)
			end)

			Properties.ColorEditor = editor
		end

		editor.CurrentProp = prop
		if col then
			editor:SetColor(col)
		else
			local firstVal = Properties.GetFirstPropVal(prop)
			if firstVal then editor:SetColor(firstVal) end
		end
		editor:Show()
	end

	Properties.DisplayNumberSequenceEditor = function(prop,seq)
		local editor = Properties.NumberSequenceEditor
		if not editor then
			editor = Lib.NumberSequenceEditor.new()

			editor.OnSelect:Connect(function(val)
				if not editor.CurrentProp or editor.CurrentProp.ValueType.Name ~= "NumberSequence" then return end

				if editor.CurrentProp == inputProp then inputProp = nil end
				Properties.SetProp(editor.CurrentProp,val)
			end)

			Properties.NumberSequenceEditor = editor
		end

		editor.CurrentProp = prop
		if seq then
			editor:SetSequence(seq)
		else
			local firstVal = Properties.GetFirstPropVal(prop)
			if firstVal then editor:SetSequence(firstVal) end
		end
		editor:Show()
	end

	Properties.DisplayColorSequenceEditor = function(prop,seq)
		local editor = Properties.ColorSequenceEditor
		if not editor then
			editor = Lib.ColorSequenceEditor.new()

			editor.OnSelect:Connect(function(val)
				if not editor.CurrentProp or editor.CurrentProp.ValueType.Name ~= "ColorSequence" then return end

				if editor.CurrentProp == inputProp then inputProp = nil end
				Properties.SetProp(editor.CurrentProp,val)
			end)

			Properties.ColorSequenceEditor = editor
		end

		editor.CurrentProp = prop
		if seq then
			editor:SetSequence(seq)
		else
			local firstVal = Properties.GetFirstPropVal(prop)
			if firstVal then editor:SetSequence(firstVal) end
		end
		editor:Show()
	end

	Properties.GetFirstPropVal = function(prop)
		local first = Properties.FindFirstObjWhichIsA(prop.Class)
		if first then
			return Properties.GetPropVal(prop,first)
		end
	end

	Properties.GetPropVal = function(prop,obj)
		if prop.MultiType then return "<Multiple Types>" end
		if not obj then return end

		local propVal
		if prop.IsAttribute then
			propVal = getAttribute(obj,prop.AttributeName)
			if propVal == nil then return nil end

			local typ = typeof(propVal)
			local currentType = Properties.TypeNameConvert[typ] or typ
			if prop.RootType then
				if prop.RootType.Name ~= currentType then
					return nil
				end
			elseif prop.ValueType.Name ~= currentType then
				return nil
			end
		else
			propVal = obj[prop.Name]
		end
		if prop.SubName then
			local indexes = string.split(prop.SubName,".")
			for i = 1,#indexes do
				local indexName = indexes[i]
				if #indexName > 0 and propVal then
					propVal = propVal[indexName]
				end
			end
		end

		return propVal
	end

	Properties.SelectObject = function(obj)
		if inputProp and inputProp.ValueType.Category == "Class" then
			local prop = inputProp
			inputProp = nil

			if isa(obj,prop.ValueType.Name) then
				Properties.SetProp(prop,obj)
			else
				Properties.Refresh()
			end

			return true
		end

		return false
	end

	Properties.DisplayProp = function(prop,entryIndex)
		local propName = prop.Name
		local typeData = prop.ValueType
		local typeName = typeData.Name
		local tags = prop.Tags
		local gName = prop.Class.."."..prop.Name..(prop.SubName or "")
		local propObj = autoUpdateObjs[gName]
		local entryData = propEntries[entryIndex]
		local UDim2 = UDim2

		local guiElems = entryData.GuiElems
		local valueFrame = guiElems.ValueFrame
		local valueBox = guiElems.ValueBox
		local colorButton = guiElems.ColorButton
		local colorPreview = guiElems.ColorPreview
		local gradient = guiElems.Gradient
		local enumArrow = guiElems.EnumArrow
		local checkbox = guiElems.Checkbox
		local rightButton = guiElems.RightButton
		local soundPreview = guiElems.SoundPreview

		local propVal = Properties.GetPropVal(prop,propObj)
		local inputFullName = inputProp and (inputProp.Class.."."..inputProp.Name..(inputProp.SubName or ""))

		local offset = 4
		local endOffset = 6

		-- Offsetting the ValueBox for ValueType specific buttons
		if (typeName == "Color3" or typeName == "BrickColor" or typeName == "ColorSequence") then
			colorButton.Visible = true
			enumArrow.Visible = false
			if propVal then
				gradient.Color = (typeName == "Color3" and ColorSequence.new(propVal)) or (typeName == "BrickColor" and ColorSequence.new(propVal.Color)) or propVal
			else
				gradient.Color = ColorSequence.new(Color3.new(1,1,1))
			end
			colorPreview.BorderColor3 = (typeName == "ColorSequence" and Color3.new(1,1,1) or Color3.new(0,0,0))
			offset = 22
			endOffset = 24 + (typeName == "ColorSequence" and 20 or 0)
		elseif typeData.Category == "Enum" then
			colorButton.Visible = false
			enumArrow.Visible = not prop.Tags.ReadOnly
			endOffset = 22
		elseif (gName == inputFullName and typeData.Category == "Class") or typeName == "NumberSequence" then
			colorButton.Visible = false
			enumArrow.Visible = false
			endOffset = 26
		else
			colorButton.Visible = false
			enumArrow.Visible = false
		end

		valueBox.Position = UDim2.new(0,offset,0,0)
		valueBox.Size = UDim2.new(1,-endOffset,1,0)

		-- Right button
		if inputFullName == gName and typeData.Category == "Class" then
			Main.MiscIcons:DisplayByKey(guiElems.RightButtonIcon, "Delete")
			guiElems.RightButtonIcon.Visible = true
			rightButton.Text = ""
			rightButton.Visible = true
		elseif typeName == "NumberSequence" or typeName == "ColorSequence" then
			guiElems.RightButtonIcon.Visible = false
			rightButton.Text = "..."
			rightButton.Visible = true
		else
			rightButton.Visible = false
		end

		-- Displays the correct ValueBox for the ValueType, and sets it to the prop value
		if typeName == "bool" or typeName == "PhysicalProperties" then
			valueBox.Visible = false
			checkbox.Visible = true
			soundPreview.Visible = false
			checkboxes[entryIndex].Disabled = tags.ReadOnly
			if typeName == "PhysicalProperties" and autoUpdateObjs[gName] then
				checkboxes[entryIndex]:SetState(propVal and true or false)
			else
				checkboxes[entryIndex]:SetState(propVal)
			end
		elseif typeName == "SoundPlayer" then
			valueBox.Visible = false
			checkbox.Visible = false
			soundPreview.Visible = true
			local playing = Properties.PreviewSound and Properties.PreviewSound.Playing
			Main.MiscIcons:DisplayByKey(soundPreview.ControlButton.Icon, playing and "Pause" or "Play")
		else
			valueBox.Visible = true
			checkbox.Visible = false
			soundPreview.Visible = false

			if propVal ~= nil then
				if typeName == "Color3" then
					valueBox.Text = "["..Lib.ColorToBytes(propVal).."]"
				elseif typeData.Category == "Enum" then
					valueBox.Text = propVal.Name
				elseif Properties.RoundableTypes[typeName] and Settings.Properties.NumberRounding then
					local rawStr = Properties.ValueToString(prop,propVal)
					valueBox.Text = rawStr:gsub("-?%d+%.%d+",function(num)
						return tostring(tonumber(("%."..Settings.Properties.NumberRounding.."f"):format(num)))
					end)
				else
					valueBox.Text = Properties.ValueToString(prop,propVal)
				end
			else
				valueBox.Text = ""
			end

			valueBox.TextColor3 = tags.ReadOnly and Settings.Theme.PlaceholderText or Settings.Theme.Text
		end
	end

	Properties.Refresh = function()
		local maxEntries = math.max(math.ceil((propsFrame.AbsoluteSize.Y) / 23),0)	
		local maxX = propsFrame.AbsoluteSize.X
		local valueWidth = math.max(Properties.MinInputWidth,maxX-Properties.ViewWidth)
		local inputPropVisible = false
		local isa = game.IsA
		local UDim2 = UDim2
		local stringSplit = string.split
		local scaleType = Settings.Properties.ScaleType

		-- Clear connections
		for i = 1,#propCons do
			propCons[i]:Disconnect()
		end
		table.clear(propCons)

		-- Hide full name viewer
		Properties.FullNameFrame.Visible = false
		Properties.FullNameFrameAttach.Disable()

		for i = 1,maxEntries do
			local entryData = propEntries[i]
			if not propEntries[i] then entryData = Properties.NewPropEntry(i) propEntries[i] = entryData end

			local entry = entryData.Gui
			local guiElems = entryData.GuiElems
			local nameFrame = guiElems.NameFrame
			local propNameLabel = guiElems.PropName
			local valueFrame = guiElems.ValueFrame
			local expand = guiElems.Expand
			local valueBox = guiElems.ValueBox
			local propNameBox = guiElems.PropName
			local rightButton = guiElems.RightButton
			local editAttributeButton = guiElems.EditAttributeButton
			local toggleAttributes = guiElems.ToggleAttributes

			local prop = viewList[i + Properties.Index]
			if prop then
				local entryXOffset = (scaleType == 0 and scrollH.Index or 0)
				entry.Visible = true
				entry.Position = UDim2.new(0,-entryXOffset,0,entry.Position.Y.Offset)
				entry.Size = UDim2.new(scaleType == 0 and 0 or 1, scaleType == 0 and Properties.ViewWidth + valueWidth or 0,0,22)

				if prop.SpecialRow then
					if prop.SpecialRow == "AddAttribute" then
						nameFrame.Visible = false
						valueFrame.Visible = false
						guiElems.RowButton.Visible = true
					end
				else
					-- Revert special row stuff
					nameFrame.Visible = true
					guiElems.RowButton.Visible = false

					local depth = Properties.EntryIndent*(prop.Depth or 1)
					local leftOffset = depth + Properties.EntryOffset
					nameFrame.Position = UDim2.new(0,leftOffset,0,0)
					propNameLabel.Size = UDim2.new(1,-2 - (scaleType == 0 and 0 or 6),1,0)

					local gName = (prop.CategoryName and "CAT_"..prop.CategoryName) or prop.Class.."."..prop.Name..(prop.SubName or "")

					if prop.CategoryName then
						entry.BackgroundColor3 = Settings.Theme.Main1
						valueFrame.Visible = false

						propNameBox.Text = prop.CategoryName
						propNameBox.Font = Enum.Font.SourceSansBold
						expand.Visible = true
						propNameBox.TextColor3 = Settings.Theme.Text
						nameFrame.BackgroundTransparency = 1
						nameFrame.Size = UDim2.new(1,0,1,0)
						editAttributeButton.Visible = false

						local showingAttrs = Settings.Properties.ShowAttributes
						toggleAttributes.Position = UDim2.new(1,-85-leftOffset,0,0)
						toggleAttributes.Text = (showingAttrs and "[Setting: ON]" or "[Setting: OFF]")
						toggleAttributes.TextColor3 = Settings.Theme.Text
						toggleAttributes.Visible = (prop.CategoryName == "Attributes")
					else
						local propName = prop.Name
						local typeData = prop.ValueType
						local typeName = typeData.Name
						local tags = prop.Tags
						local propObj = autoUpdateObjs[gName]

						local attributeOffset = (prop.IsAttribute and 20 or 0)
						editAttributeButton.Visible = (prop.IsAttribute and not prop.RootType)
						toggleAttributes.Visible = false

						-- Moving around the frames
						if scaleType == 0 then
							nameFrame.Size = UDim2.new(0,Properties.ViewWidth - leftOffset - 1,1,0)
							valueFrame.Position = UDim2.new(0,Properties.ViewWidth,0,0)
							valueFrame.Size = UDim2.new(0,valueWidth - attributeOffset,1,0)
						else
							nameFrame.Size = UDim2.new(0.5,-leftOffset - 1,1,0)
							valueFrame.Position = UDim2.new(0.5,0,0,0)
							valueFrame.Size = UDim2.new(0.5,-attributeOffset,1,0)
						end

						local nameArr = stringSplit(gName,".")
						propNameBox.Text = prop.DisplayName or nameArr[#nameArr]
						propNameBox.Font = Enum.Font.SourceSans
						entry.BackgroundColor3 = Settings.Theme.Main2
						valueFrame.Visible = true

						expand.Visible = typeData.Category == "DataType" and Properties.ExpandableTypes[typeName] or Properties.ExpandableProps[gName]
						propNameBox.TextColor3 = tags.ReadOnly and Settings.Theme.PlaceholderText or Settings.Theme.Text

						-- Display property value
						Properties.DisplayProp(prop,i)
						if propObj then
							if prop.IsAttribute then
								propCons[#propCons+1] = getAttributeChangedSignal(propObj,prop.AttributeName):Connect(function()
									Properties.DisplayProp(prop,i)
								end)
							else
								propCons[#propCons+1] = getPropChangedSignal(propObj,propName):Connect(function()
									Properties.DisplayProp(prop,i)
								end)
							end
						end

						-- Position and resize Input Box
						local beforeVisible = valueBox.Visible
						local inputFullName = inputProp and (inputProp.Class.."."..inputProp.Name..(inputProp.SubName or ""))
						if gName == inputFullName then
							nameFrame.BackgroundColor3 = Settings.Theme.ListSelection
							nameFrame.BackgroundTransparency = 0
							if typeData.Category == "Class" or typeData.Category == "Enum" or typeName == "BrickColor" then
								valueFrame.BackgroundColor3 = Settings.Theme.TextBox
								valueFrame.BackgroundTransparency = 0
								valueBox.Visible = true
							else
								inputPropVisible = true
								local scale = (scaleType == 0 and 0 or 0.5)
								local offset = (scaleType == 0 and Properties.ViewWidth-scrollH.Index or 0)
								local endOffset = 0

								if typeName == "Color3" or typeName == "ColorSequence" then
									offset = offset + 22
								end

								if typeName == "NumberSequence" or typeName == "ColorSequence" then
									endOffset = 20
								end

								inputBox.Position = UDim2.new(scale,offset,0,entry.Position.Y.Offset)
								inputBox.Size = UDim2.new(1-scale,-offset-endOffset-attributeOffset,0,22)
								inputBox.Visible = true
								valueBox.Visible = false
							end
						else
							nameFrame.BackgroundColor3 = Settings.Theme.Main1
							nameFrame.BackgroundTransparency = 1
							valueFrame.BackgroundColor3 = Settings.Theme.Main1
							valueFrame.BackgroundTransparency = 1
							valueBox.Visible = beforeVisible
						end
					end

					-- Expand
					if prop.CategoryName or Properties.ExpandableTypes[prop.ValueType and prop.ValueType.Name] or Properties.ExpandableProps[gName] then
						if Lib.CheckMouseInGui(expand) then
							Main.MiscIcons:DisplayByKey(expand.Icon, expanded[gName] and "Collapse_Over" or "Expand_Over")
						else
							Main.MiscIcons:DisplayByKey(expand.Icon, expanded[gName] and "Collapse" or "Expand")
						end
						expand.Visible = true
					else
						expand.Visible = false
					end
				end
				entry.Visible = true
			else
				entry.Visible = false
			end
		end

		if not inputPropVisible then
			inputBox.Visible = false
		end

		for i = maxEntries+1,#propEntries do
			propEntries[i].Gui:Destroy()
			propEntries[i] = nil
			checkboxes[i] = nil
		end
	end

	Properties.SetProp = function(prop,val,noupdate,prevAttribute)
		local sList = Explorer.Selection.List
		local propName = prop.Name
		local subName = prop.SubName
		local propClass = prop.Class
		local typeData = prop.ValueType
		local typeName = typeData.Name
		local attributeName = prop.AttributeName
		local rootTypeData = prop.RootType
		local rootTypeName = rootTypeData and rootTypeData.Name
		local fullName = prop.Class.."."..prop.Name..(prop.SubName or "")
		local Vector3 = Vector3

		for i = 1,#sList do
			local node = sList[i]
			local obj = node.Obj

			if isa(obj,propClass) then
				pcall(function()
					local setVal = val
					local root
					if prop.IsAttribute then
						root = getAttribute(obj,attributeName)
					else
						root = obj[propName]
					end

					if prevAttribute then
						if prevAttribute.ValueType.Name == typeName then
							setVal = getAttribute(obj,prevAttribute.AttributeName) or setVal
						end
						setAttribute(obj,prevAttribute.AttributeName,nil)
					end

					if rootTypeName then
						if rootTypeName == "Vector2" then
							setVal = Vector2.new((subName == ".X" and setVal) or root.X, (subName == ".Y" and setVal) or root.Y)
						elseif rootTypeName == "Vector3" then
							setVal = Vector3.new((subName == ".X" and setVal) or root.X, (subName == ".Y" and setVal) or root.Y, (subName == ".Z" and setVal) or root.Z)
						elseif rootTypeName == "UDim" then
							setVal = UDim.new((subName == ".Scale" and setVal) or root.Scale, (subName == ".Offset" and setVal) or root.Offset)
						elseif rootTypeName == "UDim2" then
							local rootX,rootY = root.X,root.Y
							local X_UDim = (subName == ".X" and setVal) or UDim.new((subName == ".X.Scale" and setVal) or rootX.Scale, (subName == ".X.Offset" and setVal) or rootX.Offset)
							local Y_UDim = (subName == ".Y" and setVal) or UDim.new((subName == ".Y.Scale" and setVal) or rootY.Scale, (subName == ".Y.Offset" and setVal) or rootY.Offset)
							setVal = UDim2.new(X_UDim,Y_UDim)
						elseif rootTypeName == "CFrame" then
							local rootPos,rootRight,rootUp,rootLook = root.Position,root.RightVector,root.UpVector,root.LookVector
							local pos = (subName == ".Position" and setVal) or Vector3.new((subName == ".Position.X" and setVal) or rootPos.X, (subName == ".Position.Y" and setVal) or rootPos.Y, (subName == ".Position.Z" and setVal) or rootPos.Z)
							local rightV = (subName == ".RightVector" and setVal) or Vector3.new((subName == ".RightVector.X" and setVal) or rootRight.X, (subName == ".RightVector.Y" and setVal) or rootRight.Y, (subName == ".RightVector.Z" and setVal) or rootRight.Z)
							local upV = (subName == ".UpVector" and setVal) or Vector3.new((subName == ".UpVector.X" and setVal) or rootUp.X, (subName == ".UpVector.Y" and setVal) or rootUp.Y, (subName == ".UpVector.Z" and setVal) or rootUp.Z)
							local lookV = (subName == ".LookVector" and setVal) or Vector3.new((subName == ".LookVector.X" and setVal) or rootLook.X, (subName == ".RightVector.Y" and setVal) or rootLook.Y, (subName == ".RightVector.Z" and setVal) or rootLook.Z)
							setVal = CFrame.fromMatrix(pos,rightV,upV,-lookV)
						elseif rootTypeName == "Rect" then
							local rootMin,rootMax = root.Min,root.Max
							local min = Vector2.new((subName == ".Min.X" and setVal) or rootMin.X, (subName == ".Min.Y" and setVal) or rootMin.Y)
							local max = Vector2.new((subName == ".Max.X" and setVal) or rootMax.X, (subName == ".Max.Y" and setVal) or rootMax.Y)
							setVal = Rect.new(min,max)
						elseif rootTypeName == "PhysicalProperties" then
							local rootProps = PhysicalProperties.new(obj.Material)
							local density = (subName == ".Density" and setVal) or (root and root.Density) or rootProps.Density
							local friction = (subName == ".Friction" and setVal) or (root and root.Friction) or rootProps.Friction
							local elasticity = (subName == ".Elasticity" and setVal) or (root and root.Elasticity) or rootProps.Elasticity
							local frictionWeight = (subName == ".FrictionWeight" and setVal) or (root and root.FrictionWeight) or rootProps.FrictionWeight
							local elasticityWeight = (subName == ".ElasticityWeight" and setVal) or (root and root.ElasticityWeight) or rootProps.ElasticityWeight
							setVal = PhysicalProperties.new(density,friction,elasticity,frictionWeight,elasticityWeight)
						elseif rootTypeName == "Ray" then
							local rootOrigin,rootDirection = root.Origin,root.Direction
							local origin = (subName == ".Origin" and setVal) or Vector3.new((subName == ".Origin.X" and setVal) or rootOrigin.X, (subName == ".Origin.Y" and setVal) or rootOrigin.Y, (subName == ".Origin.Z" and setVal) or rootOrigin.Z)
							local direction = (subName == ".Direction" and setVal) or Vector3.new((subName == ".Direction.X" and setVal) or rootDirection.X, (subName == ".Direction.Y" and setVal) or rootDirection.Y, (subName == ".Direction.Z" and setVal) or rootDirection.Z)
							setVal = Ray.new(origin,direction)
						elseif rootTypeName == "Faces" then
							local faces = {}
							local faceList = {"Back","Bottom","Front","Left","Right","Top"}
							for _,face in pairs(faceList) do
								local val
								if subName == "."..face then
									val = setVal
								else
									val = root[face]
								end
								if val then faces[#faces+1] = Enum.NormalId[face] end
							end
							setVal = Faces.new(unpack(faces))
						elseif rootTypeName == "Axes" then
							local axes = {}
							local axesList = {"X","Y","Z"}
							for _,axe in pairs(axesList) do
								local val
								if subName == "."..axe then
									val = setVal
								else
									val = root[axe]
								end
								if val then axes[#axes+1] = Enum.Axis[axe] end
							end
							setVal = Axes.new(unpack(axes))
						elseif rootTypeName == "NumberRange" then
							setVal = NumberRange.new(subName == ".Min" and setVal or root.Min, subName == ".Max" and setVal or root.Max)
						end
					end

					if typeName == "PhysicalProperties" and setVal then
						setVal = root or PhysicalProperties.new(obj.Material)
					end

					if prop.IsAttribute then
						setAttribute(obj,attributeName,setVal)
					else
						obj[propName] = setVal
					end
				end)
			end
		end

		if not noupdate then
			Properties.ComputeConflicts(prop)
		end
	end

	Properties.InitInputBox = function()
		inputBox = create({
			{1,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderSizePixel=0,Name="InputBox",Size=UDim2.new(0,200,0,22),Visible=false,ZIndex=2,}},
			{2,"TextBox",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BackgroundTransparency=1,BorderColor3=Color3.new(0.062745101749897,0.51764708757401,1),BorderSizePixel=0,ClearTextOnFocus=false,Font=3,Parent={1},PlaceholderColor3=Color3.new(0.69803923368454,0.69803923368454,0.69803923368454),Position=UDim2.new(0,3,0,0),Size=UDim2.new(1,-6,1,0),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,ZIndex=2,}},
		})
		inputTextBox = inputBox.TextBox
		inputBox.BackgroundColor3 = Settings.Theme.TextBox
		inputBox.Parent = Properties.Window.GuiElems.Content.List

		inputTextBox.FocusLost:Connect(function()
			if not inputProp then return end

			local prop = inputProp
			inputProp = nil
			local val = Properties.StringToValue(prop,inputTextBox.Text)
			if val then Properties.SetProp(prop,val) else Properties.Refresh() end
		end)

		inputTextBox.Focused:Connect(function()
			inputTextBox.SelectionStart = 1
			inputTextBox.CursorPosition = #inputTextBox.Text + 1
		end)

		Lib.ViewportTextBox.convert(inputTextBox)
	end

	Properties.SetInputProp = function(prop,entryIndex,special)
		local typeData = prop.ValueType
		local typeName = typeData.Name
		local fullName = prop.Class.."."..prop.Name..(prop.SubName or "")
		local propObj = autoUpdateObjs[fullName]
		local propVal = Properties.GetPropVal(prop,propObj)

		if prop.Tags.ReadOnly then return end

		inputProp = prop
		if special then
			if special == "color" then
				if typeName == "Color3" then
					inputTextBox.Text = propVal and Properties.ValueToString(prop,propVal) or ""
					Properties.DisplayColorEditor(prop,propVal)
				elseif typeName == "BrickColor" then
					Properties.DisplayBrickColorEditor(prop,entryIndex,propVal)
				elseif typeName == "ColorSequence" then
					inputTextBox.Text = propVal and Properties.ValueToString(prop,propVal) or ""
					Properties.DisplayColorSequenceEditor(prop,propVal)
				end
			elseif special == "right" then
				if typeName == "NumberSequence" then
					inputTextBox.Text = propVal and Properties.ValueToString(prop,propVal) or ""
					Properties.DisplayNumberSequenceEditor(prop,propVal)
				elseif typeName == "ColorSequence" then
					inputTextBox.Text = propVal and Properties.ValueToString(prop,propVal) or ""
					Properties.DisplayColorSequenceEditor(prop,propVal)
				end
			end
		else
			if Properties.IsTextEditable(prop) then
				inputTextBox.Text = propVal and Properties.ValueToString(prop,propVal) or ""
				inputTextBox:CaptureFocus()
			elseif typeData.Category == "Enum" then
				Properties.DisplayEnumDropdown(entryIndex)
			elseif typeName == "BrickColor" then
				Properties.DisplayBrickColorEditor(prop,entryIndex,propVal)
			end
		end
		Properties.Refresh()
	end

	Properties.InitSearch = function()
		local searchBox = Properties.GuiElems.ToolBar.SearchFrame.SearchBox

		Lib.ViewportTextBox.convert(searchBox)

		searchBox:GetPropertyChangedSignal("Text"):Connect(function()
			Properties.SearchText = searchBox.Text
			Properties.Update()
			Properties.Refresh()
		end)
	end

	Properties.InitEntryStuff = function()
		Properties.EntryTemplate = create({
			{1,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderColor3=Color3.new(0.1294117718935,0.1294117718935,0.1294117718935),Font=3,Name="Entry",Position=UDim2.new(0,1,0,1),Size=UDim2.new(0,250,0,22),Text="",TextSize=14,}},
			{2,"Frame",{BackgroundColor3=Color3.new(0.04313725605607,0.35294118523598,0.68627452850342),BackgroundTransparency=1,BorderColor3=Color3.new(0.33725491166115,0.49019610881805,0.73725491762161),BorderSizePixel=0,Name="NameFrame",Parent={1},Position=UDim2.new(0,20,0,0),Size=UDim2.new(1,-40,1,0),}},
			{3,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="PropName",Parent={2},Position=UDim2.new(0,2,0,0),Size=UDim2.new(1,-2,1,0),Text="Anchored",TextColor3=Color3.new(1,1,1),TextSize=14,TextTransparency=0.10000000149012,TextTruncate=1,TextXAlignment=0,}},
			{4,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ClipsDescendants=true,Font=3,Name="Expand",Parent={2},Position=UDim2.new(0,-20,0,1),Size=UDim2.new(0,20,0,20),Text="",TextSize=14,Visible=false,}},
			{5,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5642383285",ImageRectOffset=Vector2.new(144,16),ImageRectSize=Vector2.new(16,16),Name="Icon",Parent={4},Position=UDim2.new(0,2,0,2),ScaleType=4,Size=UDim2.new(0,16,0,16),}},
			{6,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=4,Name="ToggleAttributes",Parent={2},Position=UDim2.new(1,-85,0,0),Size=UDim2.new(0,85,0,22),Text="[SETTING: OFF]",TextColor3=Color3.new(1,1,1),TextSize=14,TextTransparency=0.10000000149012,Visible=false,}},
			{7,"Frame",{BackgroundColor3=Color3.new(0.04313725605607,0.35294118523598,0.68627452850342),BackgroundTransparency=1,BorderColor3=Color3.new(0.33725491166115,0.49019607901573,0.73725491762161),BorderSizePixel=0,Name="ValueFrame",Parent={1},Position=UDim2.new(1,-100,0,0),Size=UDim2.new(0,80,1,0),}},
			{8,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderColor3=Color3.new(0.33725491166115,0.49019610881805,0.73725491762161),BorderSizePixel=0,Name="Line",Parent={7},Position=UDim2.new(0,-1,0,0),Size=UDim2.new(0,1,1,0),}},
			{9,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="ColorButton",Parent={7},Size=UDim2.new(0,20,0,22),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,Visible=false,}},
			{10,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),Name="ColorPreview",Parent={9},Position=UDim2.new(0,5,0,6),Size=UDim2.new(0,10,0,10),}},
			{11,"UIGradient",{Parent={10},}},
			{12,"Frame",{BackgroundTransparency=1,Name="EnumArrow",Parent={7},Position=UDim2.new(1,-16,0,3),Size=UDim2.new(0,16,0,16),Visible=false,}},
			{13,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={12},Position=UDim2.new(0,8,0,9),Size=UDim2.new(0,1,0,1),}},
			{14,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={12},Position=UDim2.new(0,7,0,8),Size=UDim2.new(0,3,0,1),}},
			{15,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={12},Position=UDim2.new(0,6,0,7),Size=UDim2.new(0,5,0,1),}},
			{16,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="ValueBox",Parent={7},Position=UDim2.new(0,4,0,0),Size=UDim2.new(1,-8,1,0),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextTransparency=0.10000000149012,TextTruncate=1,TextXAlignment=0,}},
			{17,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="RightButton",Parent={7},Position=UDim2.new(1,-20,0,0),Size=UDim2.new(0,20,0,22),Text="...",TextColor3=Color3.new(1,1,1),TextSize=14,Visible=false,}},
			{18,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="SettingsButton",Parent={7},Position=UDim2.new(1,-20,0,0),Size=UDim2.new(0,20,0,22),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,Visible=false,}},
			{19,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="SoundPreview",Parent={7},Size=UDim2.new(1,0,1,0),Visible=false,}},
			{20,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="ControlButton",Parent={19},Size=UDim2.new(0,20,0,22),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
			{21,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5642383285",ImageRectOffset=Vector2.new(144,16),ImageRectSize=Vector2.new(16,16),Name="Icon",Parent={20},Position=UDim2.new(0,2,0,3),ScaleType=4,Size=UDim2.new(0,16,0,16),}},
			{22,"Frame",{BackgroundColor3=Color3.new(0.3137255012989,0.3137255012989,0.3137255012989),BorderSizePixel=0,Name="TimeLine",Parent={19},Position=UDim2.new(0,26,0.5,-1),Size=UDim2.new(1,-34,0,2),}},
			{23,"Frame",{BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.1294117718935,0.1294117718935,0.1294117718935),Name="Slider",Parent={22},Position=UDim2.new(0,-4,0,-8),Size=UDim2.new(0,8,0,18),}},
			{24,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="EditAttributeButton",Parent={1},Position=UDim2.new(1,-20,0,0),Size=UDim2.new(0,20,0,22),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
			{25,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5034718180",ImageTransparency=0.20000000298023,Name="Icon",Parent={24},Position=UDim2.new(0,2,0,3),Size=UDim2.new(0,16,0,16),}},
			{26,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderSizePixel=0,Font=3,Name="RowButton",Parent={1},Size=UDim2.new(1,0,1,0),Text="Add Attribute",TextColor3=Color3.new(1,1,1),TextSize=14,TextTransparency=0.10000000149012,Visible=false,}},
			--{27,"UIStroke",{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.fromRGB(33,33,33),Thickness=1,Parent={1}}}
		})

		local fullNameFrame = Lib.Frame.new()
		local label = Lib.Label.new()
		label.Parent = fullNameFrame.Gui
		label.Position = UDim2.new(0,2,0,0)
		label.Size = UDim2.new(1,-4,1,0)
		fullNameFrame.Visible = false
		fullNameFrame.Parent = window.Gui
		
		if Settings.Window.Transparency and Settings.Window.Transparency > 0 then
			Properties.EntryTemplate.BackgroundTransparency = 0.75
		end


		Properties.FullNameFrame = fullNameFrame
		Properties.FullNameFrameAttach = Lib.AttachTo(fullNameFrame)
	end

	Properties.Init = function() -- TODO: MAKE BETTER
		local guiItems = create({
			{1,"Folder",{Name="Items",}},
			{2,"Frame",{BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="ToolBar",Parent={1},Size=UDim2.new(1,0,0,22),}},
			{3,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.1176470592618,0.1176470592618,0.1176470592618),BorderSizePixel=0,Name="SearchFrame",Parent={2},Position=UDim2.new(0,3,0,1),Size=UDim2.new(1,-6,0,18),}},
			{4,"TextBox",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ClearTextOnFocus=false,Font=3,Name="SearchBox",Parent={3},PlaceholderColor3=Color3.new(0.39215689897537,0.39215689897537,0.39215689897537),PlaceholderText="Search properties",Position=UDim2.new(0,4,0,0),Size=UDim2.new(1,-24,0,18),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,}},
			{5,"UICorner",{CornerRadius=UDim.new(0,2),Parent={3},}},
			{6,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Reset",Parent={3},Position=UDim2.new(1,-17,0,1),Size=UDim2.new(0,16,0,16),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
			{7,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5034718129",ImageColor3=Color3.new(0.39215686917305,0.39215686917305,0.39215686917305),Parent={6},Size=UDim2.new(0,16,0,16),}},
			{8,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Refresh",Parent={2},Position=UDim2.new(1,-20,0,1),Size=UDim2.new(0,18,0,18),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,Visible=false,}},
			{9,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5642310344",Parent={8},Position=UDim2.new(0,3,0,3),Size=UDim2.new(0,12,0,12),}},
			{10,"Frame",{BackgroundColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel=0,Name="ScrollCorner",Parent={1},Position=UDim2.new(1,-16,1,-16),Size=UDim2.new(0,16,0,16),Visible=false,}},
			{11,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ClipsDescendants=true,Name="List",Parent={1},Position=UDim2.new(0,0,0,23),Size=UDim2.new(1,0,1,-23),}},
		})

		-- Vars
		categoryOrder =  API.CategoryOrder
		for category,_ in next,categoryOrder do
			if not Properties.CollapsedCategories[category] then
				expanded["CAT_"..category] = true
			end
		end
		expanded["Sound.SoundId"] = true

		-- Init window
		window = Lib.Window.new()
		Properties.Window = window
		window:SetTitle("Properties")

		toolBar = guiItems.ToolBar
		propsFrame = guiItems.List

		Properties.GuiElems.ToolBar = toolBar
		Properties.GuiElems.PropsFrame = propsFrame

		Properties.InitEntryStuff()

		-- Window events
		window.GuiElems.Main:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			if Properties.Window:IsContentVisible() then
				Properties.UpdateView()
				Properties.Refresh()
			end
		end)
		window.OnActivate:Connect(function()
			Properties.UpdateView()
			Properties.Update()
			Properties.Refresh()
		end)
		window.OnRestore:Connect(function()
			Properties.UpdateView()
			Properties.Update()
			Properties.Refresh()
		end)

		-- Init scrollbars
		scrollV = Lib.ScrollBar.new()		
		scrollV.WheelIncrement = 3
		scrollV.Gui.Position = UDim2.new(1,-16,0,23)
		scrollV:SetScrollFrame(propsFrame)
		scrollV.Scrolled:Connect(function()
			Properties.Index = scrollV.Index
			Properties.Refresh()
		end)

		scrollH = Lib.ScrollBar.new(true)
		scrollH.Increment = 5
		scrollH.WheelIncrement = 20
		scrollH.Gui.Position = UDim2.new(0,0,1,-16)
		scrollH.Scrolled:Connect(function()
			Properties.Refresh()
		end)

		-- Setup Gui
		window.GuiElems.Line.Position = UDim2.new(0,0,0,22)
		toolBar.Parent = window.GuiElems.Content
		propsFrame.Parent = window.GuiElems.Content
		guiItems.ScrollCorner.Parent = window.GuiElems.Content
		scrollV.Gui.Parent = window.GuiElems.Content
		scrollH.Gui.Parent = window.GuiElems.Content
		Properties.InitInputBox()
		Properties.InitSearch()
	end

	return Properties
end

-- TODO: Remove when open source
if gethsfuncs then
	_G.moduleData = {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
else
	return {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
end
end,
["SaveInstance"] = function()
--[[
	Save Instance App Module
	
	Revival of the old dex's Save Instance
]] 

-- Common Locals
local Main,Lib,Apps,Settings -- Main Containers
local Explorer, Properties, ScriptViewer, SaveInstance, Notebook -- Major Apps
local API,RMD,env,service,plr,create,createSimple -- Main Locals

local function initDeps(data)
	Main = data.Main
	Lib = data.Lib
	Apps = data.Apps
	Settings = data.Settings

	API = data.API
	RMD = data.RMD
	env = data.env
	service = data.service
	plr = data.plr
	create = data.create
	createSimple = data.createSimple
end

local function initAfterMain()
	Explorer = Apps.Explorer
	Properties = Apps.Properties
	ScriptViewer = Apps.ScriptViewer
	SaveInstance = Apps.SaveInstance
	Notebook = Apps.Notebook
end

local function main()
	local SaveInstance = {}
	local window, ListFrame
	local fileName = "Place_"..game.PlaceId.."_"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."_{TIMESTAMP}"
	local Saving = false
	
	local SaveInstanceArgs = {
		Decompile = true,
		DecompileTimeout = 10,
		DecompileIgnore = {"Chat", "CoreGui", "CorePackages"},
		NilInstances = false,
		RemovePlayerCharacters = true,
		SavePlayers = false,
		MaxThreads = 3,
		ShowStatus = true,
		IgnoreDefaultProps = true,
		IsolateStarterPlayer = true
	}
	
	local function AddCheckbox(title, default)
		local frame = Lib.Frame.new()
		frame.Gui.Parent = ListFrame
		frame.Gui.Transparency = 1
		frame.Gui.Size = UDim2.new(1,0,0,20)
		
		local listlayout = Instance.new("UIListLayout")
		listlayout.Parent = frame.Gui
		listlayout.FillDirection = Enum.FillDirection.Horizontal
		listlayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		listlayout.VerticalAlignment = Enum.VerticalAlignment.Center
		listlayout.Padding = UDim.new(0, 10)
		
		-- Checkbox
		local checkbox = Lib.Checkbox.new()
		
		checkbox.Gui.Parent = frame.Gui
		checkbox.Gui.Size = UDim2.new(0,15,0,15)
		
		-- Label
		local label = Lib.Label.new()
		
		label.Gui.Parent = frame.Gui
		label.Gui.Size = UDim2.new(1, 0,1, -15)
		label.Gui.Text = title
		label.TextTruncate = Enum.TextTruncate.AtEnd
		
		checkbox:SetState(default)
		
		return checkbox
	end
	
	local function AddTextbox(title, default, sizeX)
		default = tostring(default)
		local frame = Lib.Frame.new()
		frame.Gui.Parent = ListFrame
		frame.Gui.Transparency = 1
		frame.Gui.Size = UDim2.new(1,0,0,20)

		local listlayout = Instance.new("UIListLayout")
		listlayout.Parent = frame.Gui
		listlayout.FillDirection = Enum.FillDirection.Horizontal
		listlayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		listlayout.VerticalAlignment = Enum.VerticalAlignment.Center
		listlayout.Padding = UDim.new(0, 10)

		-- Textbox
		local textbox = Lib.ViewportTextBox.new()

		textbox.Gui.Parent = frame.Gui
		if sizeX and type(sizeX) == "number" then
			textbox.Gui.Size = UDim2.new(0,sizeX,0,15)
		else
			textbox.Gui.Size = UDim2.new(0,45,0,15)
		end
		
		textbox.Gui.AutomaticSize = Enum.AutomaticSize.X
		textbox.TextBox.AutomaticSize = Enum.AutomaticSize.X

		-- Label
		local label = Lib.Label.new()

		label.Gui.Parent = frame.Gui
		label.Gui.Size = UDim2.new(1, 0,1, -15)
		label.Gui.Text = title
		label.TextTruncate = Enum.TextTruncate.AtEnd

		textbox:SetText(default)

		return textbox
	end
	
	local function AddDropdown(title, items, default, sizeX)
		local frame = Lib.Frame.new()
		frame.Gui.Parent = ListFrame
		frame.Gui.Transparency = 1
		frame.Gui.Size = UDim2.new(1,0,0,20)

		local listlayout = Instance.new("UIListLayout")
		listlayout.Parent = frame.Gui
		listlayout.FillDirection = Enum.FillDirection.Horizontal
		listlayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		listlayout.VerticalAlignment = Enum.VerticalAlignment.Center
		listlayout.Padding = UDim.new(0, 10)

		-- Textbox
		local dropdown = Lib.ViewportTextBox.new()

		dropdown.Gui.Parent = frame.Gui
		if sizeX and type(sizeX) == "number" then
			dropdown.Gui.Size = UDim2.new(0,sizeX,0,15)
		else
			dropdown.Gui.Size = UDim2.new(0,65,0,15)
		end

		-- Label
		local label = Lib.Label.new()
		
		label.Gui.Parent = frame.Gui
		label.Gui.Size = UDim2.new(1, 0,1, -15)
		label.Gui.Text = title
		label.TextTruncate = Enum.TextTruncate.AtEnd

		dropdown:SetOptions(items)
		dropdown:SetSelected(default)

		return dropdown
	end
	
	SaveInstance.Init = function()
		window = Lib.Window.new()
		window:SetTitle("Save Instance")
		window:Resize(350,350)
		SaveInstance.Window = window
		
		-- ListFrame
		
		-- Fake ScrollBar dex, because its too advanced
		ListFrame = Instance.new("ScrollingFrame")
		ListFrame.Parent = window.GuiElems.Content
		ListFrame.Size = UDim2.new(1, 0,1, -40)
		ListFrame.Position = UDim2.new(0, 0, 0, 0)
		ListFrame.Transparency = 1
		ListFrame.CanvasSize = UDim2.new(0,0,0,0)
		ListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		ListFrame.ScrollBarThickness = 16
		ListFrame.BottomImage = ""
		ListFrame.TopImage = ""
		ListFrame.ScrollBarImageColor3 = Color3.fromRGB(70, 70, 70)
		ListFrame.ScrollBarImageTransparency = 0
		ListFrame.ZIndex = 2
		ListFrame.BorderSizePixel = 0
		
		local scrollbar = Lib.ScrollBar.new()
		scrollbar.Gui.Parent = window.GuiElems.Content
		scrollbar.Gui.Size = UDim2.new(1, 0,1, -40)
		scrollbar.Gui.Up.ZIndex = 3
		scrollbar.Gui.Down.ZIndex = 3
		
		ListFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
			if ListFrame.AbsoluteCanvasSize ~= ListFrame.AbsoluteWindowSize then
				scrollbar.Gui.Visible = true
			else
				scrollbar.Gui.Visible = false
			end
		end)
		
		local ListLayout = Instance.new("UIListLayout")
		ListLayout.Parent = ListFrame
		ListLayout.Padding = UDim.new(0, 5)
		
		local Padding = Instance.new("UIPadding")
		Padding.Parent = ListFrame
		Padding.PaddingBottom = UDim.new(0, 5)
		Padding.PaddingLeft = UDim.new(0, 10)
		Padding.PaddingRight = UDim.new(0, 10)
		Padding.PaddingTop = UDim.new(0, 5)
		
		-- Options
		
		local Decompile = AddCheckbox("Decompile Scripts (LocalScript and ModuleScript)", SaveInstanceArgs.Decompile)
		Decompile.OnInput:Connect(function()
			SaveInstanceArgs.Decompile = Decompile.Toggled
		end)
		
		local decompileTimeout = AddTextbox("Decompile Timeout (s)", SaveInstanceArgs.DecompileTimeout, 15)
		decompileTimeout.TextBox.FocusLost:Connect(function()
			SaveInstanceArgs.DecompileTimeout = tonumber(decompileTimeout.TextBox.Text)
		end)
		
		local decompileThread = AddTextbox("Decompiler Max Threads", "3", 15)
		decompileThread.TextBox.FocusLost:Connect(function()
			SaveInstanceArgs.MaxThreads = tonumber(decompileThread.TextBox.Text)
		end)
		
		local decompileIgnore = AddTextbox("Decompile Ignore", table.concat(SaveInstanceArgs.DecompileIgnore, ","), 50)
		decompileIgnore.TextBox.FocusLost:Connect(function()
			local inputText = decompileIgnore.TextBox.Text
			local rawList = string.split(inputText, ", ") or string.split(inputText, ",")
			local finalList = {}

			for _, text in ipairs(rawList) do
				local split = string.split(text, ",") or string.split(text, ", ")
				for _, textFound in ipairs(split) do
					table.insert(finalList, textFound)
				end
			end
			SaveInstanceArgs.DecompileIgnore = finalList
		end)

		
		local NilObj = AddCheckbox("Save Nil Instances", SaveInstanceArgs.NilInstances)
		NilObj.OnInput:Connect(function()
			SaveInstanceArgs.NilInstances = NilObj.Toggled
		end)

		local RemovePlayerChar = AddCheckbox("Remove Player Characters", SaveInstanceArgs.RemovePlayerCharacters)
		RemovePlayerChar.OnInput:Connect(function()
			SaveInstanceArgs.RemovePlayerCharacters = RemovePlayerChar.Toggled
		end)
		
		local SavePlayerObj = AddCheckbox("Save Player Instance", SaveInstanceArgs.SavePlayers)
		SavePlayerObj.OnInput:Connect(function()
			SaveInstanceArgs.SavePlayers = SavePlayerObj.Toggled
		end)
		
		local IsolateStarterPlr = AddCheckbox("Isolate StarterPlayer", SaveInstanceArgs.IsolateStarterPlayer)
		IsolateStarterPlr.OnInput:Connect(function()
			SaveInstanceArgs.IsolateStarterPlayer = IsolateStarterPlr.Toggled
		end)
		
		local IgnoreDefaultProps = AddCheckbox("Ignore Default Properties", SaveInstanceArgs.IgnoreDefaultProps)
		IgnoreDefaultProps.OnInput:Connect(function()
			SaveInstanceArgs.IgnoreDefaultProps = IgnoreDefaultProps.Toggled
		end)
		
		local ShowStat = AddCheckbox("Show Status", SaveInstanceArgs.ShowStatus)
		ShowStat.OnInput:Connect(function()
			SaveInstanceArgs.ShowStatus = ShowStat.Toggled
		end)
		
		
		-- Decompile buttons below
		local FilenameTextBox = Lib.ViewportTextBox.new()
		FilenameTextBox.Gui.Parent = window.GuiElems.Content
		FilenameTextBox.Size = UDim2.new(1,0, 0,20)
		FilenameTextBox.Position = UDim2.new(0,0, 1,-40)
		
		local textpadding = Instance.new("UIPadding")
		textpadding.Parent = FilenameTextBox.Gui
		textpadding.PaddingLeft = UDim.new(0, 5)
		textpadding.PaddingRight = UDim.new(0, 5)
		
		local BackgroundButton = Lib.Frame.new()
		BackgroundButton.Gui.Parent = window.GuiElems.Content
		BackgroundButton.Size = UDim2.new(1,0, 0,20)
		BackgroundButton.Position = UDim2.new(0,0, 1,-20)
		
		local LabelButton = Lib.Label.new()
		LabelButton.Gui.Parent = window.GuiElems.Content
		LabelButton.Size = UDim2.new(1,0, 0,20)
		LabelButton.Position = UDim2.new(0,0, 1,-20)
		LabelButton.Gui.Text = "Save"
		LabelButton.Gui.TextXAlignment = Enum.TextXAlignment.Center
		
		local Button = Instance.new("TextButton")
		Button.Parent = BackgroundButton.Gui
		Button.Size = UDim2.new(1,0, 1,0)
		Button.Position = UDim2.new(0,0, 0,0)
		Button.Transparency = 1
		
		FilenameTextBox.TextBox.Text = fileName
		Button.MouseButton1Click:Connect(function()
			local fileName = FilenameTextBox.TextBox.Text:gsub("{TIMESTAMP}", os.date("%d-%m-%Y_%H-%M-%S"))
			window:SetTitle("Save Instance - Saving")
			local s, result = pcall(env.saveinstance, game, fileName, SaveInstanceArgs)
			if s then
				window:SetTitle("Save Instance - Saved")
			else
				window:SetTitle("Save Instance - Error")
				task.spawn(error("Failed to save the game: "..result))
			end
			task.wait(5)
			window:SetTitle("Save Instance")
			---env.saveinstance(game, fileName, SaveInstanceArgs)
		end)
	end

	return SaveInstance
end

-- TODO: Remove when open source
if gethsfuncs then
	_G.moduleData = {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
else
	return {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
end
end,
["ScriptViewer"] = function()
--[[
	Script Viewer App Module
	
	A script viewer that is basically a notepad
]]

-- Common Locals
local Main,Lib,Apps,Settings -- Main Containers
local Explorer, Properties, ScriptViewer, Notebook -- Major Apps
local API,RMD,env,service,plr,create,createSimple -- Main Locals

local function initDeps(data)
	Main = data.Main
	Lib = data.Lib
	Apps = data.Apps
	Settings = data.Settings

	API = data.API
	RMD = data.RMD
	env = data.env
	service = data.service
	plr = data.plr
	create = data.create
	createSimple = data.createSimple
end

local function initAfterMain()
	Explorer = Apps.Explorer
	Properties = Apps.Properties
	ScriptViewer = Apps.ScriptViewer
	Notebook = Apps.Notebook
end

local executorName = "Unknown"
local executorVersion = "???"
if identifyexecutor then
	local name,ver = identifyexecutor()
	executorName = name
	executorVersion = ver
elseif game:GetService("RunService"):IsStudio() then
	executorName = "Studio"
	executorVersion = version()
end

local function getPath(obj)
	if obj.Parent == nil then
		return "Nil parented"
	else
		return Explorer.GetInstancePath(obj)
	end
end

local function main()
	local ScriptViewer = {}
	local window, codeFrame
	local PreviousScr = nil

	ScriptViewer.ViewScript = function(scr)
		local oldtick = tick()
		local s,source = pcall(env.decompile or function() end,scr)
		
		if not s or not source then
			PreviousScr = nil
			source = "-- Unable to view source.\n"
			source = source .. "-- Script Path: "..getPath(scr).."\n"
			if scr:IsA("Script") and scr.RunContext == Enum.RunContext.Legacy and not scr:IsA("LocalScript") then
				source = source .. "-- Reason: The script is likely to be running on server, or your executor does not support decompiler.\n"
			else
				source = source .. "-- Reason: Your executor does not support decompiler.\n"
			end
			source = source .. "-- Executor: "..executorName.." ("..executorVersion..")"
		else
			PreviousScr = scr
			local decompiled = source

			source = "-- Script Path: "..getPath(scr).."\n"
			source = source .. "-- Took "..tostring(math.floor( (tick() - oldtick) * 100) / 100).."s to decompile.\n"
			source = source .. "-- Executor: "..executorName.." ("..executorVersion..")\n\n"
			
			
			source = source .. "-- // local script = "..getPath(scr).."\n"
			source = source .. decompiled
			
			oldtick = nil
			decompiled = nil
		end
		
		codeFrame:SetText(source)
		window:Show()
	end
	
	ScriptViewer.DumpFunctions = function(scr)
		-- thanks King.Kevin#6025 you'll obviously be credited (no discord tag since that can easily be impersonated)
		local getgc = getgc or get_gc_objects
		local getupvalues = (debug and debug.getupvalues) or getupvalues or getupvals
		local getconstants = (debug and debug.getconstants) or getconstants or getconsts
		local getinfo = (debug and (debug.getinfo or debug.info)) or getinfo
		local original = ("\n-- // Function Dumper made by King.Kevin\n-- // Script Path: %s\n\n--[["):format(getPath(scr))
		local dump = original
		local functions, function_count, data_base = {}, 0, {}
		function functions:add_to_dump(str, indentation, new_line)
			local new_line = new_line or true
			dump = dump .. ("%s%s%s"):format(string.rep("		", indentation), tostring(str), new_line and "\n" or "")
		end
		function functions:get_function_name(func)
			local n = getinfo(func).name
			return n ~= "" and n or "Unknown Name"
		end
		function functions:dump_table(input, indent, index)
			local indent = indent < 0 and 0 or indent
			functions:add_to_dump(("%s [%s] %s"):format(tostring(index), tostring(typeof(input)), tostring(input)), indent - 1)
			local count = 0
			for index, value in pairs(input) do
				count = count + 1
				if type(value) == "function" then
					functions:add_to_dump(("%d [function] = %s"):format(count, functions:get_function_name(value)), indent)
				elseif type(value) == "table" then
					if not data_base[value] then
						data_base[value] = true
						functions:add_to_dump(("%d [table]:"):format(count), indent)
						functions:dump_table(value, indent + 1, index)
					else
						functions:add_to_dump(("%d [table] (Recursive table detected)"):format(count), indent)
					end
				else
					functions:add_to_dump(("%d [%s] = %s"):format(count, tostring(typeof(value)), tostring(value)), indent)
				end
			end
		end
		function functions:dump_function(input, indent)
			functions:add_to_dump(("\nFunction Dump: %s"):format(functions:get_function_name(input)), indent)
			functions:add_to_dump(("\nFunction Upvalues: %s"):format(functions:get_function_name(input)), indent)
			for index, upvalue in pairs(getupvalues(input)) do
				if type(upvalue) == "function" then
					functions:add_to_dump(("%d [function] = %s"):format(index, functions:get_function_name(upvalue)), indent + 1)
				elseif type(upvalue) == "table" then
					if not data_base[upvalue] then
						data_base[upvalue] = true
						functions:add_to_dump(("%d [table]:"):format(index), indent + 1)
						functions:dump_table(upvalue, indent + 2, index)
					else
						functions:add_to_dump(("%d [table] (Recursive table detected)"):format(index), indent + 1)
					end
				else
					functions:add_to_dump(("%d [%s] = %s"):format(index, tostring(typeof(upvalue)), tostring(upvalue)), indent + 1)
				end
			end
			functions:add_to_dump(("\nFunction Constants: %s"):format(functions:get_function_name(input)), indent)
			for index, constant in pairs(getconstants(input)) do
				if type(constant) == "function" then
					functions:add_to_dump(("%d [function] = %s"):format(index, functions:get_function_name(constant)), indent + 1)
				elseif type(constant) == "table" then
					if not data_base[constant] then
						data_base[constant] = true
						functions:add_to_dump(("%d [table]:"):format(index), indent + 1)
						functions:dump_table(constant, indent + 2, index)
					else
						functions:add_to_dump(("%d [table] (Recursive table detected)"):format(index), indent + 1)
					end
				else
					functions:add_to_dump(("%d [%s] = %s"):format(index, tostring(typeof(constant)), tostring(constant)), indent + 1)
				end
			end
		end
		for _, _function in pairs(env.getgc()) do
			if typeof(_function) == "function" and getfenv(_function).script and getfenv(_function).script == scr then
				functions:dump_function(_function, 0)
				functions:add_to_dump("\n" .. ("="):rep(100), 0, false)
			end
		end
		local source = codeFrame:GetText()

		if dump ~= original then source = source .. dump .. "]]" end
		codeFrame:SetText(source)
	end

	ScriptViewer.Init = function()
		window = Lib.Window.new()
		window:SetTitle("Notepad")
		window:Resize(500,400)
		ScriptViewer.Window = window

		codeFrame = Lib.CodeFrame.new()
		codeFrame.Frame.Position = UDim2.new(0,0,0,20)
		codeFrame.Frame.Size = UDim2.new(1,0,1,-40)
		codeFrame.Frame.Parent = window.GuiElems.Content
		
		local copy = Instance.new("TextButton",window.GuiElems.Content)
		copy.BackgroundTransparency = 1
		copy.Size = UDim2.new(0.33,0,0,20)
		copy.Position = UDim2.new(0,0,0,0)
		copy.Text = "Copy to Clipboard"
		copy.TextColor3 = Color3.new(1,1,1)

		copy.MouseButton1Click:Connect(function()
			local source = codeFrame:GetText()
			setclipboard(source)
		end)

		local save = Instance.new("TextButton",window.GuiElems.Content)
		save.BackgroundTransparency = 1
		save.Size = UDim2.new(0.33,0,0,20)
		save.Position = UDim2.new(0.33,0,0,0)
		save.Text = "Save to File"
		save.TextColor3 = Color3.new(1,1,1)

		save.MouseButton1Click:Connect(function()
			local source = codeFrame:GetText()
			local filename = "Place_"..game.PlaceId.."_Script_"..os.time()..".txt"

			writefile(filename,source)
			--[[if movefileas then -- TODO: USE ENV
				movefileas(filename,".txt")
			end]]
		end)
		
		local dumpbtn = Instance.new("TextButton",window.GuiElems.Content)
		dumpbtn.BackgroundTransparency = 1
		dumpbtn.Position = UDim2.new(0.7,0,0,0)
		dumpbtn.Size = UDim2.new(0.3,0,0,20)
		dumpbtn.Text = "Dump Functions"
		dumpbtn.TextColor3 = Color3.new(1,1,1)

		dumpbtn.MouseButton1Click:Connect(function()
			if PreviousScr ~= nil then
				pcall(ScriptViewer.DumpFunctions, PreviousScr)
			end
		end)
		
		-- Buttons below the editor
		
		
		local execute = Instance.new("TextButton",window.GuiElems.Content)
		execute.BackgroundTransparency = 1
		execute.Size = UDim2.new(0.5,0,0,20)
		execute.Position = UDim2.new(0,0,1,-20)
		execute.Text = "Execute"
		execute.TextColor3 = Color3.new(1,1,1)

		execute.MouseButton1Click:Connect(function()
			local source = codeFrame:GetText()
			loadstring(source)()
		end)

		local clear = Instance.new("TextButton",window.GuiElems.Content)
		clear.BackgroundTransparency = 1
		clear.Size = UDim2.new(0.5,0,0,20)
		clear.Position = UDim2.new(0.5,0,1,-20)
		clear.Text = "Clear"
		clear.TextColor3 = Color3.new(1,1,1)

		clear.MouseButton1Click:Connect(function()
			codeFrame:SetText("")
		end)
	end

	return ScriptViewer
end

-- TODO: Remove when open source
if gethsfuncs then
	_G.moduleData = {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
else
	return {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
end
end,
}
--[[
	Dex++
	Beta 1.4.0 Version
	
	Created by Moon
	Edited by Chillz
	
	Dex++ is a revival of Moon's Dex, made to fulfill Moon's Dex prophecy.
]]

local oldgame = oldgame or game

local cloneref = cloneref or function(...) return ... end
-- Main vars
local Main, Explorer, Properties, ScriptViewer, Console, SaveInstance, ModelViewer, DefaultSettings, Notebook, Serializer, Lib
local API, RMD

-- Default Settings
DefaultSettings = (function()
	local rgb = Color3.fromRGB
	return {
		Explorer = {
			_Recurse = true,
			Sorting = true,
			TeleportToOffset = Vector3.new(0,0,0),
			ClickToRename = true,
			AutoUpdateSearch = true,
			AutoUpdateMode = 0, -- 0 Default, 1 no tree update, 2 no descendant events, 3 frozen
			PartSelectionBox = true,
			GuiSelectionBox = true,
			CopyPathUseGetChildren = true
		},
		Properties = {
			_Recurse = true,
			MaxConflictCheck = 50,
			ShowDeprecated = false,
			ShowHidden = true,
			ClearOnFocus = false,
			LoadstringInput = true,
			NumberRounding = 3,
			ShowAttributes = false,
			MaxAttributes = 50,
			ScaleType = 1 -- 0 Full Name Shown, 1 Equal Halves
		},
		Theme = {
			_Recurse = true,
			Main1 = rgb(52,52,52),
			Main2 = rgb(45,45,45),
			Outline1 = rgb(33,33,33), -- Mainly frames
			Outline2 = rgb(55,55,55), -- Mainly button
			Outline3 = rgb(30,30,30), -- Mainly textbox
			TextBox = rgb(38,38,38),
			Menu = rgb(32,32,32),
			ListSelection = rgb(11,90,175),
			Button = rgb(60,60,60),
			ButtonHover = rgb(68,68,68),
			ButtonPress = rgb(40,40,40),
			Highlight = rgb(75,75,75),
			Text = rgb(255,255,255),
			PlaceholderText = rgb(100,100,100),
			Important = rgb(255,0,0),
			ExplorerIconMap = "",
			MiscIconMap = "",
			Syntax = {
				Text = rgb(204,204,204),
				Background = rgb(36,36,36),
				Selection = rgb(255,255,255),
				SelectionBack = rgb(11,90,175),
				Operator = rgb(204,204,204),
				Number = rgb(255,198,0),
				String = rgb(173,241,149),
				Comment = rgb(102,102,102),
				Keyword = rgb(248,109,124),
				Error = rgb(255,0,0),
				FindBackground = rgb(141,118,0),
				MatchingWord = rgb(85,85,85),
				BuiltIn = rgb(132,214,247),
				CurrentLine = rgb(45,50,65),
				LocalMethod = rgb(253,251,172),
				LocalProperty = rgb(97,161,241),
				Nil = rgb(255,198,0),
				Bool = rgb(255,198,0),
				Function = rgb(248,109,124),
				Local = rgb(248,109,124),
				Self = rgb(248,109,124),
				FunctionName = rgb(253,251,172),
				Bracket = rgb(204,204,204)
			},
		},
		Window = {
			TitleOnMiddle = true,
			Transparency = 0.1
		}
	}
end)()

-- Vars
local Settings = {}
local Apps = {}
local env = {}

local service = setmetatable({},{__index = function(self,name)
	local serv = cloneref(game:GetService(name))
	self[name] = serv
	return serv
end})
local plr = service.Players.LocalPlayer or service.Players.PlayerAdded:wait()

local create = function(data)
	local insts = {}
	for i,v in pairs(data) do insts[v[1]] = Instance.new(v[2]) end

	for _,v in pairs(data) do
		for prop,val in pairs(v[3]) do
			if type(val) == "table" then
				insts[v[1]][prop] = insts[val[1]]
			else
				insts[v[1]][prop] = val
			end
		end
	end

	return insts[1]
end

local createSimple = function(class,props)
	local inst = Instance.new(class)
	for i,v in next,props do
		inst[i] = v
	end
	return inst
end

Main = (function()
	local Main = {}
	
	--[[
	-- Original Backup
	
	Main.ModuleList = {"Explorer","Properties","ScriptViewer"}
	Main.Elevated = false
	Main.MissingEnv = {}
	Main.Version = "Beta 1.0.0"
	Main.Mouse = plr:GetMouse()
	Main.AppControls = {}
	Main.Apps = Apps
	Main.MenuApps = {}
	Main.GitRepoName = "LorekeeperZinnia/Dex"
	]]

	Main.ModuleList = {"Explorer","Properties","ScriptViewer","Console","SaveInstance","ModelViewer"}
	Main.Elevated = false
	Main.AllowDraggableOnMobile = true
	Main.MissingEnv = {}
	Main.Version = "Beta 1.4.0"
	Main.Mouse = plr:GetMouse()
	Main.AppControls = {}
	Main.Apps = Apps
	Main.MenuApps = {}
	Main.GitRepoName = "AZYsGithub/DexPlusPlus"

	Main.DisplayOrders = {
		SideWindow = 8,
		Window = 10,
		Menu = 100000,
		Core = 101000
	}

	Main.GetInitDeps = function()
		return {
			Main = Main,
			Lib = Lib,
			Apps = Apps,
			Settings = Settings,

			API = API,
			RMD = RMD,
			env = env,
			service = service,
			plr = plr,
			create = create,
			createSimple = createSimple
		}
	end

	Main.Error = function(str)
		if rconsoleprint then
			rconsoleprint("DEX ERROR: "..tostring(str).."\n")
			wait(9e9)
		else
			error(str)
		end
	end

	Main.LoadModule = function(name)
		if Main.Elevated then -- If you don't have filesystem api then ur outta luck tbh
			local control

			if EmbeddedModules then -- Offline Modules
				control = EmbeddedModules[name]()

				-- TODO: Remove when open source
				if gethsfuncs then
					control = _G.moduleData
				end

				if not control then Main.Error("Missing Embedded Module: "..name) end
			elseif _G.DebugLoadModel then -- Load Debug Model File
				local model = Main.DebugModel
				if not model then model = game:GetObjects(getsynasset("AfterModules.rbxm"))[1] end

				control = loadstring(model.Modules[name].Source)()
				print("Locally Loaded Module",name,control)
			else
				-- Get hash data
				local hashs = Main.ModuleHashData
				if not hashs then
					local s,hashDataStr = pcall(game.HttpGet, game, "https://api.github.com/repos/"..Main.GitRepoName.."/ModuleHashs.dat")
					if not s then Main.Error("Failed to get module hashs") end

					local s,hashData = pcall(service.HttpService.JSONDecode,service.HttpService,hashDataStr)
					if not s then Main.Error("Failed to decode module hash JSON") end

					hashs = hashData
					Main.ModuleHashData = hashs
				end

				-- Check if local copy exists with matching hashs
				local hashfunc = (syn and syn.crypt.hash) or function() return "" end
				local filePath = "dex/ModuleCache/"..name..".lua"
				local s,moduleStr = pcall(env.readfile,filePath)

				if s and hashfunc(moduleStr) == hashs[name] then
					control = loadstring(moduleStr)()
				else
					-- Download and cache
					local s,moduleStr = pcall(game.HttpGet, game, "https://api.github.com/repos/"..Main.GitRepoName.."/Modules/"..name..".lua")
					if not s then Main.Error("Failed to get external module data of "..name) end

					env.writefile(filePath,moduleStr)
					control = loadstring(moduleStr)()
				end
			end

			Main.AppControls[name] = control
			control.InitDeps(Main.GetInitDeps())

			local moduleData = control.Main()
			Apps[name] = moduleData
			return moduleData
		else
			local module = script:WaitForChild("Modules"):WaitForChild(name,2)
			if not module then Main.Error("CANNOT FIND MODULE "..name) end

			local control = require(module)
			Main.AppControls[name] = control
			control.InitDeps(Main.GetInitDeps())

			local moduleData = control.Main()
			Apps[name] = moduleData
			return moduleData
		end
	end

	Main.LoadModules = function()
		for i,v in pairs(Main.ModuleList) do
			local s,e = pcall(Main.LoadModule,v)
			if not s then
				Main.Error("FAILED LOADING " .. v .. " CAUSE " .. e)
			end
		end

		-- Init Major Apps and define them in modules
		Explorer = Apps.Explorer
		Properties = Apps.Properties
		ScriptViewer = Apps.ScriptViewer
		Console = Apps.Console
		SaveInstance = Apps.SaveInstance
		ModelViewer = Apps.ModelViewer
		Notebook = Apps.Notebook
		local appTable = {
			Explorer = Explorer,
			Properties = Properties,
			ScriptViewer = ScriptViewer,
			Console = Console,
			SaveInstance = SaveInstance,
			ModelViewer = ModelViewer,
			Notebook = Notebook
		}

		Main.AppControls.Lib.InitAfterMain(appTable)
		for i,v in pairs(Main.ModuleList) do
			local control = Main.AppControls[v]
			if control then
				control.InitAfterMain(appTable)
			end
		end
	end

	Main.InitEnv = function()
		setmetatable(env,{__newindex = function(self,name,func)
			if not func then Main.MissingEnv[#Main.MissingEnv+1] = name return end
			rawset(self,name,func)
		end})

		env.isonmobile = game:GetService("UserInputService").TouchEnabled

		-- file
		env.readfile = readfile
		env.writefile = writefile
		env.appendfile = appendfile
		env.makefolder = makefolder
		env.listfiles = listfiles
		env.loadfile = loadfile
		env.saveinstance = saveinstance or (function()
			warn("No built-in saveinstance exists, using SynSaveInstance and wrapper...")
			if game:GetService("RunService"):IsStudio() then return end
			local Params = {
				RepoURL = "https://raw.githubusercontent.com/luau/SynSaveInstance/main/",
				SSI = "saveinstance",
			}
			local synsaveinstance = loadstring(game:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)()
		
			local function wrappedsaveinstance(obj, filepath, options)
				options["FilePath"] = filepath
				synsaveinstance(options)
			end
			
			getgenv().saveinstance = wrappedsaveinstance
			env.saveinstance = wrappedsaveinstance
			env.wrappedsaveinstance = wrappedsaveinstance
			return wrappedsaveinstance
		end)()

		-- debug
		env.getupvalues = debug.getupvalues or getupvals
		env.getconstants = debug.getconstants or getconsts
		env.islclosure = islclosure or is_l_closure
		env.checkcaller = checkcaller
		env.getreg = getreg
		env.getgc = getgc

		-- other
		env.setfflag = setfflag
		env.decompile = decompile
		env.protectgui = protect_gui or (syn and syn.protect_gui)
		env.gethui = gethui
		env.setclipboard = setclipboard
		env.getnilinstances = getnilinstances or get_nil_instances
		env.getloadedmodules = getloadedmodules
		
		env.isViableDecompileScript = function(obj)
			if obj:IsA("ModuleScript") then
				return true
			elseif obj:IsA("LocalScript") and (obj.RunContext == Enum.RunContext.Client or obj.RunContext == Enum.RunContext.Legacy) then
				return true
			elseif obj:IsA("Script") and obj.RunContext == Enum.RunContext.Client then
				return true
			end
			return false
		end
		
		env.request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
		
		env.decompile = decompile or (function()
			-- by lovrewe
			warn("No built-in decompiler exists, using Konstant decompiler...")
			--assert(getscriptbytecode, "Exploit not supported.")

			if not env.getscriptbytecode then warn('Konstant decompiler is not supported. "getscriptbytecode" is missing.') return end

			local API = "http://api.plusgiant5.com"

			local last_call = 0

			local request = env.request

			local function call(konstantType, scriptPath)
				local success, bytecode = pcall(getscriptbytecode, scriptPath)

				if (not success) then
					return `-- Failed to get script bytecode, error:\n\n--[[\n{bytecode}\n--]]`
				end

				local time_elapsed = os.clock() - last_call
				if time_elapsed <= .5 then
					task.wait(.5 - time_elapsed)
				end

				local httpResult = request({
					Url = API .. konstantType,
					Body = bytecode,
					Method = "POST",
					Headers = {
						["Content-Type"] = "text/plain"
					}
				})

				last_call = os.clock()

				if (httpResult.StatusCode ~= 200) then
					return `-- Error occurred while requesting Konstant API, error:\n\n--[[\n{httpResult.Body}\n--]]`
				else
					return httpResult.Body
				end
			end

			local function decompile(scriptPath)
				return call("/konstant/decompile", scriptPath)
			end

			local function disassemble(scriptPath)
				return call("/konstant/disassemble", scriptPath)
			end

			getgenv().decompile = decompile
			getgenv().disassemble = disassemble
			
			env.decompile = decompile
			return decompile
		end)()

		if identifyexecutor then
			Main.Executor = identifyexecutor()
		end
		
		

		Main.GuiHolder = Main.Elevated and service.CoreGui or plr:FindFirstChildOfClass("PlayerGui")

		setmetatable(env,nil)
	end

	--[[
	Main.IncompatibleTest = function()
		local function incompatibleMessage(reason)
			local msg = Instance.new("ScreenGui")
			local t = Instance.new("TextLabel",msg)
			t.BackgroundColor3 = Color3.fromRGB(50,50,50)
			t.Position = UDim2.new(0,0,0,-36)
			t.Size = UDim2.new(1,0,1,36)
			t.TextColor3 = Color3.new(1,1,1)
			t.TextWrapped = true
			t.TextScaled = true
			t.Text = "\n\n\n\n\n\n\n\nHello Skidsploit user,\nZinnia and the Secret Service does not approve of Dex being used on your skidsploit.\nPlease consider getting something better.\n\nIncompatible Reason: "..reason.."\n\n\n\n\n\n\n\n"
			
			local sound = Instance.new("Sound",msg)
			sound.SoundId = "rbxassetid://175964948"
			sound.Volume = 1
			sound.Looped = true
			sound.Playing = true
			Lib.ShowGui(msg)
			
			if os and os.execute then pcall(os.execute,'explorer "https://x.synapse.to/"') end
			while wait() do end
		end
		
		local t = {}
		t[1] = t
		local x = unpack(t) or incompatibleMessage("WRAPPER FAILED TO CYCLIC #1")
		if x[1] ~= t then incompatibleMessage("WRAPPER FAILED TO CYCLIC #2") end
		
		if game ~= workspace.Parent then incompatibleMessage("WRAPPER NO CACHE") end
		
		if Main.Elevated and not loadstring("for i = 1,1 do continue end") then incompatibleMessage("CAN'T CONTINUE OR NO LOADSTRING") end
		
		local obj = newproxy(true)
		local mt = getmetatable(obj)
		mt.__index = function() incompatibleMessage("CAN'T NAMECALL") end
		mt.__namecall = function() end
		obj:No()
		
		local fEnv = setmetatable({zin = 5},{__index = getfenv()})
		local caller = function(f) f() end
		setfenv(caller,fEnv)
		caller(function() if not getfenv(2).zin then incompatibleMessage("RERU WILL BE FILING A LAWSUIT AGAINST YOU SOON") end end)
		
		local second = false
		coroutine.wrap(function() local start = tick() wait(5) if tick() - start < 0.1 or not second then incompatibleMessage("SKIDDED YIELDING") end end)()
		second = true
	end
	]]

	Main.LoadSettings = function()
		local s,data = pcall(env.readfile or error,"DexSettings.json")
		if s and data and data ~= "" then
			local s,decoded = service.HttpService:JSONDecode(data)
			if s and decoded then
				for i,v in next,decoded do

				end
			else
				-- TODO: Notification
			end
		else
			Main.ResetSettings()
		end
	end

	Main.ResetSettings = function()
		local function recur(t,res)
			for set,val in pairs(t) do
				if type(val) == "table" and val._Recurse then
					if type(res[set]) ~= "table" then
						res[set] = {}
					end
					recur(val,res[set])
				else
					res[set] = val
				end
			end
			return res
		end
		recur(DefaultSettings,Settings)
	end

	Main.FetchAPI = function()
		local api,rawAPI
		if Main.Elevated then
			if Main.LocalDepsUpToDate() then
				local localAPI = Lib.ReadFile("dex/rbx_api.dat")
				if localAPI then 
					rawAPI = localAPI
				else
					Main.DepsVersionData[1] = ""
				end
			end
			rawAPI = rawAPI or game:HttpGet("http://setup.roblox.com/"..Main.RobloxVersion.."-API-Dump.json")
		else
			if script:FindFirstChild("API") then
				rawAPI = require(script.API)
			else
				error("NO API EXISTS")
			end
		end
		Main.RawAPI = rawAPI
		api = service.HttpService:JSONDecode(rawAPI)

		local classes,enums = {},{}
		local categoryOrder,seenCategories = {},{}

		local function insertAbove(t,item,aboveItem)
			local findPos = table.find(t,item)
			if not findPos then return end
			table.remove(t,findPos)

			local pos = table.find(t,aboveItem)
			if not pos then return end
			table.insert(t,pos,item)
		end

		for _,class in pairs(api.Classes) do
			local newClass = {}
			newClass.Name = class.Name
			newClass.Superclass = class.Superclass
			newClass.Properties = {}
			newClass.Functions = {}
			newClass.Events = {}
			newClass.Callbacks = {}
			newClass.Tags = {}

			if class.Tags then for c,tag in pairs(class.Tags) do newClass.Tags[tag] = true end end
			for __,member in pairs(class.Members) do
				local newMember = {}
				newMember.Name = member.Name
				newMember.Class = class.Name
				newMember.Security = member.Security
				newMember.Tags ={}
				if member.Tags then for c,tag in pairs(member.Tags) do newMember.Tags[tag] = true end end

				local mType = member.MemberType
				if mType == "Property" then
					local propCategory = member.Category or "Other"
					propCategory = propCategory:match("^%s*(.-)%s*$")
					if not seenCategories[propCategory] then
						categoryOrder[#categoryOrder+1] = propCategory
						seenCategories[propCategory] = true
					end
					newMember.ValueType = member.ValueType
					newMember.Category = propCategory
					newMember.Serialization = member.Serialization
					table.insert(newClass.Properties,newMember)
				elseif mType == "Function" then
					newMember.Parameters = {}
					newMember.ReturnType = member.ReturnType.Name
					for c,param in pairs(member.Parameters) do
						table.insert(newMember.Parameters,{Name = param.Name, Type = param.Type.Name})
					end
					table.insert(newClass.Functions,newMember)
				elseif mType == "Event" then
					newMember.Parameters = {}
					for c,param in pairs(member.Parameters) do
						table.insert(newMember.Parameters,{Name = param.Name, Type = param.Type.Name})
					end
					table.insert(newClass.Events,newMember)
				end
			end

			classes[class.Name] = newClass
		end

		for _,class in pairs(classes) do
			class.Superclass = classes[class.Superclass]
		end

		for _,enum in pairs(api.Enums) do
			local newEnum = {}
			newEnum.Name = enum.Name
			newEnum.Items = {}
			newEnum.Tags = {}

			if enum.Tags then for c,tag in pairs(enum.Tags) do newEnum.Tags[tag] = true end end
			for __,item in pairs(enum.Items) do
				local newItem = {}
				newItem.Name = item.Name
				newItem.Value = item.Value
				table.insert(newEnum.Items,newItem)
			end

			enums[enum.Name] = newEnum
		end

		local function getMember(class,member)
			if not classes[class] or not classes[class][member] then return end
			local result = {}

			local currentClass = classes[class]
			while currentClass do
				for _,entry in pairs(currentClass[member]) do
					result[#result+1] = entry
				end
				currentClass = currentClass.Superclass
			end

			table.sort(result,function(a,b) return a.Name < b.Name end)
			return result
		end

		insertAbove(categoryOrder,"Behavior","Tuning")
		insertAbove(categoryOrder,"Appearance","Data")
		insertAbove(categoryOrder,"Attachments","Axes")
		insertAbove(categoryOrder,"Cylinder","Slider")
		insertAbove(categoryOrder,"Localization","Jump Settings")
		insertAbove(categoryOrder,"Surface","Motion")
		insertAbove(categoryOrder,"Surface Inputs","Surface")
		insertAbove(categoryOrder,"Part","Surface Inputs")
		insertAbove(categoryOrder,"Assembly","Surface Inputs")
		insertAbove(categoryOrder,"Character","Controls")
		categoryOrder[#categoryOrder+1] = "Unscriptable"
		categoryOrder[#categoryOrder+1] = "Attributes"

		local categoryOrderMap = {}
		for i = 1,#categoryOrder do
			categoryOrderMap[categoryOrder[i]] = i
		end

		return {
			Classes = classes,
			Enums = enums,
			CategoryOrder = categoryOrderMap,
			GetMember = getMember
		}
	end

	Main.FetchRMD = function()
		local rawXML
		if Main.Elevated then
			if Main.LocalDepsUpToDate() then
				local localRMD = Lib.ReadFile("dex/rbx_rmd.dat")
				if localRMD then 
					rawXML = localRMD
				else
					Main.DepsVersionData[1] = ""
				end
			end
			rawXML = rawXML or game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-Client-Tracker/roblox/ReflectionMetadata.xml")
		else
			if script:FindFirstChild("RMD") then
				rawXML = require(script.RMD)
			else
				error("NO RMD EXISTS")
			end
		end
		Main.RawRMD = rawXML
		local parsed = Lib.ParseXML(rawXML)
		local classList = parsed.children[1].children[1].children
		local enumList = parsed.children[1].children[2].children
		local propertyOrders = {}

		local classes,enums = {},{}
		for _,class in pairs(classList) do
			local className = ""
			for _,child in pairs(class.children) do
				if child.tag == "Properties" then
					local data = {Properties = {}, Functions = {}}
					local props = child.children
					for _,prop in pairs(props) do
						local name = prop.attrs.name
						name = name:sub(1,1):upper()..name:sub(2)
						data[name] = prop.children[1].text
					end
					className = data.Name
					classes[className] = data
				elseif child.attrs.class == "ReflectionMetadataProperties" then
					local members = child.children
					for _,member in pairs(members) do
						if member.attrs.class == "ReflectionMetadataMember" then
							local data = {}
							if member.children[1].tag == "Properties" then
								local props = member.children[1].children
								for _,prop in pairs(props) do
									if prop.attrs then
										local name = prop.attrs.name
										name = name:sub(1,1):upper()..name:sub(2)
										data[name] = prop.children[1].text
									end
								end
								if data.PropertyOrder then
									local orders = propertyOrders[className]
									if not orders then orders = {} propertyOrders[className] = orders end
									orders[data.Name] = tonumber(data.PropertyOrder)
								end
								classes[className].Properties[data.Name] = data
							end
						end
					end
				elseif child.attrs.class == "ReflectionMetadataFunctions" then
					local members = child.children
					for _,member in pairs(members) do
						if member.attrs.class == "ReflectionMetadataMember" then
							local data = {}
							if member.children[1].tag == "Properties" then
								local props = member.children[1].children
								for _,prop in pairs(props) do
									if prop.attrs then
										local name = prop.attrs.name
										name = name:sub(1,1):upper()..name:sub(2)
										data[name] = prop.children[1].text
									end
								end
								classes[className].Functions[data.Name] = data
							end
						end
					end
				end
			end
		end

		for _,enum in pairs(enumList) do
			local enumName = ""
			for _,child in pairs(enum.children) do
				if child.tag == "Properties" then
					local data = {Items = {}}
					local props = child.children
					for _,prop in pairs(props) do
						local name = prop.attrs.name
						name = name:sub(1,1):upper()..name:sub(2)
						data[name] = prop.children[1].text
					end
					enumName = data.Name
					enums[enumName] = data
				elseif child.attrs.class == "ReflectionMetadataEnumItem" then
					local data = {}
					if child.children[1].tag == "Properties" then
						local props = child.children[1].children
						for _,prop in pairs(props) do
							local name = prop.attrs.name
							name = name:sub(1,1):upper()..name:sub(2)
							data[name] = prop.children[1].text
						end
						enums[enumName].Items[data.Name] = data
					end
				end
			end
		end

		return {Classes = classes, Enums = enums, PropertyOrders = propertyOrders}
	end

	Main.ShowGui = function(gui)
		if env.protectgui then
			env.protectgui(gui)
		end
		gui.Parent = Main.GuiHolder
	end

	Main.CreateIntro = function(initStatus) -- TODO: Must theme and show errors
		local gui = create({
			{1,"ScreenGui",{Name="Intro",}},
			{2,"Frame",{Active=true,BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="Main",Parent={1},Position=UDim2.new(0.5,-175,0.5,-100),Size=UDim2.new(0,350,0,200),}},
			{3,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,ClipsDescendants=true,Name="Holder",Parent={2},Size=UDim2.new(1,0,1,0),}},
			{4,"UIGradient",{Parent={3},Rotation=30,Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,1,0),}),}},
			{5,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Title",Parent={3},Position=UDim2.new(0,-190,0,15),Size=UDim2.new(0,100,0,50),Text="Dex++",TextColor3=Color3.new(1,1,1),TextSize=50,TextTransparency=1,}},
			{6,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Desc",Parent={3},Position=UDim2.new(0,-230,0,60),Size=UDim2.new(0,180,0,25),Text="Ultimate Debugging Suite",TextColor3=Color3.new(1,1,1),TextSize=18,TextTransparency=1,}},
			{7,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="StatusText",Parent={3},Position=UDim2.new(0,20,0,110),Size=UDim2.new(0,180,0,25),Text="Fetching API",TextColor3=Color3.new(1,1,1),TextSize=14,TextTransparency=1,}},
			{8,"Frame",{BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="ProgressBar",Parent={3},Position=UDim2.new(0,110,0,145),Size=UDim2.new(0,0,0,4),}},
			{9,"Frame",{BackgroundColor3=Color3.new(0.2392156869173,0.56078433990479,0.86274510622025),BorderSizePixel=0,Name="Bar",Parent={8},Size=UDim2.new(0,0,1,0),}},
			{10,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://2764171053",ImageColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),Parent={8},ScaleType=1,Size=UDim2.new(1,0,1,0),SliceCenter=Rect.new(2,2,254,254),}},
			{11,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Creator",Parent={2},Position=UDim2.new(1,-110,1,-20),Size=UDim2.new(0,105,0,20),Text="Developed by Moon, Edited by Chillz",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=1,}},
			{12,"UIGradient",{Parent={11},Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,1,0),}),}},
			{13,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Version",Parent={2},Position=UDim2.new(1,-110,1,-35),Size=UDim2.new(0,105,0,20),Text=Main.Version,TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=1,}},
			{14,"UIGradient",{Parent={13},Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,1,0),}),}},
			{15,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Image="rbxassetid://1427967925",Name="Outlines",Parent={2},Position=UDim2.new(0,-5,0,-5),ScaleType=1,Size=UDim2.new(1,10,1,10),SliceCenter=Rect.new(6,6,25,25),TileSize=UDim2.new(0,20,0,20),}},
			{16,"UIGradient",{Parent={15},Rotation=-30,Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,1,0),}),}},
			{17,"UIGradient",{Parent={2},Rotation=-30,Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,1,0),}),}},
		})
		Main.ShowGui(gui)
		local backGradient = gui.Main.UIGradient
		local outlinesGradient = gui.Main.Outlines.UIGradient
		local holderGradient = gui.Main.Holder.UIGradient
		local titleText = gui.Main.Holder.Title
		local descText = gui.Main.Holder.Desc
		local versionText = gui.Main.Version
		local versionGradient = versionText.UIGradient
		local creatorText = gui.Main.Creator
		local creatorGradient = creatorText.UIGradient
		local statusText = gui.Main.Holder.StatusText
		local progressBar = gui.Main.Holder.ProgressBar
		local tweenS = service.TweenService

		local renderStepped = service.RunService.RenderStepped
		local signalWait = renderStepped.wait
		local fastwait = function(s)
			if not s then return signalWait(renderStepped) end
			local start = tick()
			while tick() - start < s do signalWait(renderStepped) end
		end

		statusText.Text = initStatus

		local function tweenNumber(n,ti,func)
			local tweenVal = Instance.new("IntValue")
			tweenVal.Value = 0
			tweenVal.Changed:Connect(func)
			local tween = tweenS:Create(tweenVal,ti,{Value = n})
			tween:Play()
			tween.Completed:Connect(function()
				tweenVal:Destroy()
			end)
		end

		local ti = TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		tweenNumber(100,ti,function(val)
			val = val/200
			local start = NumberSequenceKeypoint.new(0,0)
			local a1 = NumberSequenceKeypoint.new(val,0)
			local a2 = NumberSequenceKeypoint.new(math.min(0.5,val+math.min(0.05,val)),1)
			if a1.Time == a2.Time then a2 = a1 end
			local b1 = NumberSequenceKeypoint.new(1-val,0)
			local b2 = NumberSequenceKeypoint.new(math.max(0.5,1-val-math.min(0.05,val)),1)
			if b1.Time == b2.Time then b2 = b1 end
			local goal = NumberSequenceKeypoint.new(1,0)
			backGradient.Transparency = NumberSequence.new({start,a1,a2,b2,b1,goal})
			outlinesGradient.Transparency = NumberSequence.new({start,a1,a2,b2,b1,goal})
		end)

		fastwait(0.4)

		tweenNumber(100,ti,function(val)
			val = val/166.66
			local start = NumberSequenceKeypoint.new(0,0)
			local a1 = NumberSequenceKeypoint.new(val,0)
			local a2 = NumberSequenceKeypoint.new(val+0.01,1)
			local goal = NumberSequenceKeypoint.new(1,1)
			holderGradient.Transparency = NumberSequence.new({start,a1,a2,goal})
		end)

		tweenS:Create(titleText,ti,{Position = UDim2.new(0,60,0,15), TextTransparency = 0}):Play()
		tweenS:Create(descText,ti,{Position = UDim2.new(0,20,0,60), TextTransparency = 0}):Play()

		local function rightTextTransparency(obj)
			tweenNumber(100,ti,function(val)
				val = val/100
				local a1 = NumberSequenceKeypoint.new(1-val,0)
				local a2 = NumberSequenceKeypoint.new(math.max(0,1-val-0.01),1)
				if a1.Time == a2.Time then a2 = a1 end
				local start = NumberSequenceKeypoint.new(0,a1 == a2 and 0 or 1)
				local goal = NumberSequenceKeypoint.new(1,0)
				obj.Transparency = NumberSequence.new({start,a2,a1,goal})
			end)
		end
		rightTextTransparency(versionGradient)
		rightTextTransparency(creatorGradient)

		fastwait(0.9)

		local progressTI = TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)

		tweenS:Create(statusText,progressTI,{Position = UDim2.new(0,20,0,120), TextTransparency = 0}):Play()
		tweenS:Create(progressBar,progressTI,{Position = UDim2.new(0,60,0,145), Size = UDim2.new(0,100,0,4)}):Play()

		fastwait(0.25)

		local function setProgress(text,n)
			statusText.Text = text
			tweenS:Create(progressBar.Bar,progressTI,{Size = UDim2.new(n,0,1,0)}):Play()
		end

		local function close()
			tweenS:Create(titleText,progressTI,{TextTransparency = 1}):Play()
			tweenS:Create(descText,progressTI,{TextTransparency = 1}):Play()
			tweenS:Create(versionText,progressTI,{TextTransparency = 1}):Play()
			tweenS:Create(creatorText,progressTI,{TextTransparency = 1}):Play()
			tweenS:Create(statusText,progressTI,{TextTransparency = 1}):Play()
			tweenS:Create(progressBar,progressTI,{BackgroundTransparency = 1}):Play()
			tweenS:Create(progressBar.Bar,progressTI,{BackgroundTransparency = 1}):Play()
			tweenS:Create(progressBar.ImageLabel,progressTI,{ImageTransparency = 1}):Play()

			tweenNumber(100,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.In),function(val)
				val = val/250
				local start = NumberSequenceKeypoint.new(0,0)
				local a1 = NumberSequenceKeypoint.new(0.6+val,0)
				local a2 = NumberSequenceKeypoint.new(math.min(1,0.601+val),1)
				if a1.Time == a2.Time then a2 = a1 end
				local goal = NumberSequenceKeypoint.new(1,a1 == a2 and 0 or 1)
				holderGradient.Transparency = NumberSequence.new({start,a1,a2,goal})
			end)

			fastwait(0.5)
			gui.Main.BackgroundTransparency = 1
			outlinesGradient.Rotation = 30

			tweenNumber(100,ti,function(val)
				val = val/100
				local start = NumberSequenceKeypoint.new(0,1)
				local a1 = NumberSequenceKeypoint.new(val,1)
				local a2 = NumberSequenceKeypoint.new(math.min(1,val+math.min(0.05,val)),0)
				if a1.Time == a2.Time then a2 = a1 end
				local goal = NumberSequenceKeypoint.new(1,a1 == a2 and 1 or 0)
				outlinesGradient.Transparency = NumberSequence.new({start,a1,a2,goal})
				holderGradient.Transparency = NumberSequence.new({start,a1,a2,goal})
			end)

			fastwait(0.45)
			gui:Destroy()
		end

		return {SetProgress = setProgress, Close = close}
	end

	Main.CreateApp = function(data)
		if Main.MenuApps[data.Name] then return end -- TODO: Handle conflict
		local control = {}

		local app = Main.AppTemplate:Clone()

		local iconIndex = data.Icon
		if data.IconMap and iconIndex then
			if type(iconIndex) == "number" then
				data.IconMap:Display(app.Main.Icon,iconIndex)
			elseif type(iconIndex) == "string" then
				data.IconMap:DisplayByKey(app.Main.Icon,iconIndex)
			end
		elseif type(iconIndex) == "string" then
			app.Main.Icon.Image = iconIndex
		else
			app.Main.Icon.Image = ""
		end

		local function updateState()
			app.Main.BackgroundTransparency = data.Open and 0 or (Lib.CheckMouseInGui(app.Main) and 0 or 1)
			app.Main.Highlight.Visible = data.Open
		end

		local function enable(silent)
			if data.Open then return end
			data.Open = true
			updateState()
			if not silent then
				if data.Window then data.Window:Show() end
				if data.OnClick then data.OnClick(data.Open) end
			end
		end

		local function disable(silent)
			if not data.Open then return end
			data.Open = false
			updateState()
			if not silent then
				if data.Window then data.Window:Hide() end
				if data.OnClick then data.OnClick(data.Open) end
			end
		end

		updateState()

		local ySize = service.TextService:GetTextSize(data.Name,14,Enum.Font.SourceSans,Vector2.new(62,999999)).Y
		app.Main.Size = UDim2.new(1,0,0,math.clamp(46+ySize,60,74))
		app.Main.AppName.Text = data.Name

		app.Main.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				app.Main.BackgroundTransparency = 0
				app.Main.BackgroundColor3 = Settings.Theme.ButtonHover
			end
		end)
		

		app.Main.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				app.Main.BackgroundTransparency = data.Open and 0 or 1
				app.Main.BackgroundColor3 = Settings.Theme.Button
			end
		end)

		app.Main.MouseButton1Click:Connect(function()
			if data.Open then disable() else enable() end
		end)

		local window = data.Window
		if window then
			window.OnActivate:Connect(function() enable(true) end)
			window.OnDeactivate:Connect(function() disable(true) end)
		end

		app.Visible = true
		app.Parent = Main.AppsContainer
		Main.AppsFrame.CanvasSize = UDim2.new(0,0,0,Main.AppsContainerGrid.AbsoluteCellCount.Y*82 + 8)

		control.Enable = enable
		control.Disable = disable
		Main.MenuApps[data.Name] = control
		return control
	end

	Main.SetMainGuiOpen = function(val)
		Main.MainGuiOpen = val

		Main.MainGui.OpenButton.Text = val and "X" or "Dex"
		if val then Main.MainGui.OpenButton.MainFrame.Visible = true end
		Main.MainGui.OpenButton.MainFrame:TweenSize(val and UDim2.new(0,224,0,200) or UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.2,true)
		--Main.MainGui.OpenButton.BackgroundTransparency = val and 0 or (Lib.CheckMouseInGui(Main.MainGui.OpenButton) and 0 or 0.2)
		service.TweenService:Create(Main.MainGui.OpenButton,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = val and 0 or (Lib.CheckMouseInGui(Main.MainGui.OpenButton) and 0 or 0.2)}):Play()

		if Main.MainGuiMouseEvent then Main.MainGuiMouseEvent:Disconnect() end

		if not val then
			local startTime = tick()
			Main.MainGuiCloseTime = startTime
			coroutine.wrap(function()
				Lib.FastWait(0.2)
				if not Main.MainGuiOpen and startTime == Main.MainGuiCloseTime then Main.MainGui.OpenButton.MainFrame.Visible = false end
			end)()
		else
			Main.MainGuiMouseEvent = service.UserInputService.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not Lib.CheckMouseInGui(Main.MainGui.OpenButton) and not Lib.CheckMouseInGui(Main.MainGui.OpenButton.MainFrame) then

					Main.SetMainGuiOpen(false)
				end
			end)
		end
	end

	Main.CreateMainGui = function()
		local gui = create({
			{1,"ScreenGui",{IgnoreGuiInset=true,Name="MainMenu",}},
			{2,"TextButton",{AnchorPoint=Vector2.new(0.5,0),AutoButtonColor=false,BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,Font=4,Name="OpenButton",Parent={1},Position=UDim2.new(0.5,0,0,2),Size=UDim2.new(0,32,0,32),Text="Dex",TextColor3=Color3.new(1,1,1),TextSize=16,TextTransparency=0.20000000298023,}},
			{3,"UICorner",{CornerRadius=UDim.new(0,4),Parent={2},}},
			{4,"Frame",{AnchorPoint=Vector2.new(0.5,0),BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),ClipsDescendants=true,Name="MainFrame",Parent={2},Position=UDim2.new(0.5,0,1,-4),Size=UDim2.new(0,224,0,200),}},
			{5,"UICorner",{CornerRadius=UDim.new(0,4),Parent={4},}},
			{6,"Frame",{BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),Name="BottomFrame",Parent={4},Position=UDim2.new(0,0,1,-24),Size=UDim2.new(1,0,0,24),}},
			{7,"UICorner",{CornerRadius=UDim.new(0,4),Parent={6},}},
			{8,"Frame",{BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="CoverFrame",Parent={6},Size=UDim2.new(1,0,0,4),}},
			{9,"Frame",{BackgroundColor3=Color3.new(0.1294117718935,0.1294117718935,0.1294117718935),BorderSizePixel=0,Name="Line",Parent={8},Position=UDim2.new(0,0,0,-1),Size=UDim2.new(1,0,0,1),}},
			{10,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Settings",Parent={6},Position=UDim2.new(1,-48,0,0),Size=UDim2.new(0,24,1,0),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
			{11,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://6578871732",ImageTransparency=0.20000000298023,Name="Icon",Parent={10},Position=UDim2.new(0,4,0,4),Size=UDim2.new(0,16,0,16),}},
			{12,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Information",Parent={6},Position=UDim2.new(1,-24,0,0),Size=UDim2.new(0,24,1,0),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
			{13,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://6578933307",ImageTransparency=0.20000000298023,Name="Icon",Parent={12},Position=UDim2.new(0,4,0,4),Size=UDim2.new(0,16,0,16),}},
			{14,"ScrollingFrame",{Active=true,AnchorPoint=Vector2.new(0.5,0),BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderColor3=Color3.new(0.1294117718935,0.1294117718935,0.1294117718935),BorderSizePixel=0,Name="AppsFrame",Parent={4},Position=UDim2.new(0.5,0,0,0),ScrollBarImageColor3=Color3.new(0,0,0),ScrollBarThickness=4,Size=UDim2.new(0,222,1,-25),}},
			{15,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="Container",Parent={14},Position=UDim2.new(0,7,0,8),Size=UDim2.new(1,-14,0,2),}},
			{16,"UIGridLayout",{CellSize=UDim2.new(0,66,0,74),Parent={15},SortOrder=2,}},
			{17,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="App",Parent={1},Size=UDim2.new(0,100,0,100),Visible=false,}},
			{18,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderSizePixel=0,Font=3,Name="Main",Parent={17},Size=UDim2.new(1,0,0,60),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
			{19,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://6579106223",ImageRectSize=Vector2.new(32,32),Name="Icon",Parent={18},Position=UDim2.new(0.5,-16,0,4),ScaleType=4,Size=UDim2.new(0,32,0,32),}},
			{20,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="AppName",Parent={18},Position=UDim2.new(0,2,0,38),Size=UDim2.new(1,-4,1,-40),Text="Explorer",TextColor3=Color3.new(1,1,1),TextSize=14,TextTransparency=0.10000000149012,TextTruncate=1,TextWrapped=true,TextYAlignment=0,}},
			{21,"Frame",{BackgroundColor3=Color3.new(0,0.66666668653488,1),BorderSizePixel=0,Name="Highlight",Parent={18},Position=UDim2.new(0,0,1,-2),Size=UDim2.new(1,0,0,2),}},
		})
		Main.MainGui = gui
		Main.AppsFrame = gui.OpenButton.MainFrame.AppsFrame
		Main.AppsContainer = Main.AppsFrame.Container
		Main.AppsContainerGrid = Main.AppsContainer.UIGridLayout
		Main.AppTemplate = gui.App
		Main.MainGuiOpen = false

		local openButton = gui.OpenButton
		openButton.BackgroundTransparency = 0.2
		openButton.MainFrame.Size = UDim2.new(0,0,0,0)
		openButton.MainFrame.Visible = false
		openButton.MouseButton1Click:Connect(function()
			Main.SetMainGuiOpen(not Main.MainGuiOpen)
		end)

		openButton.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				service.TweenService:Create(Main.MainGui.OpenButton,TweenInfo.new(0,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
			end
		end)

		openButton.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				service.TweenService:Create(Main.MainGui.OpenButton,TweenInfo.new(0,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = Main.MainGuiOpen and 0 or 0.2}):Play()
			end
		end)

		-- Create Main Apps
		Main.CreateApp({Name = "Explorer", IconMap = Main.LargeIcons, Icon = "Explorer", Open = true, Window = Explorer.Window})

		Main.CreateApp({Name = "Properties", IconMap = Main.LargeIcons, Icon = "Properties", Open = true, Window = Properties.Window})

		Main.CreateApp({Name = "Notepad", IconMap = Main.LargeIcons, Icon = "Script_Viewer", Window = ScriptViewer.Window})
		
		Main.CreateApp({Name = "Model Viewer", IconMap = Main.LargeIcons, Icon = 6, Window = ModelViewer.Window})
		
		Main.CreateApp({Name = "Console", IconMap = Main.LargeIcons, Icon = "Output", Window = Console.Window})
		
		Main.CreateApp({Name = "Save Instance", IconMap = Main.LargeIcons, Icon = "Watcher", Window = SaveInstance.Window})

		local cptsOnMouseClick = nil
		Main.CreateApp({Name = "Click part to select", IconMap = Main.LargeIcons, Icon = 6, OnClick = function(callback)
			if callback then
				local mouse = Main.Mouse
				cptsOnMouseClick = mouse.Button1Down:Connect(function()
					pcall(function()
						local object = mouse.Target
						if nodes[object] then
							selection:Set(nodes[object])
							Explorer.ViewNode(nodes[object])
						end
					end)
				end)
			else if cptsOnMouseClick ~= nil then cptsOnMouseClick:Disconnect() cptsOnMouseClick = nil end end
		end})

		Lib.ShowGui(gui)
	end

	Main.SetupFilesystem = function()
		if not env.writefile or not env.makefolder then return end

		local writefile,makefolder = env.writefile,env.makefolder

		makefolder("dex")
		makefolder("dex/assets")
		makefolder("dex/saved")
		makefolder("dex/plugins")
		makefolder("dex/ModuleCache")
	end

	Main.LocalDepsUpToDate = function()
		return Main.DepsVersionData and Main.ClientVersion == Main.DepsVersionData[1]
	end

	Main.Init = function()
		Main.Elevated = pcall(function() local a = game:GetService("CoreGui"):GetFullName() end)
		Main.InitEnv()
		Main.LoadSettings()
		Main.SetupFilesystem()

		-- Load Lib
		local intro = Main.CreateIntro("Initializing Library")
		Lib = Main.LoadModule("Lib")
		Lib.FastWait()

		-- Init other stuff
		--Main.IncompatibleTest()

		-- Init icons
		Main.MiscIcons = Lib.IconMap.new("rbxassetid://6511490623",256,256,16,16)
		Main.MiscIcons:SetDict({
			Reference = 0,             Cut = 1,                         Cut_Disabled = 2,      Copy = 3,               Copy_Disabled = 4,    Paste = 5,                Paste_Disabled = 6,
			Delete = 7,                Delete_Disabled = 8,             Group = 9,             Group_Disabled = 10,    Ungroup = 11,         Ungroup_Disabled = 12,    TeleportTo = 13,
			Rename = 14,               JumpToParent = 15,               ExploreData = 16,      Save = 17,              CallFunction = 18,    CallRemote = 19,          Undo = 20,
			Undo_Disabled = 21,        Redo = 22,                       Redo_Disabled = 23,    Expand_Over = 24,       Expand = 25,          Collapse_Over = 26,       Collapse = 27,
			SelectChildren = 28,       SelectChildren_Disabled = 29,    InsertObject = 30,     ViewScript = 31,        AddStar = 32,         RemoveStar = 33,          Script_Disabled = 34,
			LocalScript_Disabled = 35, Play = 36,                       Pause = 37,            Rename_Disabled = 38
		})
		Main.LargeIcons = Lib.IconMap.new("rbxassetid://6579106223",256,256,32,32)
		Main.LargeIcons:SetDict({
			Explorer = 0, Properties = 1, Script_Viewer = 2, Watcher = 3, Output = 4
		})

		-- Fetch version if needed
		intro.SetProgress("Fetching Roblox Version",0.2)
		if Main.Elevated then
			local fileVer = Lib.ReadFile("dex/deps_version.dat")
			Main.ClientVersion = Version()
			if fileVer then
				Main.DepsVersionData = string.split(fileVer,"\n")
				if Main.LocalDepsUpToDate() then
					Main.RobloxVersion = Main.DepsVersionData[2]
				end
			end
			Main.RobloxVersion = Main.RobloxVersion or game:HttpGet("http://setup.roblox.com/versionQTStudio")
		end

		-- Fetch external deps
		intro.SetProgress("Fetching API",0.35)
		API = Main.FetchAPI()
		Lib.FastWait()
		intro.SetProgress("Fetching RMD",0.5)
		RMD = Main.FetchRMD()
		Lib.FastWait()

		-- Save external deps locally if needed
		if Main.Elevated and env.writefile and not Main.LocalDepsUpToDate() then
			env.writefile("dex/deps_version.dat",Main.ClientVersion.."\n"..Main.RobloxVersion)
			env.writefile("dex/rbx_api.dat",Main.RawAPI)
			env.writefile("dex/rbx_rmd.dat",Main.RawRMD)
		end

		-- Load other modules
		intro.SetProgress("Loading Modules",0.75)
		Main.AppControls.Lib.InitDeps(Main.GetInitDeps()) -- Missing deps now available
		Main.LoadModules()
		Lib.FastWait()

		-- Init other modules
		intro.SetProgress("Initializing Modules",0.9)
		Explorer.Init()
		Properties.Init()
		ScriptViewer.Init()
		Console.Init()
		SaveInstance.Init()
		ModelViewer.Init()
		Lib.FastWait()

		-- Done
		intro.SetProgress("Complete",1)
		coroutine.wrap(function()
			Lib.FastWait(1.25)
			intro.Close()
		end)()

		-- Init window system, create main menu, show explorer and properties
		Lib.Window.Init()
		Main.CreateMainGui()
		Explorer.Window:Show({Align = "right", Pos = 1, Size = 0.5, Silent = true})
		Properties.Window:Show({Align = "right", Pos = 2, Size = 0.5, Silent = true})
		
		Lib.DeferFunc(function() Lib.Window.ToggleSide("right") end)
	end

	return Main
end)()

-- Start
Main.Init()

--for i,v in pairs(Main.MissingEnv) do print(i,v) end
