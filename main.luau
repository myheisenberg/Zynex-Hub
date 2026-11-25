--// ============================================================
--//  ZYNEX HUB - UNIVERSAL AUTO-LOADER & KEY SYSTEM
--//  Official Repository: https://github.com/myheisenberg/Zynex-Hub
--//  Discord: https://discord.gg/ehbX2MVbTw
--// ============================================================

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Services
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Configuration
local KEY_FILE = "Zynex_Key.txt"
local FLOW_URL = "https://jnkie.com/get-key/zynexhub"
local DISCORD_URL = "https://discord.gg/ehbX2MVbTw"
local SERVICE_ID = "117785"
local IDENTIFIER = "1239891"
local PROVIDER = "work.ink"

-- Supported Games Table
local cheatDuringTest = {
    name = "Cheat During Test",
    url = "https://api.jnkie.com/api/v1/luascripts/public/4962ebaeab6acaf91c5b82e92a2b21d393a4baa301f9aa756d65fcaadcab7478/download",
    keyless = false
}

local sniperArena = {
    name = "Sniper Arena",
    url = "https://api.jnkie.com/api/v1/luascripts/public/64d06cf7501d53d848204c2f2ebb6968427817d0e3e2d6240cb8e0b01e3b4879/download",
    keyless = false
}

local robloxStockExchange2 = {
    name = "Roblox Stock Exchange 2",
    url = "https://api.jnkie.com/api/v1/luascripts/public/20479e65a8fc589c66159a00473e2a4a80ab0f7b3885f63fd92345121bac15c9/download",
    keyless = true
}

local dandysWorld = {
    name = "Dandy's World",
    url = "https://api.jnkie.com/api/v1/luascripts/public/3d869ff1109db81e1738cf2fecf75c656bb9ca5d91a918cc683e1131759fe2fd/download",
    keyless = false
}

local doNotStop = {
    name = "Do Not Stop",
    url = "https://api.jnkie.com/api/v1/luascripts/public/0d8a87ec7cdf36a79f91e48fe74df69f591194a78a10b79ac8762d7d5c2e6bf2/download",
    keyless = false
}

local findTheCountry = {
    name = "Find The Country",
    url = "https://api.jnkie.com/api/v1/luascripts/public/a6b718707c72905652af01a011d56ae79ce1a95e38a2bacf2fb25ba15368a8bf/download",
    keyless = false
}

local sandworm = {
    name = "Sandworm Playground",
    url = "https://api.jnkie.com/api/v1/luascripts/public/38655406e24a5bc29f44ce050c1e2f6b6f110f448725c7b39331a5fe26b9123f/download",
    keyless = false
}

local fisch = {
    name = "Fisch",
    url = "https://api.jnkie.com/api/v1/luascripts/public/bfbc6676e8458af87013da2348c1e7553e2f0ebca674d784c91ab09e58b83b22/download",
    keyless = true
}

local solveTheCube = {
    name = "Solve The Cube",
    url = "https://api.jnkie.com/api/v1/luascripts/public/e5aeb6002b88aa8e72e347482f023ee2d2c60710a95976a4ad9fb9ffcb6cf44e/download",
    keyless = true
}

local ragdollPlayground = {
    name = "Ragdoll Playground",
    url = "https://api.jnkie.com/api/v1/luascripts/public/7129d32efe7445cbf4cfa7d98a17da324c0683a90099f0d82538644eddcec7b8/download",
    keyless = true
}

local chessDuels = {
    name = "Chess Duels",
    url = "https://api.jnkie.com/api/v1/luascripts/public/4bac3b2ec5c89f3d0471ac4d257086fcf2dda83fa9de8a1342c21dea3eec56e3/download",
    keyless = true
}

local unstableSMP = {
    name = "Unstable SMP",
    url = "https://api.jnkie.com/api/v1/luascripts/public/cd3e9fe99fb58b5b4eb32d2a98393cbadcf1050b83388380782da06148303c9d/download",
    keyless = true
}

local voxelWars = {
    name = "Voxel Wars",
    url = "https://api.jnkie.com/api/v1/luascripts/public/e780aacca2adb1ef70d0eb514166ac21a68a90c5c40478b010748db495aa23ee/download",
    keyless = true
}

local respectPVP = {
    name = "Respect PVP",
    url = "https://api.jnkie.com/api/v1/luascripts/public/c95b100fe6d6b31934506e28e3a8a99e3c795b67b5c369f8498e8a745928eb34/download",
    keyless = true
}

