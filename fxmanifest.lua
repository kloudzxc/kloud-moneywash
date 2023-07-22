fx_version 'cerulean'
game 'gta5'

lua54 'yes'
author 'kloud'
description 'Simple moneywash script for QBCore'


shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

dependencies {
    'qb-core',
    'ox_target',
    'ox_lib'
}
