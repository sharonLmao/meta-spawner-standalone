resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

fx_version 'adamant'
games { 'rdr3', 'gta5' }

client_script "nui.lua"
server_script "server.lua"

ui_page "html/index.html"
files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/reset.css'
}