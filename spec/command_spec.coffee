require('./spec_helper')

Command = require('../lib/command').Command

describe 'Command', ->
  describe '#run', ->
    it 'runs the command with arguments', ->
      command = new Command('echo')
      result = null
      command.exec = (args) ->
        result = args
      command.run("hi", "there")
      result.should.eql(["echo", "hi", "there"])

    it "calls the last argument as a callback if it is a function", ->
      command = new Command('echo')
      callback = (error, stdout, stderr) ->
        stdout.should.eql("hi there\n")
      command.run("hi", "there", callback)
