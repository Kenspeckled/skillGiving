{header, div} = React.DOM

Header = React.createClass

  displayName: 'Header'

  render: ->
    header id: 'site-header',
      div className: 'container',
        div className: 'row',
          div className: 'col-sm-12',
            div null, "Header"

module.exports = Header
