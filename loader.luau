--// ============================================================
--//  ZYNEX HUB - UNIVERSAL AUTO-LOADER & KEY SYSTEM
--//  Official Repository: https://github.com/myheisenberg/Zynex-Hub
--//  Discord: https://discord.gg/ehbX2MVbTw
--// ============================================================

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Teleport Persistence
local qot = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
if type(qot) == "function" then
    pcall(qot, 'loadstring(game:HttpGet("https://raw.githubusercontent.com/myheisenberg/Zynex-Hub/main/loader.luau"))()')
end

-- Services
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Configuration
local KEY_FILE = "Zynex_Key.txt"
local FLOW_URL = "https://jnkie.com/flow/dfd5b395-0d38-49a0-8b06-7a21c7666edd"
local DISCORD_URL = "https://discord.gg/ehbX2MVbTw"
local SERVICE_ID = "117785"
local IDENTIFIER = "1239891"
local PROVIDER = "work.ink"

-- Supported Games Table
local Games = {
    [108920407787474] = {
        name = "Cheat During Test",
        url = "https://api.jnkie.com/api/v1/luascripts/public/4962ebaeab6acaf91c5b82e92a2b21d393a4baa301f9aa756d65fcaadcab7478/download",
        token = "4962ebaeab6acaf91c5b82e92a2b21d393a4baa301f9aa756d65fcaadcab7478"
    },
    [16116270224] = {
        name = "Cheat During Test",
        url = "https://api.jnkie.com/api/v1/luascripts/public/4962ebaeab6acaf91c5b82e92a2b21d393a4baa301f9aa756d65fcaadcab7478/download",
        token = "4962ebaeab6acaf91c5b82e92a2b21d393a4baa301f9aa756d65fcaadcab7478"
    }
}

-- Game Detection
local currentPlaceId = game.PlaceId
local currentGameId = game.GameId
local matchedGame = Games[currentPlaceId] or Games[currentGameId]
if not matchedGame and (currentGameId == 5642875323 or currentPlaceId == 108920407787474 or currentPlaceId == 16116270224) then
    matchedGame = Games[108920407787474]
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
local function ValidateKey(key)
    if not key or key == "" then
        return false, "Key cannot be empty"
    end
    local trimmed = key:match("^%s*(.-)%s*$")
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
    -- Fallback if public SDK verification endpoint is unreachable
    return true, "Validated"
end

-- Script Launch Execution
local function LaunchGameScript(key)
    getgenv().SCRIPT_KEY = key
    if writefile then
        pcall(writefile, KEY_FILE, key)
    end
    if matchedGame then
        loadstring(game:HttpGet(matchedGame.url))()
    end
end

-- Check Saved Key First
local savedKey = nil
if isfile and readfile and isfile(KEY_FILE) then
    pcall(function()
        local k = readfile(KEY_FILE)
        if k then
            k = k:match("^%s*(.-)%s*$")
            if k and #k > 3 then
                savedKey = k
            end
        end
    end)
end

if savedKey and matchedGame then
    local isValid = ValidateKey(savedKey)
    if isValid then
        LaunchGameScript(savedKey)
        return
    end
end

-- ============================================================
--  AESTHETIC ZYNEX HUB KEY SYSTEM GUI
-- ============================================================

local ParentGui = (gethui and gethui()) or CoreGui or LocalPlayer:WaitForChild("PlayerGui")
if ParentGui:FindFirstChild("ZynexKeyGUI") then
    ParentGui.ZynexKeyGUI:Destroy()
end
if Lighting:FindFirstChild("ZynexLoaderBlur") then
    Lighting.ZynexLoaderBlur:Destroy()
end

-- Colors Palette (Glassmorphic Dark)
local C_BG_MAIN      = Color3.fromRGB(15, 17, 23)
local C_BG_SURFACE   = Color3.fromRGB(20, 23, 31)
local C_BORDER       = Color3.fromRGB(36, 41, 54)
local C_TEXT_PRIMARY = Color3.fromRGB(244, 246, 250)
local C_TEXT_MUTED   = Color3.fromRGB(110, 119, 138)
local C_EMERALD      = Color3.fromRGB(45, 212, 168)
local C_EMERALD_BG   = Color3.fromRGB(16, 40, 37)
local C_EMERALD_LINE = Color3.fromRGB(27, 82, 72)
local C_CORAL        = Color3.fromRGB(244, 102, 102)
local C_CORAL_BG     = Color3.fromRGB(40, 19, 25)
local C_CORAL_LINE   = Color3.fromRGB(88, 35, 45)
local C_INDIGO       = Color3.fromRGB(99, 102, 241)
local C_INDIGO_HOVER = Color3.fromRGB(129, 140, 248)

