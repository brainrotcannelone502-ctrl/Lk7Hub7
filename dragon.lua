local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Configurações da Janela
ScreenGui.Parent = game.CoreGui
MainFrame.Name = "DragonPanel"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.05, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 150, 0, 50)
MainFrame.Active = true
MainFrame.Draggable = true -- Você pode arrastar o painel

UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Configurações do Botão
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Parent = MainFrame
ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
ToggleBtn.Size = UDim2.new(0.9, 0, 0.8, 0)
ToggleBtn.Position = UDim2.new(0.05, 0, 0.1, 0)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.Text = "DESLIGADO"
ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
ToggleBtn.TextSize = 18

local Ativado = false

-- Função Principal do Script (Sua lógica anterior)
local function Transformar()
    if not Ativado then return end
    
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("TextLabel") then
            local textLower = string.lower(v.Text)
            if string.find(textLower, "cyber") then
                v.Text = "Cyber"
                v.TextColor3 = Color3.fromRGB(0, 255, 255)
            end
            if v.Text == "Lucky Block" then v.Visible = false end
            if string.find(textLower, "secret") or string.find(textLower, "dragon luck block") then
                v.Text = "DRAGON LUCK BLOCK"
                v.TextColor3 = Color3.new(1, 0.84, 0)
            end
        end
        
        if v.Name == "Cyber" and v:IsA("BasePart") then
            if not v:FindFirstChild("FogoDragon") then
                local f = Instance.new("Fire", v)
                f.Name = "FogoDragon"
                f.Color = Color3.new(1, 0, 0)
                f.Size = 6
            end
        end
    end
end

-- Evento do Botão
ToggleBtn.MouseButton1Click:Connect(function()
    Ativado = not Ativado
    if Ativado then
        ToggleBtn.Text = "LIGADO"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
    else
        ToggleBtn.Text = "DESLIGADO"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        -- Limpa o fogo ao desligar
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "FogoDragon" then v:Destroy() end
        end
    end
end)

task.spawn(function()
    while true do
        pcall(Transformar)
        task.wait(1)
    end
end)
