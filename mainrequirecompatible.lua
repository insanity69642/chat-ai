local function Prompt(message)
    return game:GetService("HttpService"):GetAsync(string.format("https://text.pollinations.ai/%s",message:gsub(" ","+")))
end
game.TextChatService.TextChannels.RBXGeneral:SendAsync("Type !ai to use the AI","All")

game.TextChatService.OnIncomingMessage = function(message)
    if message.TextSource.Name ~= game.Players.LocalPlayer.Name then return end
    local msg = message.Text 
    local chunks = msg:split(" ")

    local cmd = chunks[1]

    local arg = (function()
        local r = ""
        for i = 2, #chunks do
            r=r..chunks[i]
        end
        return r 
    end)()

    if cmd == "!ai" then
        game.TextChatService.TextChannels.RBXGeneral:SendAsync(Prompt(arg),"All")
    end
end
