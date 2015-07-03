BaseLayout = require 'views/layouts/base.coffee'
User = require 'models/User.coffee'

{div, label, input, form, button} = React.DOM

UserSignUp = React.createClass

  displayName: 'UserSignUp'

  getInitialState: ->
    formData: {}
    passwordConfirmationIsValid: ''

  handleSubmit: (ev) ->
    ev.preventDefault()
    if @state.passwordConfirmationIsValid
      User.create(@state.formData).then (user) ->
        ClientRouter.show('/')

  handleFormChange: (ev) ->
    @state.formData[ev.target.name] = ev.target.value #FIXME - this works but we shouldn't update state directly like this.

  validatePasswordConfirmation: (ev) ->
    passwordConfirmation = ev.target.value
    password = @state.formData.password
    if passwordConfirmation.length >= password.length
      if passwordConfirmation != password
        @setState passwordConfirmationIsValid: false
      else if passwordConfirmation = password
        @setState passwordConfirmationIsValid: true
    else
      @setState passwordConfirmationIsValid: ''


  render: ->
    React.createElement BaseLayout, @props,
      form className: 'sign-up form', onSubmit: @handleSubmit, onChange: @handleFormChange,
        div className: 'row',
          div className: 'field',
            div className: 'col-sm-4',
              label className: 'label', 'Email',
            div className: 'col-sm-8',
              input className: 'input', name: 'email', type: 'text', autoComplete: 'false'
        div className: 'row',
          div className: 'field',
            div className: 'col-sm-4',
              label className: 'label', 'Password',
            div className: 'col-sm-8',
              input className: 'input', name: 'password', type: 'password', autoComplete: 'false'
        div className: 'row',
          div className: 'field',
            div className: 'col-sm-4',
              label className: 'label', 'Confirm Password',
            div className: 'col-sm-8',
              input className: 'input ' + (if @state.passwordConfirmationIsValid == true then 'valid' else if @state.passwordConfirmationIsValid == false then 'invalid' else ''), name: 'passwordConfirmation', type: 'password', autoComplete: 'false', onChange: @validatePasswordConfirmation
        div className: 'row',
          div className: 'col-sm-12',
            div className: 'text-right',
              button className: 'btn btn-primary', 'Create Account'




module.exports = UserSignUp

