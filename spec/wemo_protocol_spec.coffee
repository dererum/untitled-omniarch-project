require './spec_helper'

WemoProtocol = require('../lib/wemo_protocol').WemoProtocol

describe 'WemoProtocol', () ->
  describe '#on', ->
    it "generates the right command", ->
      protocol = new WemoProtocol('office')
      protocol.
      protocol.perform('on')

  describe '#on', ->
    it "do something", ->
      new WemoProtocol()



