require './spec_helper'

WemoProtocol = require('../lib/protocols/wemo_protocol').Protocol
Command = require('../lib/command').Command

describe 'WemoProtocol', () ->

  @shouldGenerateRightCommand = (command) ->
    describe "##{command}", ->
      it "generates the correct #{command} command", ->
        protocol = new WemoProtocol('office')
        mock = sinon.mock(protocol.command)
        mock.expects("run").withArgs("switch", "office", command)
        protocol.perform(command)
        mock.verify()

  @shouldGenerateRightCommand("on")
  @shouldGenerateRightCommand("off")
  @shouldGenerateRightCommand("toggle")
