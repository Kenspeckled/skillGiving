SignUp = require 'views/components/user/SignUp.coffee'

userController =

  new: ->
    props = {}
    React.render(
      React.createElement(SignUp, props),
      document.getElementById('content')
    )



module.exports = userController