-- Modern Font Helper
local function SetModernFont(label, weight, fallback)
    label.Font = fallback or Enum.Font.GothamMedium
    pcall(function()
        label.FontFace = Font.new(
            "rbxasset://fonts/families/BuilderSans.json",
            weight or Enum.FontWeight.Medium,
            Enum.FontStyle.Normal
        )
    end)
end

-- Ambient Lighting Blur
local Blur = Instance.new("BlurEffect")
Blur.Name = "ZynexLoaderBlur"
Blur.Size = 0
Blur.Parent = Lighting

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZynexKeyGUI"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = ParentGui

-- Main Container Window
local Main = Instance.new("CanvasGroup")
Main.Name = "Main"
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.new(0.5, 0, 0.5, 15)
Main.Size = UDim2.new(0, 440, 0, 320)
Main.BackgroundColor3 = C_BG_MAIN
Main.BackgroundTransparency = 0.02
Main.GroupTransparency = 1
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = Main

local MainScale = Instance.new("UIScale")
MainScale.Scale = 0.95
MainScale.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 1
MainStroke.Color = C_BORDER
MainStroke.Parent = Main

-- Top Radial Glow
local TopGlow = Instance.new("Frame")
TopGlow.Size = UDim2.new(1, 0, 0, 90)
TopGlow.BackgroundColor3 = Color3.fromRGB(67, 56, 202)
TopGlow.BackgroundTransparency = 0.88
TopGlow.BorderSizePixel = 0
TopGlow.ZIndex = 0
TopGlow.Parent = Main

local TopGlowGrad = Instance.new("UIGradient")
TopGlowGrad.Rotation = 90
TopGlowGrad.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(1, 1)
})
TopGlowGrad.Parent = TopGlow

-- Header: Glowing Emblem
local Emblem = Instance.new("Frame")
Emblem.Size = UDim2.new(0, 28, 0, 28)
Emblem.Position = UDim2.new(0, 20, 0, 18)
Emblem.BackgroundColor3 = Color3.fromRGB(79, 70, 229)
Emblem.BorderSizePixel = 0
Emblem.Parent = Main

local EmblemCorner = Instance.new("UICorner")
EmblemCorner.CornerRadius = UDim.new(0, 8)
EmblemCorner.Parent = Emblem

local EmblemGrad = Instance.new("UIGradient")
EmblemGrad.Rotation = 45
EmblemGrad.Color = ColorSequence.new(Color3.fromRGB(99, 102, 241), Color3.fromRGB(6, 182, 212))
EmblemGrad.Parent = Emblem

local EmblemText = Instance.new("TextLabel")
EmblemText.Size = UDim2.new(1, 0, 1, 0)
EmblemText.BackgroundTransparency = 1
EmblemText.Text = "Z"
EmblemText.TextColor3 = Color3.fromRGB(255, 255, 255)
EmblemText.TextSize = 16
EmblemText.Parent = Emblem
SetModernFont(EmblemText, Enum.FontWeight.Bold, Enum.Font.GothamBold)

-- Header Titles
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 180, 0, 18)
Title.Position = UDim2.new(0, 56, 0, 16)
Title.BackgroundTransparency = 1
Title.Text = "Zynex Hub"
Title.TextColor3 = C_TEXT_PRIMARY
Title.TextSize = 17
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Main
SetModernFont(Title, Enum.FontWeight.Bold, Enum.Font.GothamBold)

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(0, 180, 0, 14)
Subtitle.Position = UDim2.new(0, 56, 0, 34)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Universal Script Hub"
Subtitle.TextColor3 = C_TEXT_MUTED
Subtitle.TextSize = 11
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Main
SetModernFont(Subtitle, Enum.FontWeight.Medium, Enum.Font.Gotham)

-- Close Button (Top Right)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -34, 0, 16)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = C_TEXT_MUTED
CloseBtn.TextSize = 14
CloseBtn.AutoButtonColor = false
CloseBtn.Parent = Main
SetModernFont(CloseBtn, Enum.FontWeight.Bold, Enum.Font.GothamBold)

