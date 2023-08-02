if GetResourceState('qb-core') ~= 'started' then return end
QBCore = exports["qb-core"]:GetCoreObject()
AddMoney = function (src, type, amount)
    local Player = QBCore.Functions.GetPlayer(src)

    return Player.Functions.AddMoney(type, amount)
end

GetPlayer = function (src)
    return QBCore.Functions.GetPlayer(src)
end

LogWash = function (src, itemName, itemAmount, worth)
    local Player = QBCore.Functions.GetPlayer(src)
    local Identifier = QBCore.Functions.GetIdentifier(src, 'license')
    local PlayerName = Player.PlayerData.charinfo.firstname ..' '.. Player.PlayerData.charinfo.lastname

    Log('**Name:** '..PlayerName..'\n**Citizen ID:** '..Player.PlayerData.citizenid..'\n**Identifier:** '..Identifier..' \nWashed x'..itemAmount..' '..itemName..' worth $**'..worth..'**')
end

LogWarn = function (src, msg)
    local Player = QBCore.Functions.GetPlayer(src)
    local Identifier = QBCore.Functions.GetIdentifier(src, 'license')
    local PlayerName = Player.PlayerData.charinfo.firstname ..' '.. Player.PlayerData.charinfo.lastname

    Log('**Name:** '..PlayerName..'\n**Citizen ID:** '..Player.PlayerData.citizenid..'\n**Identifier:** '..Identifier..' \n'..msg)
end