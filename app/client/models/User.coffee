class User

  @create = (opts) ->
    new Promise (r) ->
      console.log opts
      r(id: 'userId')

  @find = (opts) ->
    new Promise (resolve, reject) ->
      console.log opts
      if _.isEmpty(opts)
        reject('Incorrect username or password')
      else
        resolve(id: 'userId')
module.exports = User