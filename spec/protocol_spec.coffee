require("./spec_helper")
Protocol = require("../lib/protocol").Protocol

describe 'Protocol', () ->
  describe '#register_action', () ->
    protocol = new Protocol()
    action = () -> return
    protocol.register_action('foo', action)
    protocol._actions.foo.should.equal(action)
  describe '#perform', () ->
    it 'calls the callback for an action ', () ->
      sawit = false
      protocol = new Protocol()
      protocol.register_action('foo',
        (callback) -> sawit = true
      )
      protocol.perform('foo')
      sawit.should.be.true
