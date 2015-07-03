Index = require 'views/components/jobPosting/Index.coffee'
Show = require 'views/components/jobPosting/Show.coffee'

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


module.exports = jobPostingController

