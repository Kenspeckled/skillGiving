Home = require 'views/components/home/Home.coffee'

homeController = 

  index: (req, res) ->
    props = {}
    html = React.renderToString React.createElement(Home, props)
    res.render 'index', content: html, props: JSON.stringify(props)

module.exports = homeController

