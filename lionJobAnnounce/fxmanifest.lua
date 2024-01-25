fx_version 'cerulean'
game 'gta5'
lua54 'yes'
Version '1.0'

author 'Lion Development'
description 'JobAnnounce'

client_scripts {
    'client.lua',
    'config.lua',
}

server_scripts {
    'config.lua',
    'server.lua'
}

file 'version.json'

escrow_ignore {
	'config.lua',
    'client.lua',
    'server.lua',
    'stream/**.ytd'
}