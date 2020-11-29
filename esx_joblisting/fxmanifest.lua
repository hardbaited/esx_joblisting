fx_version 'bodacious'
games { 'rdr3', 'gta5' }

description 'esx Job Listing'

version '1.1.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'locales/en.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'locales/en.lua',
	'client/main.lua'
}

dependency 'es_extended'
