fx_version 'cerulean'
game 'gta5'

lua54 'yes'
author 'kloud'
description 'Simple moneywash script for QBCore'

version '1.1.1'


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

files {
    'locales/*.json'
}

dependencies {
    'rpemotes',
    'ox_lib'
}
