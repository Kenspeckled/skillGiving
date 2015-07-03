class User

  @create = (opts) ->
    new Promise (r) ->
      console.log opts
      r()

  @find = (opts) ->
    new Promise (resolve, reject) ->
      console.log opts
      if _.isEmpty(opts)
        reject('Incorrect username or password')
      else
        resolve('userId')

module.exports = User