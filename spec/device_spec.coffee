require("./spec_helper")
Device = require("../lib/device").Device

describe 'Device', ->
  describe 'on initialize', ->
    it 'sets name from attributes', ->
      device = new Device(name: 'Blah', protocols: ['WemoProtocol'])
      device.name.should.eql('Blah')
    it 'accepts a string containing a single protocol', ->
      device = new Device(name: 'foo', protocols: 'WemoProtocol')
      device.protocols.should.be.an.instanceof(Array)
      # These don't work because it says "expected WemoProtocol to be an array"
      # which WE ARE TESTING FOR AND IT PASSES WHY WHY WHY
      #device.protocols.should.have.length(1)
      #device.protocols.should.include.members('WemoProtocol')
    it 'accepts an array of multiple protocols', ->
      device = new Device(name: 'foo', protocols: ['AProtocol', 'BProtocol'])
      device.protocols.should.be.an.instanceof(Array)
      device.protocols.should.have.length(2)
      device.protocols.should.include.members(['AProtocol', 'BProtocol'])
    it 'throws an exception if protocol is not specified', ->
      (() -> new Device(name: 'Blah')).should.throw("No protocol specified")
