class User

  @create = (opts) ->
    new Promise (r) ->
      console.log opts
      r()

  @find = (opts) ->
    new Promise (resolve, reject) ->
      console.log opts
      reject()

module.exports = User