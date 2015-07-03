BaseLayout = require 'views/layouts/base.coffee'
User = require 'models/User.coffee'

{div, label, input, form, button} = React.DOM

UserLogIn = React.createClass

  displayName: 'UserLogIn'

  getInitialState: ->
    formData: {}
    error: ''

  handleSubmit: (ev) ->
    onSuccess = (user) =>
      ClientRouter.show('/')
    onFailure = (error) =>
      console.log "error", error
      @setState error: error
    ev.preventDefault()
    User.find(@state.formData).then onSuccess, onFailure

  handleFormChange: (ev) ->
    @state.formData[ev.target.name] = ev.target.value #FIXME - this works but we shouldn't update state directly like this.

  render: ->
    React.createElement BaseLayout, @props,
      form className: 'log-in', onSubmit: @handleSubmit, onChange: @handleFormChange,
        if @state.error
          div className: 'row',
            div className: 'col-sm-12',
              div className: 'error-message', @state.error
        div className: 'row',
          div className: 'field',
            div className: 'col-sm-4',
              label className: 'label', 'Email',
            div className: 'col-sm-8',
              input className: 'input ' + (if @state.error then 'invalid' else ''), name: 'email', type: 'text', autoComplete: 'false'
        div className: 'row',
          div className: 'field',
            div className: 'col-sm-4',
              label className: 'label', 'Password',
            div className: 'col-sm-8',
              input className: 'input ' + (if @state.error then 'invalid' else ''), name: 'password', type: 'password', autoComplete: 'false'
        div className: 'row',
          div className: 'col-sm-12',
            div className: 'text-right',
              button className: 'btn btn-primary', 'Log in'




module.exports = UserLogIn