local pixelFlag = {
    name = "PixelFlag",
    url = "https://api.jnkie.com/api/v1/luascripts/public/061011d303cb70e8feffeff9552927ccf4ab970c7095ea24216e5676c7e8d638/download",
    keyless = true
}

local streamer = {
    name = "Streamer",
    url = "https://api.jnkie.com/api/v1/luascripts/public/5da9bed1481c60444d505cab250c17803a178902ed96d00f2cba8d04b44bc8c0/download",
    keyless = true
}

local roChess = {
    name = "RoChess",
    url = "https://api.jnkie.com/api/v1/luascripts/public/a7fd70c519dc59612b04148d7ea5613dbcc06c2447a07298f30c8068a7b87943/download",
    keyless = false
}

local luckyIslands = {
    name = "Lucky Islands",
    url = "https://api.jnkie.com/api/v1/luascripts/public/3bffd27067569b90406711091d7968dfc8f73fa294ec3c8c001907d0233cb3f4/download",
    keyless = true
}

local wordPlay = {
    name = "Word Play",
    url = "https://api.jnkie.com/api/v1/luascripts/public/2e3d136e798d939414cf6421c2f95f2eb94fc73ed8ce9ecb0b01cb22593f4cf3/download",
    keyless = false
}

local drawTheOtherHalf = {
    name = "Draw The Other Half",
    url = "https://api.jnkie.com/api/v1/luascripts/public/9fc4981cc5c9a7d09954054110ba2eff4dd8b8ea62809b007529ff488c23fb61/download",
    keyless = true
}

local murderersVsSheriffs = {
    name = "Murderers VS Sheriffs",
    url = "https://api.jnkie.com/api/v1/luascripts/public/76fcb3b9ea409ff6cdae282e7706e9b3c3f1aa9df7e5b86b2c9d0163d6ff260d/download",
    keyless = false
}

local blockTower = {
    name = "Block Tower",
    url = "https://api.jnkie.com/api/v1/luascripts/public/53479250f27f0ad207fc2f1894f8bd3cab02b21b7df8022b6a42ba90d62db87a/download",
    keyless = false
}

