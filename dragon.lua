local function TransformarBloco()
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("TextLabel") then
            local textLower = string.lower(v.Text)
            
            if string.find(textLower, "cyber") then
                v.Text = "Cyber"
                v.TextColor3 = Color3.fromRGB(0, 255, 255)
                v.Visible = true
            end

            if v.Text == "Lucky Block" then
                v.Visible = false
            end

            if string.find(textLower, "secret") or string.find(textLower, "og dragon") or string.find(textLower, "dragon luck block") then
                if v.TextColor3 ~= Color3.fromRGB(0, 255, 255) then
                    v.Text = "DRAGON LUCK BLOCK"
                    v.TextColor3 = Color3.new(1, 0.84, 0)
                    v.Visible = true
                end
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

print("Dragon Luck Visual v4 - Clean Loaded")
