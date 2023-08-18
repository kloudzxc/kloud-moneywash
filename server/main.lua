local Webhook = "DiscordWebhookHere"

lib.locale()

Ban = function (src, msg)
    if Wash.Ban then
        DropPlayer(src, msg)
    else
        LogWarn(src, msg)
    end
end

Log = function(message)
    if not Wash.Log then
        print(message)
        return
    end
    PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({
        username = 'Kloud Money Wash Logs',
        embeds = {{
            ["color"] = 16711680,
            ["author"] = {
                ["name"] = "Kloud Logs",
                ["icon_url"] = "https://cdn.discordapp.com/icons/1131198002976014377/9e191b290aa827226e676fb433bbfe65.webp"
            },
            ["title"] = '',
            ["description"] = message
        }}, 
        avatar_url = 'https://cdn.discordapp.com/icons/1131198002976014377/9e191b290aa827226e676fb433bbfe65.webp'
    }), {
        ['Content-Type'] = 'application/json'
    })
end

lib.callback.register('kloud-moneywash:server:checkitem', function(source)
    local src = source
    local itemName = Wash.Item
    local markedBillsCount = GetItemCount(src, itemName, {}, false)
    
    if markedBillsCount > 0 then
        return markedBillsCount
    end
    
    return markedBillsCount
end)

