if GetResourceState('qb-inventory') ~= 'started' then return end
QBCore = exports["qb-core"]:GetCoreObject()
AddItem = function (source, item, amount, slot)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem(item, amount, slot)
end

RemoveItem = function (source, item, amount, slot)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(item, amount, slot)
end

GetItemCount = function (source, item, metadata, strict)
    local Player = QBCore.Functions.GetPlayer(source)
    local count = 0
    for slot, data in pairs(Player.PlayerData.items) do
        if data ~= nil then
            if data.name == Wash.Item then
                count = count + data.amount
            end
        end
    end
    
    return count
end

RegisterNetEvent('kloud-moneywash:server:success', function()
    local src = source
    local itemName = Wash.Item
    local Player = GetPlayer(src)
    local PlayerName = GetPlayerName(src)
    
    local itemWorth = 0
    local itemAmount = 0

    for slot, data in pairs(Player.PlayerData.items) do
        if data == nil then return end
        
        if data.name ~= Wash.Item then return end
        
        if data.info.worth and Wash.Metadata then
            itemWorth = itemWorth + (data.info.worth * data.amount)
            itemAmount = itemAmount + data.amount
            if not RemoveItem(src, Wash.Item, data.amount, slot) then Ban(src, 'Attempted Exploit!') return end
            
            AddMoney(src, 'cash', math.floor(itemWorth * Wash.Tax))
            SVNotify(src, locale('wash_success', math.floor(itemWorth * Wash.Tax)), 'success')
            LogWash(src, itemName, itemAmount, math.floor(itemWorth * Wash.Tax))

        elseif not data.info.worth and not Wash.Metadata then
            itemWorth = itemWorth + (data.info.worth * data.amount)
            itemAmount = itemAmount + data.amount
            
            if not RemoveItem(src, Wash.Item, data.amount, slot) then Ban(src, 'Attempted Exploit!') return end
            
            AddMoney(src, 'cash', math.floor(itemWorth * Wash.Tax))
            SVNotify(src, locale('wash_success', math.floor(itemWorth * Wash.Tax)), 'success')
            LogWash(src, itemName, itemAmount, math.floor(itemWorth * Wash.Tax))
        else
            Ban(src, 'Attempted Exploit!')
        end
    end
end)