local Games = {
    -- Cheat During Test
    [98894876188248]  = cheatDuringTest, -- Lobby / Main Menu
    [108920407787474] = cheatDuringTest, -- Classroom Exam
    [5642875323]      = cheatDuringTest, -- GameId

    -- Sniper Arena
    [119259569670784] = sniperArena, -- Main / Lobby Place
    [126042865144779] = sniperArena, -- Match Sub-Place
    [122446657157717] = sniperArena, -- Lobby Sub-Place
    [9534705677]      = sniperArena, -- GameId / UniverseId

    -- Roblox Stock Exchange 2
    [110527353762049] = robloxStockExchange2, -- Main Place
    [10495391267]     = robloxStockExchange2, -- GameId / UniverseId

    -- Dandy's World
    [16116270224]     = dandysWorld, -- Main Place
    [5569032992]      = dandysWorld, -- GameId / UniverseId

    -- Do Not Stop
    [116779912472448] = doNotStop, -- Active PlaceId
    [10772946647]     = doNotStop, -- GameId / UniverseId

    -- Find The Country
    [100321734959591] = findTheCountry, -- Active PlaceId
    [10770370806]     = findTheCountry, -- GameId / UniverseId

    -- Sandworm Playground
    [88246556972100]  = sandworm, -- Active PlaceId
    [10774386745]     = sandworm, -- GameId / UniverseId

    -- Fisch
    [121864768012064] = fisch, -- Active Fisch Place
    [6701277882]      = fisch, -- Active Fisch GameId / UniverseId
    [16732694052]     = fisch, -- Root Place
    [5750914919]      = fisch, -- UniverseId

    -- Solve The Cube
    [104488514364885] = solveTheCube, -- Active PlaceId
    [10769259605]     = solveTheCube, -- GameId / UniverseId

    -- Ragdoll Playground
    [106521346673466] = ragdollPlayground, -- Active PlaceId
    [10768383600]     = ragdollPlayground, -- GameId / UniverseId

    -- Chess Duels
    [89083628291452]  = chessDuels, -- Active PlaceId
    [10773277140]     = chessDuels, -- GameId / UniverseId

    -- Unstable SMP
    [76870565041704]  = unstableSMP, -- Active PlaceId
    [10772281976]     = unstableSMP, -- GameId / UniverseId

    -- Voxel Wars
    [78884249003161]  = voxelWars, -- Active PlaceId
    [10773416193]     = voxelWars, -- GameId / UniverseId

    -- Respect PVP
    [103921126484906] = respectPVP, -- Active PlaceId
    [10772490127]     = respectPVP, -- GameId / UniverseId

    -- PixelFlag
    [133787291114459] = pixelFlag, -- Active PlaceId
    [10770104321]     = pixelFlag, -- GameId / UniverseId

    -- Streamer
    [87324870231331]  = streamer, -- Active PlaceId
    [10772284025]     = streamer, -- GameId / UniverseId

    -- RoChess
    [130878180532794] = roChess, -- Active PlaceId
    [10773907070]     = roChess, -- GameId / UniverseId

    -- Lucky Islands
    [18134283205]     = luckyIslands, -- Active PlaceId
    [6147671296]      = luckyIslands, -- GameId / UniverseId

    -- Word Play / Name Them All
    [99066225512279]  = wordPlay, -- Active PlaceId
    [10774657974]     = wordPlay, -- GameId / UniverseId

    -- Draw The Other Half
    [122701511178560] = drawTheOtherHalf, -- Active PlaceId
    [10773244575]     = drawTheOtherHalf, -- GameId / UniverseId

    -- Murderers VS Sheriffs
    [135856908115931] = murderersVsSheriffs, -- Main Place
    [7219654364]      = murderersVsSheriffs, -- GameId / UniverseId
    [74084441161738]  = murderersVsSheriffs,
    [81344624573389]  = murderersVsSheriffs,
    [92876937625630]  = murderersVsSheriffs,
    [97251114306253]  = murderersVsSheriffs,
    [101617670515690] = murderersVsSheriffs,
    [114176825419426] = murderersVsSheriffs,
    [123627218337521] = murderersVsSheriffs,
    [124848751642883] = murderersVsSheriffs,
    [137570376387995] = murderersVsSheriffs,

    -- Block Tower
    [138940214958285] = blockTower, -- Main Place
    [10773749924]     = blockTower, -- GameId / UniverseId
}

-- Game Detection
local currentPlaceId = game.PlaceId
local currentGameId = game.GameId
local matchedGame = Games[currentPlaceId] or Games[currentGameId]
if not matchedGame then
    if currentGameId == 5642875323 or currentPlaceId == 98894876188248 or currentPlaceId == 108920407787474 then
        matchedGame = cheatDuringTest
    elseif currentGameId == 9534705677 or currentPlaceId == 119259569670784 or currentPlaceId == 126042865144779 or currentPlaceId == 122446657157717 then
        matchedGame = sniperArena
    elseif currentGameId == 10495391267 or currentPlaceId == 110527353762049 then
        matchedGame = robloxStockExchange2
    elseif currentGameId == 5569032992 or currentPlaceId == 16116270224 then
        matchedGame = dandysWorld
    elseif currentGameId == 10772946647 or currentPlaceId == 116779912472448 then
        matchedGame = doNotStop
    elseif currentGameId == 10770370806 or currentPlaceId == 100321734959591 then
        matchedGame = findTheCountry
    elseif currentGameId == 10774386745 or currentPlaceId == 88246556972100 then
        matchedGame = sandworm
    elseif currentGameId == 6701277882 or currentPlaceId == 121864768012064 or currentGameId == 5750914919 or currentPlaceId == 16732694052 then
        matchedGame = fisch
    elseif currentGameId == 10769259605 or currentPlaceId == 104488514364885 then
        matchedGame = solveTheCube
    elseif currentGameId == 10768383600 or currentPlaceId == 106521346673466 then
        matchedGame = ragdollPlayground
    elseif currentGameId == 10773277140 or currentPlaceId == 89083628291452 then
        matchedGame = chessDuels
    elseif currentGameId == 10772281976 or currentPlaceId == 76870565041704 then
        matchedGame = unstableSMP
    elseif currentGameId == 10773416193 or currentPlaceId == 78884249003161 then
        matchedGame = voxelWars
    elseif currentGameId == 10772490127 or currentPlaceId == 103921126484906 then
        matchedGame = respectPVP
    elseif currentGameId == 10770104321 or currentPlaceId == 133787291114459 then
        matchedGame = pixelFlag
    elseif currentGameId == 10772284025 or currentPlaceId == 87324870231331 then
        matchedGame = streamer
    elseif currentGameId == 10773907070 or currentPlaceId == 130878180532794 then
        matchedGame = roChess
    elseif currentGameId == 6147671296 or currentPlaceId == 18134283205 then
        matchedGame = luckyIslands
    elseif currentGameId == 10774657974 or currentPlaceId == 99066225512279 then
        matchedGame = wordPlay
    elseif currentGameId == 10773244575 or currentPlaceId == 122701511178560 then
        matchedGame = drawTheOtherHalf
    elseif currentGameId == 7219654364 or currentPlaceId == 135856908115931 then
        matchedGame = murderersVsSheriffs
    elseif currentGameId == 10773749924 or currentPlaceId == 138940214958285 then
        matchedGame = blockTower
    end
