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
    'server/*.lua',
    'inventory/*.lua',
    'bridge/*.lua'
}

dependencies {
    'rpemotes',
    'ox_lib'
}
