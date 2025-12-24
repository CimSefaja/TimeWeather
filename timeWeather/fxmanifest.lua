--      ________  _______   ________ ________        ___  ________     
--     |\   ____\|\  ___ \ |\  _____\\   __  \      |\  \|\   __  \    
--     \ \  \___|\ \   __/|\ \  \__/\ \  \|\  \     \ \  \ \  \|\  \   
--      \ \_____  \ \  \_|/_\ \   __\\ \   __  \  __ \ \  \ \   __  \  
--       \|____|\  \ \  \_|\ \ \  \_| \ \  \ \  \|\  \\_\  \ \  \ \  \ 
--         ____\_\  \ \_______\ \__\   \ \__\ \__\ \________\ \__\ \__\
--        |\_________\|_______|\|__|    \|__|\|__|\|________|\|__|\|__|
--                        https://discord.gg/H7DUpKpDvw           



fx_version 'cerulean'
game 'gta5'

description "PersonalTimeAndWeather"
author "Sefaja"
version '2.0'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

client_scripts {
    'config.lua',
    'client.lua'
}

