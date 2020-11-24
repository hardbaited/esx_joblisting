resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'HARD Job Listing'

version '1.1.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@hard-base/locale.lua',
	'config.lua',
	'locales/en.lua',
	'server/main.lua'
}

client_scripts {
	'@hard-base/locale.lua',
	'config.lua',
	'locales/en.lua',
	'client/main.lua'
}

dependency 'hard-base'
