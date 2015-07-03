_ = require 'lodash'
Promise = require 'promise'

describe 'ObjectOrientedRecord', ->

  beforeEach ->
    @ObjectOrientedRecord = require '../app/ObjectOrientedRecord.coffee'
    url = 'mongodb://localhost:27017/skillGivingApi'
    MongoClient.connect url, (err, db) =>
      collection = db.collection(@ObjectOrientedRecord.name)
      collection.remove({})

  #afterEach ->

  #afterEach ->
    

  describe 'findBy', ->

    it 'should insert an entry and then find it', (done) ->
      testObj = name: "Andy", colour: "blue", number: 42
      createPromise = @ObjectOrientedRecord.create(testObj)
      createPromise.done =>
        findPromise = @ObjectOrientedRecord.findBy(name: "Andy")
        findPromise.then (foundObject) ->
          expect(foundObject).toEqual testObj
          done()