end

-- If game is not supported, notify and exit (never show Key GUI for unsupported games!)
if not matchedGame then
    warn("[Zynex Hub] Unsupported game. PlaceId: " .. tostring(currentPlaceId) .. " | GameId: " .. tostring(currentGameId))
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Zynex Hub",
            Text = "Game not supported! (Place: " .. tostring(currentPlaceId) .. ")",
            Duration = 6
        })
    end)
    return
end

-- Clipboard Helper
local function CopyToClipboard(text)
    if setclipboard then
        pcall(setclipboard, text)
        return true
    elseif toclipboard then
        pcall(toclipboard, text)
        return true
    end
    return false
end

-- JNKIE Public SDK Loader
local Junkie = nil
local function GetJunkie()
    if Junkie then return Junkie end
    local ok, res = pcall(function()
        return loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
    end)
    if ok and type(res) == "table" then
        res.service = SERVICE_ID
        res.identifier = IDENTIFIER
        res.provider = PROVIDER
        Junkie = res
        return Junkie
    end
    return nil
end

-- Key Validation Helper
local function CheckWhitelist(key)
    if not key or key == "" then
        return false, "Key cannot be empty"
    end
    -- Auto-clean: remove all spaces, tabs, newlines, and hidden characters
    local trimmed = tostring(key):gsub("%s+", ""):gsub("[\r\n\t]", "")
    if not trimmed or trimmed == "" then
        return false, "Key cannot be empty"
    end

    local sdk = GetJunkie()
    if sdk and sdk.check_key then
        local ok, result = pcall(sdk.check_key, trimmed)
        if ok and type(result) == "table" then
            if result.valid then
                return true, "Key valid"
            else
                local errMap = {
                    ["KEY_INVALID"] = "Key is invalid",
                    ["KEY_EXPIRED"] = "Key has expired",
                    ["KEY_INVALIDATED"] = "Key was invalidated",
                    ["ALREADY_USED"] = "Key was already used",
                    ["HWID_MISMATCH"] = "HWID mismatch - get a new key",
                    ["HWID_BANNED"] = "Device is banned",
                    ["SERVICE_MISMATCH"] = "Key belongs to another service"
                }
                return false, errMap[result.error] or ("Rejected: " .. tostring(result.error or "unknown"))
            end
        end
    end
    return true, "Validated"
end

-- Launch Script Directly
local function LaunchMainScript(key)
    key = tostring(key):gsub("%s+", ""):gsub("[\r\n\t]", "")
    getgenv().SCRIPT_KEY = key
    if writefile and key ~= "" and key ~= "KEYLESS" then
        pcall(writefile, KEY_FILE, key)
    end
    if matchedGame then
        loadstring(game:HttpGet(matchedGame.url))()
    end
end

-- Instant Keyless Bypass (KULLANICININ KESIN KURALI: Keyless oyunlarda asla key ekrani acilmaz)
if matchedGame and matchedGame.keyless then
    LaunchMainScript("KEYLESS")
    return
end

-- Auto-Login check for saved key
if isfile and readfile and isfile(KEY_FILE) then
    local saved = nil
    pcall(function()
        local k = readfile(KEY_FILE)
        if k then
            k = tostring(k):gsub("%s+", ""):gsub("[\r\n\t]", "")
            if k and #k > 3 and k ~= "KEYLESS" then
                saved = k
            end
        end
    end)
    if saved and matchedGame then
        local valid = CheckWhitelist(saved)
        if valid then
            LaunchMainScript(saved)
            return
        end
    end
