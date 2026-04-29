local function AdicionarFogo(bloco)
    if not bloco:FindFirstChild("FogoDragon") then
        local fogo = Instance.new("Fire")
        fogo.Name = "FogoDragon"
        fogo.Color = Color3.new(1, 0, 0)
        fogo.SecondaryColor = Color3.new(0.5, 0, 0)
        fogo.Heat = 9
        fogo.Size = 6
        fogo.Parent = bloco
        
        local p = Instance.new("ParticleEmitter")
        p.Name = "RastroDragon"
        p.Color = ColorSequence.new(Color3.new(1, 0, 0))
        p.Size = NumberSequence.new(0.5, 2)
        p.Texture = "rbxassetid://243691238"
        p.Lifetime = NumberRange.new(0.5, 1)
        p.Speed = NumberRange.new(5, 10)
        p.VelocityInheritance = 0.5
        p.EmissionDirection = Enum.NormalId.Top
        p.Parent = bloco
    end
end

local function TransformarBloco()
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("TextLabel") then
            local textLower = string.lower(v.Text)
            if string.find(textLower, "cyber") then
                v.Text = "Cyber"
                v.TextColor3 = Color3.fromRGB(0, 255, 255)
            end
            if v.Text == "Lucky Block" then v.Visible = false end
            if string.find(textLower, "secret") or string.find(textLower, "og dragon") or string.find(textLower, "dragon luck block") then
                if v.TextColor3 ~= Color3.fromRGB(0, 255, 255) then
                    v.Text = "DRAGON LUCK BLOCK"
                    v.TextColor3 = Color3.new(1, 0.84, 0)
                end
            end
        end

        if v.Name == "Cyber" and v:IsA("BasePart") then
            AdicionarFogo(v)
        end

        if v:IsA("ParticleEmitter") and v.Name ~= "RastroDragon" or v:IsA("SelectionBox") then
            v.Color = ColorSequence.new(Color3.new(1, 0, 0))
        end
    end
end

task.spawn(function()
    while true do
        pcall(TransformarBloco)
        task.wait(2)
    end
end)

print("Dragon Luck - Fire Edition Loaded")
