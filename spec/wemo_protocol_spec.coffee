require './spec_helper'

WemoProtocol = require('../lib/wemo_protocol').WemoProtocol
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