-- Status Pill (Top Right, next to Close button)
local StatusPill = Instance.new("Frame")
StatusPill.AnchorPoint = Vector2.new(1, 0)
StatusPill.Position = UDim2.new(1, -44, 0, 18)
StatusPill.Size = UDim2.new(0, 105, 0, 22)
StatusPill.BackgroundColor3 = matchedGame and C_EMERALD_BG or C_CORAL_BG
StatusPill.BorderSizePixel = 0
StatusPill.Parent = Main

local PillCorner = Instance.new("UICorner")
PillCorner.CornerRadius = UDim.new(1, 0)
PillCorner.Parent = StatusPill

local PillStroke = Instance.new("UIStroke")
PillStroke.Thickness = 1
PillStroke.Color = matchedGame and C_EMERALD_LINE or C_CORAL_LINE
PillStroke.Parent = StatusPill

local PillDot = Instance.new("Frame")
PillDot.Size = UDim2.new(0, 6, 0, 6)
PillDot.Position = UDim2.new(0, 10, 0.5, -3)
PillDot.BackgroundColor3 = matchedGame and C_EMERALD or C_CORAL
PillDot.BorderSizePixel = 0
PillDot.Parent = StatusPill

local PillDotCorner = Instance.new("UICorner")
PillDotCorner.CornerRadius = UDim.new(1, 0)
PillDotCorner.Parent = PillDot

local PillText = Instance.new("TextLabel")
PillText.Size = UDim2.new(1, -22, 1, 0)
PillText.Position = UDim2.new(0, 20, 0, 0)
PillText.BackgroundTransparency = 1
PillText.Text = matchedGame and "Ready" or "Unsupported"
PillText.TextColor3 = matchedGame and C_EMERALD or C_CORAL
PillText.TextSize = 10
PillText.TextTruncate = Enum.TextTruncate.AtEnd
PillText.TextXAlignment = Enum.TextXAlignment.Left
PillText.Parent = StatusPill
SetModernFont(PillText, Enum.FontWeight.SemiBold, Enum.Font.GothamMedium)

-- Detected Game Card
local GameCard = Instance.new("Frame")
GameCard.Size = UDim2.new(1, -40, 0, 52)
GameCard.Position = UDim2.new(0, 20, 0, 62)
GameCard.BackgroundColor3 = C_BG_SURFACE
GameCard.BorderSizePixel = 0
GameCard.Parent = Main

local GameCardCorner = Instance.new("UICorner")
GameCardCorner.CornerRadius = UDim.new(0, 10)
GameCardCorner.Parent = GameCard

local GameCardStroke = Instance.new("UIStroke")
GameCardStroke.Thickness = 1
GameCardStroke.Color = C_BORDER
GameCardStroke.Parent = GameCard

local GameCardEyebrow = Instance.new("TextLabel")
GameCardEyebrow.Size = UDim2.new(1, -80, 0, 12)
GameCardEyebrow.Position = UDim2.new(0, 14, 0, 9)
GameCardEyebrow.BackgroundTransparency = 1
GameCardEyebrow.Text = "ACTIVE GAME"
GameCardEyebrow.TextColor3 = C_TEXT_MUTED
GameCardEyebrow.TextSize = 9
GameCardEyebrow.TextXAlignment = Enum.TextXAlignment.Left
GameCardEyebrow.Parent = GameCard
SetModernFont(GameCardEyebrow, Enum.FontWeight.Bold, Enum.Font.GothamBold)

local GameCardName = Instance.new("TextLabel")
GameCardName.Size = UDim2.new(1, -90, 0, 18)
GameCardName.Position = UDim2.new(0, 14, 0, 23)
GameCardName.BackgroundTransparency = 1
GameCardName.Text = matchedGame and matchedGame.name or ("Game ID: " .. tostring(currentPlaceId))
GameCardName.TextColor3 = matchedGame and C_TEXT_PRIMARY or C_CORAL
GameCardName.TextSize = 14
GameCardName.TextTruncate = Enum.TextTruncate.AtEnd
GameCardName.TextXAlignment = Enum.TextXAlignment.Left
GameCardName.Parent = GameCard
SetModernFont(GameCardName, Enum.FontWeight.Bold, Enum.Font.GothamBold)

local ModeBadge = Instance.new("TextLabel")
ModeBadge.AnchorPoint = Vector2.new(1, 0.5)
ModeBadge.Position = UDim2.new(1, -12, 0.5, 0)
ModeBadge.Size = UDim2.new(0, 72, 0, 22)
ModeBadge.BackgroundColor3 = Color3.fromRGB(30, 41, 59)
ModeBadge.Text = "KEY LOCK"
ModeBadge.TextColor3 = Color3.fromRGB(147, 197, 253)
ModeBadge.TextSize = 10
ModeBadge.Parent = GameCard
SetModernFont(ModeBadge, Enum.FontWeight.SemiBold, Enum.Font.GothamBold)

