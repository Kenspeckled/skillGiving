BaseLayout = require 'views/layouts/base.coffee'

{div} = React.DOM

JobPostingsShow = React.createClass

  displayName: 'JobPostingsShow'

  render: ->
    React.createElement BaseLayout, @props,
      div className: "row",
        div className: "col-sm-12",
          div null, "Show"

module.exports = JobPostingsShow
