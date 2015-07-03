Promise = require 'promise'

class ObjectOrientedRecord

  url = 'mongodb://localhost:27017/skillGivingApi'

  @name = "ObjectOrientedRecord"

  @create = (obj) ->
    new Promise (resolve, reject) =>
      MongoClient.connect url, (err, db) =>
        collection = db.collection(@name)
        collection.insert obj, (err, result) ->
          db.close()
          if err
            reject(err)
          else
            resolve(obj)

  @update = (id, obj) ->
    self = this
    new Promise (resolve, reject) =>
      MongoClient.connect url, (err, db) =>
        collection = db.collection(@name)
        collection.update {id: id}, $set: obj, ->
          db.close()
          resolve()

  @find = (id) ->
    new Promise (resolve, reject) =>
      MongoClient.connect url, (err, db) =>
        collection = db.collection(@name)
        foundObject = collection.find({id: id})
        db.close()
        resolve(foundObject)

  @findBy = (query) ->
    new Promise (resolve, reject) =>
      MongoClient.connect url, (err, db) =>
        collection = db.collection(@name)
        foundObj = collection.findOne query, (err, item) ->
          db.close()
          resolve(item)

  @where = (query) ->
    new Promise (resolve, reject) =>
      MongoClient.connect url, (err, db) =>
        collection = db.collection(@name)
        foundObj = collection.find(query).toArray (err, items) ->
          db.close()
          resolve(items)

module.exports = ObjectOrientedRecord
