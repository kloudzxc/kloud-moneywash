if GetResourceState('es_extended') ~= 'started' then return end
ESX = exports["es_extended"]:getSharedObject()
AddMoney = function (src, type, amount)
    local Player = ESX.GetPlayerFromId(src)

    return Player.addAccountMoney(type, amount)
end

GetPlayer = function (src)
    return ESX.GetPlayerFromId(src)
end
