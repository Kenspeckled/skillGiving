Index = require 'views/components/jobPosting/Index.coffee'
Show = require 'views/components/jobPosting/Show.coffee'

jobPostingController =

  # createAPI: (req, res) ->

  index: (req, res) ->
    props = {}
    html = React.renderToString React.createElement(Index, props)
    res.render 'index', content: html, props: JSON.stringify(props)

  show: (req, res) ->
    props = {}
    html = React.renderToString React.createElement(Show, props)
    res.render 'index', content: html, props: JSON.stringify(props)



module.exports = jobPostingController

