homeController = require 'controllers/home.coffee'
jobPostingController = require 'controllers/jobPosting.coffee'

routes = (router) ->
  router.get '/', homeController.index
  router.get '/job-postings', jobPostingController.index
  router.get '/job-posting/:id', jobPostingController.show

  if _scriptContext.isClient
    router.start()

  else if _scriptContext.isServer
    console.log "do nothing"

    # router.post '/api/createJobPosting', jobPostingController.createAPI



module.exports = routes

