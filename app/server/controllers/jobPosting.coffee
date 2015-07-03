Index = require 'views/components/jobPosting/Index.coffee'
Show = require 'views/components/jobPosting/Show.coffee'
New = require 'views/components/jobPosting/New.coffee'
LogIn = require 'views/components/user/LogIn.coffee'

jobPostingController =

  createAPI: (req, res) ->
    console.log "createAPI"

  index: (req, res) ->
    props = {}
    html = React.renderToString React.createElement(Index, props)
    res.render 'index', content: html, props: JSON.stringify(props)

  show: (req, res) ->
    props = {}
    html = React.renderToString React.createElement(Show, props)
    res.render 'index', content: html, props: JSON.stringify(props)

  new: (req, res) ->
    if req.cookies.session
      props = {session: req.cookies.session}
      html = React.renderToString React.createElement(New, props)
      res.render 'index', content: html, props: JSON.stringify(props)
    else
      props = {warning: 'You must be logged in to create a job posting'}
      html = React.renderToString React.createElement(LogIn, props)
      res.render 'index', content: html, props: JSON.stringify(props)

module.exports = jobPostingController

