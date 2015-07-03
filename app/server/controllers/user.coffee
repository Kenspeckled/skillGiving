SignUp = require 'views/components/user/SignUp.coffee'
LogIn = require 'views/components/user/LogIn.coffee'

userController =

  # createAPI: (req, res) ->

  new: (req, res) ->
    props = {}
    html = React.renderToString React.createElement(SignUp, props)
    res.render 'index', content: html, props: JSON.stringify(props)

  logIn: (req, res) ->
    props = {}
    html = React.renderToString React.createElement(LogIn, props)
    res.render 'index', content: html, props: JSON.stringify(props)


module.exports = userController

