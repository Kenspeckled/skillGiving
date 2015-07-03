Index = require 'views/components/jobPosting/Index.coffee'
Show = require 'views/components/jobPosting/Show.coffee'
New = require 'views/components/jobPosting/New.coffee'
LogIn = require 'views/components/user/LogIn.coffee'

jobPostingController =

  index: ->
    props = {}
    React.render(
      React.createElement(Index, props),
      document.getElementById('content')
    )

  show: ->
    props = {}
    React.render(
      React.createElement(Show, props),
      document.getElementById('content')
    )

  new: -> #how to get access to cookies? AJAX call?
    # if req.cookies.session
    props = {}
    React.render(
      React.createElement(New, props),
      document.getElementById('content')
    )
    # else
    #   props = {warning: 'You must be logged in to create a job posting'}
    #   React.render(
    #     React.createElement(LogIn, props),
    #     document.getElementById('content')
    #   )

module.exports = jobPostingController

