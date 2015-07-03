BaseLayout = require 'views/layouts/base.coffee'

{div, a} = React.DOM

jobPostings = [
  'user': 'one'
  'bounty': 5
  'title': 'Clean my garden'
  'location': 'Edinburgh'
  'description': "Please clean up my mess. Squirrels have been wrecking havok on my garden and I just don't know what to do any more"
  'jobType': 'gardening'
  'jobCloses': '10/12/15'
  'url': 'garden'
,
  'user': 'two'
  'bounty': 10
  'title': 'Fix my door'
  'location': 'Edinburgh'
  'description': 'I broke my door trying to get into my house. I need someone to come and repair it.'
  'jobType': 'diy'
  'jobCloses': '15/12/15'
  'url': 'door'
]

JobPostingsIndex = React.createClass

  displayName: 'JobPostingsIndex'

  render: ->
    React.createElement BaseLayout, @props,
      div className: 'job-posting-index',
        div className: 'row',
          div className: 'col-sm-12',
            for job in jobPostings
              div className: 'job-posting',
                a href: 'job-posting/' + job.url,
                  div className: 'row',
                    div className: 'col-sm-4',
                      div className:'job-title', job.title
                    div className: 'col-sm-2',
                      div className:'job-location', job.location
                    div className: 'col-sm-2',
                      div className:'job-type', job.jobType
                    div className: 'col-sm-2',
                      div className:'job-bounty', job.bounty + ' Karma'
                    div className: 'col-sm-2',
                      div className:'job-closes', 'Open until ' + job.jobCloses
                  div className: 'row',
                    div className: 'col-sm-12',
                      div className:'job-desc', job.description

module.exports = JobPostingsIndex
