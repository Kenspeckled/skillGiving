homeController = require 'controllers/home.coffee'

routes = (router) ->
  router.get '/', homeController.index

  if _scriptContext.isClient
    router.start()

  else if _scriptContext.isServer
    console.log "do nothing"
    # router.post '/hi', someController.hi

module.exports = routes