end

-- ============================================================
--  1:1 DO NOT STOP AESTHETIC FLUENT ACRYLIC KEY GUI
-- ============================================================

local parent = (gethui and gethui()) or CoreGui:FindFirstChild("RobloxGui") or CoreGui

if parent:FindFirstChild("Zynex_AuthModal") then
    parent.Zynex_AuthModal:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Zynex_AuthModal"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = parent

-- Background Overlay
local Overlay = Instance.new("TextButton")
Overlay.Name = "Overlay"
Overlay.Text = ""
Overlay.AutoButtonColor = false
Overlay.Size = UDim2.fromScale(1, 1)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.55
Overlay.BorderSizePixel = 0
Overlay.Parent = ScreenGui

-- Main Card (480 x 255)
local Card = Instance.new("Frame")
Card.Name = "Card"
Card.Size = UDim2.fromOffset(480, 255)
Card.AnchorPoint = Vector2.new(0.5, 0.5)
Card.Position = UDim2.fromScale(0.5, 0.5)
Card.BackgroundTransparency = 1
Card.BorderSizePixel = 0
Card.Parent = ScreenGui

-- Soft Shadow
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.Position = UDim2.fromScale(0.5, 0.5)
Shadow.Size = UDim2.new(1, 110, 1, 110)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://8992230677"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.5
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(99, 99, 99, 99)
Shadow.ZIndex = 1
Shadow.Parent = Card

-- Background
local Background = Instance.new("Frame")
Background.Name = "Background"
Background.Size = UDim2.fromScale(1, 1)
Background.BackgroundColor3 = Color3.fromRGB(36, 36, 42)
Background.BackgroundTransparency = 0.22
Background.BorderSizePixel = 0
Background.ZIndex = 2
Background.Parent = Card

local BgCorner = Instance.new("UICorner")
BgCorner.CornerRadius = UDim.new(0, 8)
BgCorner.Parent = Background

-- Gradient Frame
local GradientFrame = Instance.new("Frame")
GradientFrame.Name = "Gradient"
GradientFrame.Size = UDim2.fromScale(1, 1)
GradientFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GradientFrame.BackgroundTransparency = 0.75
GradientFrame.BorderSizePixel = 0
GradientFrame.ZIndex = 2
GradientFrame.Parent = Card

local GradCorner = Instance.new("UICorner")
GradCorner.CornerRadius = UDim.new(0, 8)
GradCorner.Parent = GradientFrame

local Grad = Instance.new("UIGradient")
Grad.Rotation = 90
Grad.Color = ColorSequence.new(Color3.fromRGB(48, 48, 54), Color3.fromRGB(24, 24, 28))
Grad.Parent = GradientFrame

-- Acrylic Noise Texture
local Noise = Instance.new("ImageLabel")
Noise.Name = "Noise"
Noise.Size = UDim2.fromScale(1, 1)
Noise.BackgroundTransparency = 1
Noise.Image = "rbxassetid://9968344227"
Noise.ImageTransparency = 0.94
Noise.ScaleType = Enum.ScaleType.Tile
Noise.TileSize = UDim2.new(0, 128, 0, 128)
Noise.ZIndex = 2
Noise.Parent = Card

local NoiseCorner = Instance.new("UICorner")
NoiseCorner.CornerRadius = UDim.new(0, 8)
NoiseCorner.Parent = Noise

-- Border Frame
local BorderFrame = Instance.new("Frame")
BorderFrame.Name = "Border"
BorderFrame.Size = UDim2.fromScale(1, 1)
BorderFrame.BackgroundTransparency = 1
BorderFrame.ZIndex = 4
BorderFrame.Parent = Card

local BorderCorner = Instance.new("UICorner")
BorderCorner.CornerRadius = UDim.new(0, 8)
BorderCorner.Parent = BorderFrame

local BorderStroke = Instance.new("UIStroke")
BorderStroke.Color = Color3.fromRGB(90, 90, 95)
BorderStroke.Transparency = 0.5
BorderStroke.Thickness = 1
BorderStroke.Parent = BorderFrame

