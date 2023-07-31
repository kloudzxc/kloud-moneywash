if GetResourceState('qb-core') ~= 'started' then return end
QBCore = exports["qb-core"]:GetCoreObject()
AddMoney = function (src, type, amount)
    local Player = QBCore.Functions.GetPlayer(src)

    return Player.Functions.AddMoney(type, amount)
end

GetPlayer = function (src)
    return QBCore.Functions.GetPlayer(src)
end