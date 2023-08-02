if GetResourceState('ox_inventory') ~= 'started' then return end

Inventory = exports.ox_inventory

AddItem = function (source, item, amount)
    return Inventory:AddItem(source, item, amount)
end

RemoveItem = function (source, item, amount)
    return Inventory:RemoveItem(source, item, amount)
end

GetItemCount = function (source, item, metadata, strict)
    return Inventory:GetItemCount(source, item, metadata, strict)
end

GetInventoryItems = function (source)
    return Inventory:GetInventoryItems(source)
end

RegisterNetEvent('kloud-moneywash:server:success', function()
    local src = source
    local itemName = Wash.Item
    local Player = GetPlayer(src)
    local PlayerName = GetPlayerName(src)
    
    local itemWorth = 0
    local itemAmount = 0
    
    local playerItems = GetInventoryItems(src)
    
    for slot, data in pairs(playerItems) do
        if data == nil then return end
        
        if data.name == itemName then
            if data.metadata.worth and Wash.Metadata then
                itemAmount = itemAmount + data.count
                itemWorth = itemWorth + (data.metadata.worth * data.count)
                if not RemoveItem(src, itemName, itemAmount) then Ban(src, 'Attempted Exploit!') return end
                
                AddMoney(src, 'cash', math.floor(itemWorth * Wash.Tax))
                SVNotify(src, 'You\'ve successfully washed $'..math.floor(itemWorth * Wash.Tax), 'success')
                LogWash(src, itemName, itemAmount, math.floor(itemWorth * Wash.Tax))

            elseif not data.metadata.worth and not Wash.Metadata then
                itemAmount = itemAmount + data.count
                itemWorth = itemWorth + (100 * itemAmount)
                
                if not RemoveItem(src, itemName, data.count) then Ban(src, 'Attempted Exploit!') return end
                
                AddMoney(src, 'cash', math.floor(itemWorth * Wash.Tax))
                SVNotify(src, 'You\'ve successfully washed $'..math.floor(itemWorth * Wash.Tax), 'success')
                LogWash(src, itemName, itemAmount, math.floor(itemWorth * Wash.Tax))
            else
                Ban(src, 'Attempted Exploit!')
            end
        end
    end
end)
    