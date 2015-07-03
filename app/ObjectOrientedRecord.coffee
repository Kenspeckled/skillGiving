class ObjectOrientedRecord

  MongoClient = require('mongodb').MongoClient
  url = 'mongodb://localhost:27017/test'

  create = (obj) ->
    new Promise (resolve, reject) ->
      MongoClient.connect url, (err, db) =>
        console.log 'Connected to ' + db

        db.collection(@name).insertOne(obj)

        db.close()
        resolve()

module.exports = ObjectOrientedRecord