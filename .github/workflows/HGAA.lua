wait()

local randomOption = math.random(1, 2)
local defaultChatEvents = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents

if randomOption == 1 then
    defaultChatEvents.TextLabel.Text = "gg/scentedcondo"
    defaultChatEvents.Frame.Draggable.ssa.Text = "gg/scentedcondo"
else
    defaultChatEvents.TextLabel.Text = "gg/skeetcons"
    defaultChatEvents.Frame.Draggable.ssa.Text = "gg/skeetcons"
end
