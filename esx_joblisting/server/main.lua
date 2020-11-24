ESX = nil
TriggerEvent('ESX:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('ESX_joblisting:getJobsList', function(source, cb)
	MySQL.Async.fetchAll('SELECT * FROM jobs WHERE whitelisted = @whitelisted', {
		['@whitelisted'] = false
	}, function(result)
		local data = {}

		for i=1, #result, 1 do
			table.insert(data, {
				job   = result[i].name,
				label = result[i].label
			})
		end

		cb(data)
	end)
end)


RegisterServerEvent('ESX_joblisting:setJob')
AddEventHandler('ESX_joblisting:setJob', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.fetchAll('SELECT whitelisted FROM jobs WHERE name = @name', {
		['@name'] = job,
	}, function(result)
		if not result[1].whitelisted then
			xPlayer.setJob(job, 0)
		else
			print(('ESX_joblisting: %s attempted to set a whitelisted job! (lua injector)'):format(xPlayer.identifier))
		end
		
	end)

end)


RegisterServerEvent('ESX_joblisting:Miner')
AddEventHandler('ESX_joblisting:Miner', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer then
		if ESX.DoesJobExist('miner', 0) then
			xPlayer.setJob('miner', 0)
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'That job does not exist.' } })
		end
	end
end)

RegisterServerEvent('ESX_joblisting:Fueler')
AddEventHandler('ESX_joblisting:Fueler', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer then
		if ESX.DoesJobExist('fueler', 0) then
			xPlayer.setJob('fueler', 0)
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'That job does not exist.' } })
		end
	end
end)

RegisterServerEvent('ESX_joblisting:Lumberjack')
AddEventHandler('ESX_joblisting:Lumberjack', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer then
		if ESX.DoesJobExist('lumberjack', 0) then
			xPlayer.setJob('lumberjack', 0)
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'That job does not exist.' } })
		end
	end
end)

RegisterServerEvent('ESX_joblisting:fisherman')
AddEventHandler('ESX_joblisting:fisherman', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer then
		if ESX.DoesJobExist('fisherman', 0) then
			xPlayer.setJob('fisherman', 0)
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'That job does not exist.' } })
		end
	end
end)

RegisterServerEvent('ESX_joblisting:slaughterer')
AddEventHandler('ESX_joblisting:slaughterer', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer then
		if ESX.DoesJobExist('slaughterer', 0) then
			xPlayer.setJob('slaughterer', 0)
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'That job does not exist.' } })
		end
	end
end)
