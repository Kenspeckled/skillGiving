_ = require 'lodash'
Promise = require 'promise'
MongoClient = require('mongodb').MongoClient

describe 'ObjectOrientedRecord', ->

  beforeAll ->
    @ObjectOrientedRecord = require '../app/ObjectOrientedRecord.coffee'

  beforeEach (done) ->
    url = 'mongodb://localhost:27017/skillGivingApi'
    MongoClient.connect url, (err, db) =>
      collection = db.collection(@ObjectOrientedRecord.name)
      collection.remove({})
      done()

  describe 'find', ->

    it 'should insert an entry and then find it', (done) ->
      testObj = name: "Andy", colour: "blue", number: 42
      createPromise = @ObjectOrientedRecord.create(testObj)
      createPromise.then (createdObject) =>
        findPromise = @ObjectOrientedRecord.find(createdObject._id)
        findPromise.then (foundObject) ->
          expect(foundObject).toEqual testObj
          done()

  describe 'findBy', ->

    it 'should insert an entry and then find it', (done) ->
      testObj = name: "Andy", colour: "blue", number: 42
      createPromise = @ObjectOrientedRecord.create(testObj)
      createPromise.done =>
        findPromise = @ObjectOrientedRecord.findBy(name: "Andy")
        findPromise.then (foundObject) ->
          expect(foundObject).toEqual testObj
          done()

  describe 'where', ->

    beforeEach (done) ->
      testObj1 = @ObjectOrientedRecord.create name: "Andy", colour: "green", number: 1
      testObj2 = @ObjectOrientedRecord.create name: "John", colour: "blue", number: 2
      testObj3 = @ObjectOrientedRecord.create name: "Ellen", colour: "red", number: 2
      testObj4 = @ObjectOrientedRecord.create name: "Jane", colour: "green", number: 3
      Promise.all([testObj1, testObj2, testObj3, testObj4]).then (result) =>
        [@testObj1, @testObj2, @testObj3, @testObj4] = result
        done()

    it 'should return an array of all matching documents', (done) ->
      @ObjectOrientedRecord.where(colour: "green").then (result) =>
        expect(result).toContain @testObj1
        expect(result).toContain @testObj4
        expect(result.length).toEqual 2
        done()

    it 'should return an empty array when no documents match', (done) ->
      @ObjectOrientedRecord.where(colour: "yellow").then (result) =>
        expect(result).toEqual []
        done()

  describe 'destroy', ->

    beforeEach (done) ->
      testObj1 = @ObjectOrientedRecord.create name: "Andy", colour: "green", number: 1
      testObj2 = @ObjectOrientedRecord.create name: "John", colour: "blue", number: 2
      testObj3 = @ObjectOrientedRecord.create name: "Ellen", colour: "red", number: 2
      testObj4 = @ObjectOrientedRecord.create name: "Jane", colour: "green", number: 3
      Promise.all([testObj1, testObj2, testObj3, testObj4]).then (result) =>
        [@testObj1, @testObj2, @testObj3, @testObj4] = result
        done()

    it 'should return remove the record', (done) ->
      @ObjectOrientedRecord.destroy(@testObj1._id).then =>
        @ObjectOrientedRecord.where({}).then (result) =>
          expect(result.length).toEqual 3
          expect(result).not.toContain @testObj1
          done()
