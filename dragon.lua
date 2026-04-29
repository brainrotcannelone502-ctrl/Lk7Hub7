local function TransformarBloco()
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("TextLabel") then
            local textLower = string.lower(v.Text)
            if string.find(textLower, "cyber") or string.find(textLower, "lucky") then
                v.Text = "DRAGON LUCK BLOCK"
                v.TextColor3 = Color3.new(1, 0, 0)
            end
            if string.find(textLower, "secret") then
                v.Text = "OG DRAGON"
                v.TextColor3 = Color3.new(1, 0.84, 0)
            end
        end
        if v:IsA("ParticleEmitter") or v:IsA("SelectionBox") then
            v.Color = ColorSequence.new(Color3.new(1, 0, 0))
        end
        if v:IsA("MeshPart") or v:IsA("Part") then
            if v:FindFirstChildOfClass("BillboardGui") then
                v.Color = Color3.new(0.2, 0, 0)
            end
        end
    end
end

task.spawn(function()
    while true do
        pcall(TransformarBloco)
        task.wait(2)
    end
end)

print("Dragon Luck Visual Loaded")