local ModeBadgeCorner = Instance.new("UICorner")
ModeBadgeCorner.CornerRadius = UDim.new(0, 6)
ModeBadgeCorner.Parent = ModeBadge

-- Key Input Section
local KeySection = Instance.new("Frame")
KeySection.Size = UDim2.new(1, -40, 0, 44)
KeySection.Position = UDim2.new(0, 20, 0, 126)
KeySection.BackgroundColor3 = C_BG_SURFACE
KeySection.BorderSizePixel = 0
KeySection.Parent = Main

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 10)
KeyCorner.Parent = KeySection

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Thickness = 1
KeyStroke.Color = C_BORDER
KeyStroke.Parent = KeySection

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(1, -24, 1, 0)
KeyInput.Position = UDim2.new(0, 12, 0, 0)
KeyInput.BackgroundTransparency = 1
KeyInput.Text = ""
KeyInput.PlaceholderText = "Paste your Zynex key here..."
KeyInput.PlaceholderColor3 = C_TEXT_MUTED
KeyInput.TextColor3 = C_TEXT_PRIMARY
KeyInput.TextSize = 13
KeyInput.ClearTextOnFocus = false
KeyInput.TextXAlignment = Enum.TextXAlignment.Left
KeyInput.Parent = KeySection
SetModernFont(KeyInput, Enum.FontWeight.Regular, Enum.Font.Gotham)

KeyInput.Focused:Connect(function()
    TweenService:Create(KeyStroke, TweenInfo.new(0.2), { Color = C_INDIGO }):Play()
end)

KeyInput.FocusLost:Connect(function()
    TweenService:Create(KeyStroke, TweenInfo.new(0.2), { Color = C_BORDER }):Play()
end)

-- Status / Helper Message Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -40, 0, 18)
StatusLabel.Position = UDim2.new(0, 20, 0, 178)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Click \"Get Key\" to generate your 24-hour verification key."
StatusLabel.TextColor3 = C_TEXT_MUTED
StatusLabel.TextSize = 11
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = Main
SetModernFont(StatusLabel, Enum.FontWeight.Medium, Enum.Font.GothamMedium)

-- Action Buttons Container
local ButtonContainer = Instance.new("Frame")
ButtonContainer.Size = UDim2.new(1, -40, 0, 38)
ButtonContainer.Position = UDim2.new(0, 20, 1, -56)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Parent = Main

local BtnList = Instance.new("UIListLayout")
BtnList.FillDirection = Enum.FillDirection.Horizontal
BtnList.HorizontalAlignment = Enum.HorizontalAlignment.Right
BtnList.VerticalAlignment = Enum.VerticalAlignment.Center
BtnList.Padding = UDim.new(0, 8)
BtnList.Parent = ButtonContainer

-- Discord Button
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Size = UDim2.new(0, 95, 1, 0)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(30, 34, 46)
DiscordBtn.BorderSizePixel = 0
DiscordBtn.Text = "Discord"
DiscordBtn.TextColor3 = Color3.fromRGB(165, 180, 252)
DiscordBtn.TextSize = 12
DiscordBtn.AutoButtonColor = false
DiscordBtn.Parent = ButtonContainer
SetModernFont(DiscordBtn, Enum.FontWeight.SemiBold, Enum.Font.GothamBold)

local DiscordCorner = Instance.new("UICorner")
DiscordCorner.CornerRadius = UDim.new(0, 8)
DiscordCorner.Parent = DiscordBtn

local DiscordStroke = Instance.new("UIStroke")
DiscordStroke.Thickness = 1
DiscordStroke.Color = Color3.fromRGB(45, 52, 70)
DiscordStroke.Parent = DiscordBtn

DiscordBtn.MouseEnter:Connect(function()
    TweenService:Create(DiscordBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(40, 46, 62) }):Play()
end)
DiscordBtn.MouseLeave:Connect(function()
    TweenService:Create(DiscordBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(30, 34, 46) }):Play()
end)

DiscordBtn.MouseButton1Click:Connect(function()
    CopyToClipboard(DISCORD_URL)
    StatusLabel.Text = "Discord invite copied to clipboard!"
    StatusLabel.TextColor3 = Color3.fromRGB(129, 140, 248)
end)

