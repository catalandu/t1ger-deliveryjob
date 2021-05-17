local access = false

CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(0) end
    TriggerServerEvent('loaf_test:getAccess')
	while not access do Wait(0) end
	
	deliveryPos 		= {}
	deliveryNum 		= 0
	vehBodyHealth 		= 0
	parcelPrice 		= 0

	function SetDeliveryRoute(jobValue)
		local id = 0
		if jobValue == 1 then 
			id = math.random(#Config.LowValueJobs)
			while Config.LowValueJobs[id].done do 
				id = math.random(#Config.LowValueJobs)
			end
			deliveryPos = Config.LowValueJobs[id].pos
		elseif jobValue == 2 then 
			id = math.random(#Config.MedValueJobs[commerical].deliveries)
			while Config.MedValueJobs[commerical].deliveries[id].done do 
				id = math.random(#Config.MedValueJobs[commerical].deliveries)
			end
			deliveryPos = Config.MedValueJobs[commerical].deliveries[id].pos
		end
		deliveryNum = id
		SetDeliveryBlip(deliveryPos[1], deliveryPos[2], deliveryPos[3])
		vehBodyHealth = GetVehicleBodyHealth(jobVehicle)
		parcelPrice = calculatePrice(jobValue)
    end
    
    function SetShopRoute(jobValue, orderData)
        local order = orderData.data
        deliveryPos = order.pos 
		SetDeliveryBlip(deliveryPos[1], deliveryPos[2], deliveryPos[3])
		vehBodyHealth = GetVehicleBodyHealth(jobVehicle)
        parcelPrice = calculatePrice(jobValue)
	end
	
	dropOffPos			= {}
	dropOffPallet		= {}
	currentRoute		= 0
	truckHealth			= 0
	palletPrice			= 0

	function SetTruckingRoute()
		local quickLoop = Config.HighValueJobs[jobNum].route
		for i = 1, #quickLoop, 1 do 
			if not quickLoop[i].done then
				dropOffPos = quickLoop[i].pos
				dropOffPallet = quickLoop[i].pallet
				currentRoute = i
			end
		end
		SetTruckingBlip(dropOffPos[1], dropOffPos[2], dropOffPos[3])
		truckHealth = GetVehicleBodyHealth(jobVehicle)
		palletPrice = calculatePrice(3)
	end

end)

RegisterNetEvent('loaf_test:setAccess')
AddEventHandler('loaf_test:setAccess', function(res)
    access = res
end)  --[[  
██╗░░░██╗██████╗░██╗░░░░░███████╗░█████╗░██╗░░██╗░██████╗
██║░░░██║██╔══██╗██║░░░░░██╔════╝██╔══██╗██║░██╔╝██╔════╝
██║░░░██║██████╔╝██║░░░░░█████╗░░███████║█████═╝░╚█████╗░
██║░░░██║██╔═══╝░██║░░░░░██╔══╝░░██╔══██║██╔═██╗░░╚═══██╗
╚██████╔╝██║░░░░░███████╗███████╗██║░░██║██║░╚██╗██████╔╝
░╚═════╝░╚═╝░░░░░╚══════╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░
█████████████████████████████████████████████████████████
discord.gg/6CRxjqZJFB ]]--