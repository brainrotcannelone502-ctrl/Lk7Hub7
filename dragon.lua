local function TransformarBloco()
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("TextLabel") then
            local textLower = string.lower(v.Text)
            
            if string.find(textLower, "dragon luck block") and v.TextColor3 == Color3.new(1, 0, 0) then
                v.Text = "Cyber"
                v.TextColor3 = Color3.fromRGB(0, 255, 255)
            end

            if string.find(textLower, "secret") or string.find(textLower, "og dragon") then
                v.Text = "DRAGON LUCK BLOCK"
                v.TextColor3 = Color3.new(1, 0.84, 0)
            end

            if string.find(textLower, "lucky block") then
                v.Visible = true
            end
        end

        if v:IsA("ParticleEmitter") or v:IsA("SelectionBox") then
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

print("Dragon Luck Visual v3 Loaded")
