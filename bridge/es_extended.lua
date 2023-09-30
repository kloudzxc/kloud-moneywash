if GetResourceState('es_extended') ~= 'started' then return end
ESX = exports["es_extended"]:getSharedObject()
AddMoney = function (src, type, amount)
    local Player = ESX.GetPlayerFromId(src)
    
    if type == "cash" then
        type = "money"
    end
    
    Player.addAccountMoney(type, amount)

    return true
end

GetPlayer = function (src)
    return ESX.GetPlayerFromId(src)
end


LogWash = function (src, itemName, itemAmount, worth)
    local Player = ESX.GetPlayerFromId(src)
    local Identifier = Player.getIdentifier()
    local PlayerName = Player.getName()

    Log('**Name:** '..PlayerName..'\n**Identifier:** '..Identifier..' \nWashed x'..itemAmount..' '..itemName..' worth $**'..worth..'**')
end

LogWarn = function (src, msg)
    local Player = ESX.GetPlayerFromId(src)
    local Identifier = Player.getIdentifier()
    local PlayerName = Player.getName()

    Log('**Name:** '..PlayerName..'\n**Identifier:** '..Identifier..' \n'..msg)
end