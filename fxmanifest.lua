fx_version "cerulean"
game "gta5"

ui_page "web-side/index.html"

server_scripts{
    "@vrp/lib/utils.lua",
    "config.lua",
    "server.lua"
}

client_scripts{
    "@vrp/lib/utils.lua",
    "config.lua",
    "client.lua"
}

files{
    "web-side/*",
    "web-side/**/*"
}              