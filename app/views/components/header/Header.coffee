{header, div, a} = React.DOM

Header = React.createClass

  displayName: 'Header'

  getInitialState: ->
    'karma': 25

  render: ->
    header id: 'site-header',
      div className: 'container',
        div className: 'row',
          div className: 'col-sm-4',
            a href: '/job-postings' , 'Skill Giving'
          div className: 'col-sm-4',
            a href: '/job-postings/new', 'Create new Job Posting'
          div className: 'col-sm-2',
            div className: 'karma-level', 'Karma: ' + @state.karma
          div className: 'col-sm-1',
            a className: 'user-account', href: '/log-in' ,'log in'
          div className: 'col-sm-1',
            a className: 'user-account', href: '/sign-up', 'sign up'

module.exports = Header