-- Top Glowing Neon Cyan Line
local TopLine = Instance.new("Frame")
TopLine.Name = "TopLine"
TopLine.Size = UDim2.new(1, -16, 0, 1)
TopLine.Position = UDim2.fromOffset(8, 0)
TopLine.BackgroundColor3 = Color3.fromRGB(96, 205, 255)
TopLine.BackgroundTransparency = 0.4
TopLine.BorderSizePixel = 0
TopLine.ZIndex = 5
TopLine.Parent = Card

-- Header
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 52)
Header.BackgroundTransparency = 1
Header.ZIndex = 5
Header.Parent = Card

-- Lucide Key Icon
local Icon = Instance.new("ImageLabel")
Icon.Name = "Icon"
Icon.Size = UDim2.fromOffset(22, 22)
Icon.Position = UDim2.fromOffset(20, 16)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://118976126805967"
Icon.ImageRectOffset = Vector2.new(320, 64)
Icon.ImageRectSize = Vector2.new(64, 64)
Icon.ImageColor3 = Color3.fromRGB(96, 205, 255)
Icon.ZIndex = 5
Icon.Parent = Header

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Text = "Zynex Hub"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextColor3 = Color3.fromRGB(245, 245, 245)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.Position = UDim2.fromOffset(50, 12)
Title.Size = UDim2.new(1, -90, 0, 18)
Title.AutoLocalize = false
Title.ZIndex = 5
Title.Parent = Header

-- SubTitle (Shows Active Game Name)
local SubTitle = Instance.new("TextLabel")
SubTitle.Name = "SubTitle"
SubTitle.Text = (matchedGame and matchedGame.name or "Universal Script Hub") .. " | by zynex"
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 12
SubTitle.TextColor3 = matchedGame and Color3.fromRGB(96, 205, 255) or Color3.fromRGB(255, 100, 100)
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.fromOffset(50, 31)
SubTitle.Size = UDim2.new(1, -90, 0, 14)
SubTitle.AutoLocalize = false
SubTitle.ZIndex = 5
SubTitle.Parent = Header

-- Body Area
local Body = Instance.new("Frame")
Body.Name = "Body"
Body.Size = UDim2.new(1, -40, 0, 115)
Body.Position = UDim2.fromOffset(20, 58)
Body.BackgroundTransparency = 1
Body.ZIndex = 5
Body.Parent = Card

-- Input Frame
local InputFrame = Instance.new("Frame")
InputFrame.Name = "InputFrame"
InputFrame.Size = UDim2.new(1, 0, 0, 38)
InputFrame.Position = UDim2.fromOffset(0, 6)
InputFrame.BackgroundColor3 = Color3.fromRGB(48, 48, 54)
InputFrame.BackgroundTransparency = 0.2
InputFrame.BorderSizePixel = 0
InputFrame.ZIndex = 5
InputFrame.Parent = Body

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 4)
InputCorner.Parent = InputFrame

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(75, 75, 82)
InputStroke.Transparency = 0.6
InputStroke.Thickness = 1
InputStroke.Parent = InputFrame

local TextBox = Instance.new("TextBox")
TextBox.Name = "Input"
TextBox.PlaceholderText = "Paste key here..."
TextBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 155)
TextBox.Text = ""
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 13
TextBox.TextColor3 = Color3.fromRGB(245, 245, 245)
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.ClearTextOnFocus = false
TextBox.BackgroundTransparency = 1
TextBox.Size = UDim2.new(1, -24, 1, 0)
TextBox.Position = UDim2.fromOffset(12, 0)
TextBox.AutoLocalize = false
TextBox.ZIndex = 6
TextBox.Parent = InputFrame

-- Animated Indicator Line
local Indicator = Instance.new("Frame")
Indicator.Name = "Indicator"
Indicator.Size = UDim2.new(1, -4, 0, 1)
Indicator.Position = UDim2.new(0, 2, 1, -1)
Indicator.BackgroundColor3 = Color3.fromRGB(145, 145, 150)
Indicator.BackgroundTransparency = 0.5
Indicator.BorderSizePixel = 0
Indicator.ZIndex = 6
Indicator.Parent = InputFrame

TextBox.Focused:Connect(function()
    TweenService:Create(InputFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(38, 38, 44), BackgroundTransparency = 0.1}):Play()
    TweenService:Create(Indicator, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(96, 205, 255), BackgroundTransparency = 0, Size = UDim2.new(1, -2, 0, 2)}):Play()
end)

