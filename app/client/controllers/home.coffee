Home = require 'views/components/home/Home.coffee'

homeController = 

  index: ->
    props = {}
    React.render(
      React.createElement(Home, props),
      document.getElementById('content')
    )

module.exports = homeController

