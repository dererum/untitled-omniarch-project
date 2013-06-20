require './spec_helper'

DeviceRegistry = require('../lib/device_registry').DeviceRegistry

describe 'DeviceRegistry', ->
  describe '#addDevice', ->
    it 'can add device', ->
      registry = new DeviceRegistry()
      registry.addDevice(protocol: 'WemoProtocol', name: 'office')
      registry.get('office').should.eql(protocol: 'WemoProtocol', name: 'office')

    it 'throws an exception if name is not unique', ->
      registry = new DeviceRegistry()
      fn = () ->
        registry.addDevice(protocol: 'WemoProtocol', name: 'office')
      fn()
      fn.should.throw(Error)
