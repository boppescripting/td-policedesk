fx_version 'adamant'
game 'gta5'
lua54 'yes'

dependency 'qb-core'

shared_scripts {
    'Shared/Config.lua',
    'Shared/Utils.lua'
}

client_script 'Client/CL_Main.lua'

server_script 'Server/SV_Main.lua'

escrow_ignore {
    'Shared/Config.lua'
}