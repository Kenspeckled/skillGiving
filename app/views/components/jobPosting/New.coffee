BaseLayout = require 'views/layouts/base.coffee'
JobPosting = require 'models/JobPosting.coffee'

{div, label, input, form, button} = React.DOM

JobPostingNew = React.createClass

  displayName: 'JobPostingNew'

  getInitialState: ->
    formData: {}
    error: ''

  handleSubmit: (ev) ->
    onSuccess = (jobPosting) =>
      #ajax request passing userId to assign a cookie
      console.log jobPosting
      ClientRouter.show('/job-posting/' + jobPosting.url)
    onFailure = (error) =>
      console.log "error", error
      @setState error: error
    ev.preventDefault()
    JobPosting.create(@state.formData).then onSuccess, onFailure

  handleFormChange: (ev) ->
    @setState error: ''
    @state.formData[ev.target.name] = ev.target.value #FIXME - this works but we shouldn't update state directly like this.

  render: ->
    React.createElement BaseLayout, @props,
      form className: 'job-posting-new form', onSubmit: @handleSubmit, onChange: @handleFormChange,
        if @state.error
          div className: 'row',
            div className: 'col-sm-12',
              div className: 'error-message', @state.error
        div className: 'row',
          div className: 'field',
            div className: 'col-sm-4',
              label className: 'label', 'Title',
            div className: 'col-sm-8',
              input className: 'input', name: 'title', type: 'text', autoComplete: 'false'
        div className: 'row',
          div className: 'field',
            div className: 'col-sm-4',
              label className: 'label', 'Location',
            div className: 'col-sm-8',
              input className: 'input', name: 'location', type: 'text', autoComplete: 'false'
        div className: 'row',
          div className: 'field',
            div className: 'col-sm-4',
              label className: 'label', 'Job Description',
            div className: 'col-sm-8',
              input className: 'input', name: 'description', type: 'text', autoComplete: 'false'
        div className: 'row',
          div className: 'field',
            div className: 'col-sm-4',
              label className: 'label', 'Job Type',
            div className: 'col-sm-8',
              input className: 'input', name: 'type', type: 'text', autoComplete: 'false'
        div className: 'row',
          div className: 'field',
            div className: 'col-sm-4',
              label className: 'label', 'Job Date',
            div className: 'col-sm-8',
              input className: 'input', name: 'date', type: 'text', autoComplete: 'false'
        div className: 'row',
          div className: 'field',
            div className: 'col-sm-4',
              label className: 'label', 'Karma Offered',
            div className: 'col-sm-8',
              input className: 'input', name: 'bounty', type: 'text', autoComplete: 'false'
        div className: 'row',
          div className: 'col-sm-12',
            div className: 'text-right',
              button className: 'btn btn-primary', 'Create Job Posting'




module.exports = JobPostingNew

