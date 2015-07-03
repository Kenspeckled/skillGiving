Promise = require 'promise'
MongoClient = require('mongodb').MongoClient
ObjectID = require('mongodb').ObjectID

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
        collection.findOne {"_id": new ObjectID(id)}, (err, item) ->
          db.close()
          resolve(item)

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

  @destroy = (id) ->
    new Promise (resolve, reject) =>
      MongoClient.connect url, (err, db) =>
        collection = db.collection(@name)
        #collection.remove (err, item) ->
        collection.remove {"_id": new ObjectID(id)}, (err, item) ->
          db.close()
          resolve(item)

module.exports = ObjectOrientedRecord
