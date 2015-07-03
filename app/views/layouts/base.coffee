Header = require 'views/components/header/Header.coffee'
Footer = require 'views/components/footer/Footer.coffee'

{div} = React.DOM

BaseLayout = React.createClass

  displayName: 'BaseLayout'

  componentDidMount: ->
    # scroll to top on layout change
    window.scroll 0, 0

  render: ->
    div className: 'base-layout',
      React.createElement(Header)
      div className: "container",
        @props.children
      React.createElement(Footer)

module.exports = BaseLayout
