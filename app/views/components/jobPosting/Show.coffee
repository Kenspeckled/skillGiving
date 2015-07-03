BaseLayout = require 'views/layouts/base.coffee'

{div, a} = React.DOM

job =
  'user': 'one'
  'bounty': 5
  'title': 'Clean my garden'
  'location': 'Edinburgh'
  'description': "Please clean up my mess. Squirrels have been wrecking havok on my garden and I just don't know what to do any more"
  'jobType': 'gardening'
  'jobCloses': '10/12/15'
  'url': 'garden'

JobPostingsShow = React.createClass

  displayName: 'JobPostingsShow'

  render: ->
    React.createElement BaseLayout, @props,
      div className: 'job-posting-show',
        div className: "row",
          div className: 'col-sm-12',
            div className:'job-title', job.title
          div className: 'col-sm-3',
            div className:'job-location', job.location
          div className: 'col-sm-3',
            div className:'job-type', job.jobType
          div className: 'col-sm-3',
            div className:'job-bounty', job.bounty + ' Karma'
          div className: 'col-sm-3',
            div className:'job-closes', 'Open until ' + job.jobCloses
        div className: 'row',
          div className: 'col-sm-12',
            div className:'job-desc', job.description

module.exports = JobPostingsShow

