# Add absolute paths for all require statements to './app'
# include server controllers as separate path
process.env.NODE_PATH =  __dirname+':'+__dirname + '/server'
require('module').Module._initPaths()
global._scriptContext = isServer: true # needed for routing
require 'globals.coffee'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'

express = require 'express'
server = express()

server.use express.static('public')
server.set('views', __dirname + '/views')
server.set('view engine', 'jade')
server.use cookieParser()
server.use bodyParser.urlencoded({ extended: true })

require('routes.coffee')(server, 'server') # Initalise get routes

server = server.listen 8000, 'localhost', ->
  host = server.address().address
  port = server.address().port
  console.log "App listening at http://%s:%s", host, port
