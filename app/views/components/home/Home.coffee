BaseLayout = require 'views/layouts/base.coffee'

{div} = React.DOM

Home = React.createClass

  displayName: 'Home'

  render: ->
    React.createElement BaseLayout, @props,
      div className: "row",
        div className: "col-sm-12",
          div null, "Hello World"

module.exports = Home