TextBox.FocusLost:Connect(function()
    TweenService:Create(InputFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(48, 48, 54), BackgroundTransparency = 0.2}):Play()
    TweenService:Create(Indicator, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(145, 145, 150), BackgroundTransparency = 0.5, Size = UDim2.new(1, -4, 0, 1)}):Play()
end)

-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "Status"
StatusLabel.Text = matchedGame and "Click \"Get Key\" to copy the verification link." or ("Game not supported yet (PlaceId: " .. tostring(currentPlaceId) .. ")")
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 12
StatusLabel.TextColor3 = matchedGame and Color3.fromRGB(155, 155, 160) or Color3.fromRGB(255, 100, 100)
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.fromOffset(2, 50)
StatusLabel.Size = UDim2.new(1, -4, 0, 20)
StatusLabel.AutoLocalize = false
StatusLabel.ZIndex = 5
StatusLabel.Parent = Body

-- Bottom Bar
local BottomBar = Instance.new("Frame")
BottomBar.Name = "BottomBar"
BottomBar.Size = UDim2.new(1, 0, 0, 58)
BottomBar.Position = UDim2.new(0, 0, 1, -58)
BottomBar.BackgroundColor3 = Color3.fromRGB(30, 30, 34)
BottomBar.BackgroundTransparency = 0.2
BottomBar.BorderSizePixel = 0
BottomBar.ZIndex = 5
BottomBar.Parent = Card

local BottomCorner = Instance.new("UICorner")
BottomCorner.CornerRadius = UDim.new(0, 8)
BottomCorner.Parent = BottomBar

local BottomCover = Instance.new("Frame")
BottomCover.Name = "Cover"
BottomCover.Size = UDim2.new(1, 0, 0, 8)
BottomCover.Position = UDim2.new(0, 0, 0, 0)
BottomCover.BackgroundColor3 = Color3.fromRGB(30, 30, 34)
BottomCover.BackgroundTransparency = 0.2
BottomCover.BorderSizePixel = 0
BottomCover.ZIndex = 5
BottomCover.Parent = BottomBar

local BottomLine = Instance.new("Frame")
BottomLine.Name = "Sep"
BottomLine.Size = UDim2.new(1, 0, 0, 1)
BottomLine.Position = UDim2.new(0, 0, 0, 0)
BottomLine.BackgroundColor3 = Color3.fromRGB(60, 60, 66)
BottomLine.BackgroundTransparency = 0.4
BottomLine.BorderSizePixel = 0
BottomLine.ZIndex = 6
BottomLine.Parent = BottomBar

-- Discord Button (Left)
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Name = "DiscordBtn"
DiscordBtn.Text = "Discord"
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.TextSize = 14
DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordBtn.Size = UDim2.fromOffset(88, 34)
DiscordBtn.Position = UDim2.fromOffset(20, 12)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordBtn.BackgroundTransparency = 0.1
DiscordBtn.AutoButtonColor = false
DiscordBtn.AutoLocalize = false
DiscordBtn.ZIndex = 7
DiscordBtn.Parent = BottomBar

local DiscordCorner = Instance.new("UICorner")
DiscordCorner.CornerRadius = UDim.new(0, 4)
DiscordCorner.Parent = DiscordBtn

local DiscordStroke = Instance.new("UIStroke")
DiscordStroke.Color = Color3.fromRGB(114, 137, 218)
DiscordStroke.Transparency = 0.4
DiscordStroke.Thickness = 1
DiscordStroke.Parent = DiscordBtn

DiscordBtn.MouseEnter:Connect(function()
    TweenService:Create(DiscordBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(105, 118, 245), BackgroundTransparency = 0}):Play()
end)
DiscordBtn.MouseLeave:Connect(function()
    TweenService:Create(DiscordBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(88, 101, 242), BackgroundTransparency = 0.1}):Play()
end)

DiscordBtn.MouseButton1Click:Connect(function()
    CopyToClipboard(DISCORD_URL)
    StatusLabel.Text = "Discord invite copied to clipboard!"
    StatusLabel.TextColor3 = Color3.fromRGB(114, 137, 218)
end)

-- Right Holder for Get Key + Verify Key
local RightHolder = Instance.new("Frame")
RightHolder.Name = "RightHolder"
RightHolder.Size = UDim2.new(0, 260, 0, 34)
RightHolder.Position = UDim2.new(1, -280, 0, 12)
RightHolder.BackgroundTransparency = 1
RightHolder.ZIndex = 6
RightHolder.Parent = BottomBar

