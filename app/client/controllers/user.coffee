SignUp = require 'views/components/user/SignUp.coffee'
LogIn = require 'views/components/user/LogIn.coffee'

userController =

  new: ->
    props = {}
    React.render(
      React.createElement(SignUp, props),
      document.getElementById('content')
    )

  logIn: ->
    props = {}
    React.render(
      React.createElement(LogIn, props),
      document.getElementById('content')
    )



module.exports = userController

