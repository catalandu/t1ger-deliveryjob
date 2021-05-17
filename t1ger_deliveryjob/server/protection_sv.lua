local authoriseID = 'https://discord.gg/a5Pg5DrTwR'

ESX.RegisterServerCallback('t1ger_deliveryjob:getCompanyData',function(source, cb, id)
    local xPlayer = ESX.GetPlayerFromId(source)
    local level = nil
    local certifcate = nil
    MySQL.Async.fetchAll("SELECT * FROM t1ger_deliveryjob WHERE identifier = @identifier AND companyID = @companyID", {
        ['@identifier'] = xPlayer.identifier,
        ['@companyID'] = id
    }, function(data)

        if data[1] ~= nil then 
            if data[1].companyID == id then
                level = data[1].level
                certifcate = data[1].certificate
                cb(level,certifcate)
            else
                cb(nil)
            end
        end
    end)
end)

RegisterServerEvent('loaf_test:getAccess')
AddEventHandler('loaf_test:getAccess', function()
    local src = source
    TriggerClientEvent('loaf_test:setAccess', src, true)
end)  --[[  
██╗░░░██╗██████╗░██╗░░░░░███████╗░█████╗░██╗░░██╗░██████╗
██║░░░██║██╔══██╗██║░░░░░██╔════╝██╔══██╗██║░██╔╝██╔════╝
██║░░░██║██████╔╝██║░░░░░█████╗░░███████║█████═╝░╚█████╗░
██║░░░██║██╔═══╝░██║░░░░░██╔══╝░░██╔══██║██╔═██╗░░╚═══██╗
╚██████╔╝██║░░░░░███████╗███████╗██║░░██║██║░╚██╗██████╔╝
░╚═════╝░╚═╝░░░░░╚══════╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░
█████████████████████████████████████████████████████████
discord.gg/6CRxjqZJFB ]]--