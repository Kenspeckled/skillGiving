homeController = require 'controllers/home.coffee'
jobPostingController = require 'controllers/jobPosting.coffee'
userController = require 'controllers/user.coffee'

routes = (router) ->
  router.get '/', homeController.index
  router.get '/job-postings', jobPostingController.index
  router.get '/job-posting/:id', jobPostingController.show
  router.get '/sign-up', userController.new
  router.get '/log-in', userController.logIn

  if _scriptContext.isClient
    router.start()

  else if _scriptContext.isServer
    console.log "do nothing"

    # router.post '/api/createJobPosting', jobPostingController.createAPI



module.exports = routes

