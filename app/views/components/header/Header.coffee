{header, div} = React.DOM

Header = React.createClass

  displayName: 'Header'

  getInitialState: ->
    'karma': 25

  render: ->
    header id: 'site-header',
      div className: 'container',
        div className: 'row',
          div className: 'col-sm-8',
            div null, 'Skill Giving'
          div className: 'col-sm-2',
            div className: 'karma-level', 'Karma: ' + @state.karma
          div className: 'col-sm-2',
            div className: 'user-account', 'Account'

module.exports = Header
