class JobPosting

  @create = (opts) ->
    new Promise (resolve, reject) ->
      console.log opts
      if _.isEmpty(opts)
        reject('Could not create Job Posting')
      else
        resolve(url: 'JobPosting')

  @find = (opts) ->
    new Promise (resolve, reject) ->
      console.log opts
      if _.isEmpty(opts)
        reject('Could not find Job Posting')
      else
        resolve('JobPosting')

module.exports = JobPosting