global._scriptContext = isClient: true # needed for routing
require 'globals.coffee'
DataCache = require 'DataCache.coffee'
global.dataCache = new DataCache()
global.ClientRouter = require 'clientRouter/ClientRouter.coffee'
routes = require 'routes.coffee'
routes(ClientRouter, 'client') # Initalise routes
