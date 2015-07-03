class User

  @create = (opts) ->
    new Promise (r) ->
      console.log opts
      r()

module.exports = User