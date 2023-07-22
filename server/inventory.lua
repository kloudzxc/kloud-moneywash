if WashInventory == "ox_inventory" then
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
else
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
                if data.name == 'markedbills' then
                    count = count + data.amount
                end
            end
        end
        
        return count
    end
end