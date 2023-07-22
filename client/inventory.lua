if WashInventory == "ox_inventory" then
    Inventory = exports.ox_inventory
    if LocalPlayer.state['isLoggedIn'] then
        Inventory:displayMetadata('worth', 'Worth')
    end
    
    AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
        if Started(WashInventory) then
            Inventory:displayMetadata('worth', 'Worth')
        end
    end)
end