local RightLayout = Instance.new("UIListLayout")
RightLayout.FillDirection = Enum.FillDirection.Horizontal
RightLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
RightLayout.VerticalAlignment = Enum.VerticalAlignment.Center
RightLayout.Padding = UDim.new(0, 10)
RightLayout.Parent = RightHolder

-- Get Key Button
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Name = "GetKeyBtn"
GetKeyBtn.Text = "Get Key"
GetKeyBtn.Font = Enum.Font.GothamMedium
GetKeyBtn.TextSize = 13
GetKeyBtn.TextColor3 = Color3.fromRGB(235, 235, 240)
GetKeyBtn.Size = UDim2.fromOffset(125, 34)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(48, 48, 54)
GetKeyBtn.BackgroundTransparency = 0.1
GetKeyBtn.AutoButtonColor = false
GetKeyBtn.AutoLocalize = false
GetKeyBtn.ZIndex = 7
GetKeyBtn.Parent = RightHolder

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 4)
GetKeyCorner.Parent = GetKeyBtn

local GetKeyStroke = Instance.new("UIStroke")
GetKeyStroke.Color = Color3.fromRGB(75, 75, 82)
GetKeyStroke.Transparency = 0.6
GetKeyStroke.Thickness = 1
GetKeyStroke.Parent = GetKeyBtn

GetKeyBtn.MouseEnter:Connect(function()
    TweenService:Create(GetKeyBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(62, 62, 70)}):Play()
end)
GetKeyBtn.MouseLeave:Connect(function()
    TweenService:Create(GetKeyBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(48, 48, 54)}):Play()
end)

GetKeyBtn.MouseButton1Click:Connect(function()
    CopyToClipboard(FLOW_URL)
    StatusLabel.Text = "Key link copied to clipboard! Complete checkpoint in browser."
    StatusLabel.TextColor3 = Color3.fromRGB(96, 205, 255)
end)

-- Verify Key Button (Fluent Neon Blue)
local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Name = "VerifyBtn"
VerifyBtn.Text = "Verify Key"
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.TextSize = 14
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.Size = UDim2.fromOffset(115, 34)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 212)
VerifyBtn.BackgroundTransparency = 0
VerifyBtn.AutoButtonColor = false
VerifyBtn.AutoLocalize = false
VerifyBtn.ZIndex = 7
VerifyBtn.Parent = RightHolder

local VerifyCorner = Instance.new("UICorner")
VerifyCorner.CornerRadius = UDim.new(0, 4)
VerifyCorner.Parent = VerifyBtn

local VerifyStroke = Instance.new("UIStroke")
VerifyStroke.Color = Color3.fromRGB(96, 205, 255)
VerifyStroke.Transparency = 0.6
VerifyStroke.Thickness = 1
VerifyStroke.Parent = VerifyBtn

VerifyBtn.MouseEnter:Connect(function()
    TweenService:Create(VerifyBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(16, 137, 230)}):Play()
end)
VerifyBtn.MouseLeave:Connect(function()
    TweenService:Create(VerifyBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(0, 120, 212)}):Play()
end)

-- Key Verification & Submission Logic
local verifying = false
VerifyBtn.MouseButton1Click:Connect(function()
    if verifying then return end
    local entered = TextBox.Text
    if not entered or entered == "" then
        StatusLabel.Text = "Please paste your key into the text field first."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end

    if not matchedGame then
        StatusLabel.Text = "Cannot submit: this game is not supported."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end

    verifying = true
    VerifyBtn.Text = "Checking..."
    StatusLabel.Text = "Validating key..."
    StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 185)

    task.spawn(function()
        local valid, msg = CheckWhitelist(entered)
        if valid then
            StatusLabel.Text = "Key verified successfully! Loading script..."
            StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 120)
            VerifyBtn.Text = "Verified!"
            VerifyBtn.BackgroundColor3 = Color3.fromRGB(16, 185, 129)

            task.wait(0.6)
            ScreenGui:Destroy()
            LaunchMainScript(entered)
        else
            StatusLabel.Text = msg or "Invalid or expired key. Please get a new key."
            StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            VerifyBtn.Text = "Verify Key"
            verifying = false
        end
    end)
end)

-- Draggable Window Implementation
local dragging = false
local dragStart = Vector3.new()
local startPos = UDim2.new()
local dragInput = nil

Card.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Card.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Card.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Card.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)