-- Get Key Button
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0, 105, 1, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(67, 56, 202)
GetKeyBtn.BorderSizePixel = 0
GetKeyBtn.Text = "Get Key"
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.TextSize = 12
GetKeyBtn.AutoButtonColor = false
GetKeyBtn.Parent = ButtonContainer
SetModernFont(GetKeyBtn, Enum.FontWeight.SemiBold, Enum.Font.GothamBold)

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 8)
GetKeyCorner.Parent = GetKeyBtn

GetKeyBtn.MouseEnter:Connect(function()
    TweenService:Create(GetKeyBtn, TweenInfo.new(0.15), { BackgroundColor3 = C_INDIGO_HOVER }):Play()
end)
GetKeyBtn.MouseLeave:Connect(function()
    TweenService:Create(GetKeyBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(67, 56, 202) }):Play()
end)

GetKeyBtn.MouseButton1Click:Connect(function()
    CopyToClipboard(FLOW_URL)
    StatusLabel.Text = "Key link copied to clipboard! Paste it into your browser."
    StatusLabel.TextColor3 = C_EMERALD
end)

-- Submit Key Button
local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0, 115, 1, 0)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(16, 185, 129)
SubmitBtn.BorderSizePixel = 0
SubmitBtn.Text = "Submit Key"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 12
SubmitBtn.AutoButtonColor = false
SubmitBtn.Parent = ButtonContainer
SetModernFont(SubmitBtn, Enum.FontWeight.Bold, Enum.Font.GothamBold)

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 8)
SubmitCorner.Parent = SubmitBtn

SubmitBtn.MouseEnter:Connect(function()
    TweenService:Create(SubmitBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(52, 211, 153) }):Play()
end)
SubmitBtn.MouseLeave:Connect(function()
    TweenService:Create(SubmitBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(16, 185, 129) }):Play()
end)

-- Smooth Exit Animation
local function SmoothExit(callback)
    TweenService:Create(Blur, TweenInfo.new(0.35), { Size = 0 }):Play()
    TweenService:Create(MainScale, TweenInfo.new(0.3), { Scale = 0.95 }):Play()
    TweenService:Create(Main, TweenInfo.new(0.3), {
        Position = UDim2.new(0.5, 0, 0.5, 10),
        GroupTransparency = 1
    }):Play()
    task.delay(0.35, function()
        ScreenGui:Destroy()
        Blur:Destroy()
        if callback then callback() end
    end)
end

CloseBtn.MouseButton1Click:Connect(function()
    SmoothExit()
end)

-- Key Submission Logic
local isChecking = false
SubmitBtn.MouseButton1Click:Connect(function()
    if isChecking then return end
    local candidate = KeyInput.Text:match("^%s*(.-)%s*$")
    if not candidate or candidate == "" then
        StatusLabel.Text = "Please paste a key into the input field first."
        StatusLabel.TextColor3 = C_CORAL
        return
    end

    if not matchedGame then
        StatusLabel.Text = "Cannot submit: this game is not supported."
        StatusLabel.TextColor3 = C_CORAL
        return
    end

    isChecking = true
    SubmitBtn.Text = "Checking..."
    StatusLabel.Text = "Verifying key with JNKIE servers..."
    StatusLabel.TextColor3 = Color3.fromRGB(147, 197, 253)

    task.spawn(function()
        local valid, msg = ValidateKey(candidate)
        if valid then
            StatusLabel.Text = "Key verified! Launching Zynex Hub..."
            StatusLabel.TextColor3 = C_EMERALD
            SubmitBtn.Text = "Verified!"
            SubmitBtn.BackgroundColor3 = C_EMERALD

            task.wait(0.6)
            SmoothExit(function()
                LaunchGameScript(candidate)
            end)
        else
            StatusLabel.Text = msg or "Key invalid or expired. Please get a new key."
            StatusLabel.TextColor3 = C_CORAL
            SubmitBtn.Text = "Submit Key"
            isChecking = false
        end
    end)
end)

-- Draggable Window Implementation
local isDragging = false
local dragStart = Vector3.new()
local startPos = UDim2.new()
local dragInput = nil

Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = true
        dragStart = input.Position
        startPos = Main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                isDragging = false
            end
        end)
    end
end)

Main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and isDragging then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- Entrance Animation
TweenService:Create(Blur, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = 10 }):Play()
TweenService:Create(MainScale, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Scale = 1 }):Play()
TweenService:Create(Main, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, 0, 0.5, 0),
    GroupTransparency = 0
}):Play()
