ceri = require "ceri-dev-server/lib/createView"
module.exports = ceri 
  tests: (el) ->
    if process.env.NODE_ENV == "test"
      describe "karma-ceri", ->
        it 'should get run', -> true
        it "should append view on body", ->
          el.parentElement.should.equal document.body
describe "karma-ceri", ->
  it 'should have tests registered', ->
    mocha.suite.suites.length.should.equal 2
    mocha.suite.suites[0].tests.length.should.equal 1
    mocha.suite.suites[1].tests.length.should.equal 2
