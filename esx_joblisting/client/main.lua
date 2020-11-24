local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

local menuIsShowed = false
local isInMarkerMiner = false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)



-- Activate menu when player is inside marker, and draw markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		local coords = GetEntityCoords(PlayerPedId())
		isInMarkerMiner = false
		isInMarkerFueler = false
		isInMarkerLumberjack = false
		isInMarkerfisherman = false
		isInMarkerslaughterer = false
		isInMarkertailor = false

		for i=1, #Config.Miner, 1 do
			local distance = GetDistanceBetweenCoords(coords, Config.Miner[i], true)

			if distance < Config.DrawDistance then
				DrawMarker(Config.MarkerType, Config.Miner[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end

			if distance < (Config.ZoneSize.x / 2) then
				isInMarkerMiner = true
				ESX.ShowHelpNotification(_U('access_miner_center'))
			end
		end

		for i=1, #Config.Fueler, 1 do
			local distance = GetDistanceBetweenCoords(coords, Config.Fueler[i], true)

			if distance < Config.DrawDistance then
				DrawMarker(Config.MarkerType, Config.Fueler[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end

			if distance < (Config.ZoneSize.x / 2) then
				isInMarkerFueler = true
				ESX.ShowHelpNotification(_U('access_fueler_center'))
			end
		end

		for i=1, #Config.Lumberjack, 1 do
			local distance = GetDistanceBetweenCoords(coords, Config.Lumberjack[i], true)

			if distance < Config.DrawDistance then
				DrawMarker(Config.MarkerType, Config.Lumberjack[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end

			if distance < (Config.ZoneSize.x / 2) then
				isInMarkerLumberjack = true
				ESX.ShowHelpNotification(_U('access_lumberjack_center'))
			end
		end

		for i=1, #Config.fisherman, 1 do
			local distance = GetDistanceBetweenCoords(coords, Config.fisherman[i], true)

			if distance < Config.DrawDistance then
				DrawMarker(Config.MarkerType, Config.fisherman[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end

			if distance < (Config.ZoneSize.x / 2) then
				isInMarkerfisherman = true
				ESX.ShowHelpNotification(_U('access_fisherman_center'))
			end
		end

		for i=1, #Config.slaughterer, 1 do
			local distance = GetDistanceBetweenCoords(coords, Config.slaughterer[i], true)

			if distance < Config.DrawDistance then
				DrawMarker(Config.MarkerType, Config.slaughterer[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end

			if distance < (Config.ZoneSize.x / 2) then
				isInMarkerslaughterer = true
				ESX.ShowHelpNotification(_U('access_slaughterer_center'))
			end
		end
	end
end)

Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_m_y_business_03"))
	
    while not HasModelLoaded(GetHashKey("a_m_y_business_03")) do
        Wait(1)
    end
	
		for _, item in pairs(Config.Locations) do
			local npc = CreatePed(4, 0xA1435105, item.x, item.y, item.z, item.h, false, true)
			
			
			SetEntityHeading(npc, item.h)
			FreezeEntityPosition(npc, true)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			TaskStartScenarioInPlace(npc, "WORLD_HUMAN_STAND_MOBILE_UPRIGHT", 0, true)
		end
end)

-- Create blips for All Job Bosses
Citizen.CreateThread(function()
	for i=1, #Config.Miner, 1 do
		local blip = AddBlipForCoord(Config.Miner[i])

		SetBlipSprite (blip, 407)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, 27)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName('Boss | Miner')
		EndTextCommandSetBlipName(blip)
	end
	for i=1, #Config.Fueler, 1 do
		local blip = AddBlipForCoord(Config.Fueler[i])

		SetBlipSprite (blip, 407)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, 27)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName('Boss | Fueler')
		EndTextCommandSetBlipName(blip)
	end
	for i=1, #Config.Lumberjack, 1 do
		local blip = AddBlipForCoord(Config.Lumberjack[i])

		SetBlipSprite (blip, 407)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, 27)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName('Boss | Lumberjack')
		EndTextCommandSetBlipName(blip)
	end
	for i=1, #Config.fisherman, 1 do
		local blip = AddBlipForCoord(Config.fisherman[i])

		SetBlipSprite (blip, 407)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, 27)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName('Boss | Fisherman')
		EndTextCommandSetBlipName(blip)
	end
	for i=1, #Config.slaughterer, 1 do
		local blip = AddBlipForCoord(Config.slaughterer[i])

		SetBlipSprite (blip, 407)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, 27)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName('Boss | Slaughterer')
		EndTextCommandSetBlipName(blip)
	end
end)

-- Miner Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, Keys['E']) and isInMarkerMiner then
			Miner()
		end
		
		if IsControlJustReleased(0, Keys['E']) and isInMarkerFueler then
			Fueler()
		end
		
		if IsControlJustReleased(0, Keys['E']) and isInMarkerLumberjack then
			Lumberjack()
		end
		
		if IsControlJustReleased(0, Keys['E']) and isInMarkerfisherman then
			fisherman()
		end
		
		if IsControlJustReleased(0, Keys['E']) and isInMarkerslaughterer then
			slaughterer()
		end
	end
end)


-- Functions
function Miner()
	TriggerServerEvent('ESX_joblisting:Miner')
	ESX.ShowNotification(_U('new_job'))
end

function Fueler()
	TriggerServerEvent('ESX_joblisting:Fueler')
	ESX.ShowNotification(_U('new_job'))
end

function Lumberjack()
	TriggerServerEvent('ESX_joblisting:Lumberjack')
	ESX.ShowNotification(_U('new_job'))
end

function fisherman()
	TriggerServerEvent('ESX_joblisting:fisherman')
	ESX.ShowNotification(_U('new_job'))
end

function slaughterer()
	TriggerServerEvent('ESX_joblisting:slaughterer')
	ESX.ShowNotification(_U('new_job'))
end
