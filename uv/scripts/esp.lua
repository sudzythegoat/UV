local Players = game:GetService("Players")
local function highlightCharacter(character)
  if character:FindFirstChildOfClass("Highlight") then return end
  local highlight = Instance.new("Highlight")
  highlight.Parent = character
  highlight.FillColor = Color3.fromRGB(255, 56, 56)
  highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
end

local function updateHighlights()
  for _, player in ipairs(Players:GetPlayers()) do
    local character = player.Character or player.CharacterAdded:Wait()
    highlightCharacter(character)
  end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        highlightCharacter(character)
    end)
end)
