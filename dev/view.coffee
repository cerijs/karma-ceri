ceri = require "ceri-dev-server/lib/createView"
module.exports = ceri 
  structure: template 1, "<span>test</span>"
  tests: karmaCeri: ->
    it 'should get run', => true
    it "should append view on body", =>
      @parentElement.should.equal document.body
    it "should be connected", =>
      @_isFirstConnect.should.be.false

describe "karma-ceri", ->
  it 'should have tests registered', ->
    mocha.suite.suites.length.should.equal 2
    mocha.suite.suites[0].tests.length.should.equal 3
    mocha.suite.suites[1].tests.length.should.equal 1
