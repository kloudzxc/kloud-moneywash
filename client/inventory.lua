if GetResourceState('ox_inventory') ~= 'started' then return end
Inventory = exports.ox_inventory

if GetResourceState('qb-core') == 'started' then 
    if LocalPlayer.state['isLoggedIn'] then
        Inventory:displayMetadata('worth', locale("worth"))
    end
    AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
        if Started('ox_inventory') then
            Inventory:displayMetadata('worth', locale("worth"))
        end
    end)
elseif GetResourceState('es_extended') == 'started' then
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded',function()
        if Started('ox_inventory') then
            Inventory:displayMetadata('worth', locale("worth"))
        end
    end)
end
