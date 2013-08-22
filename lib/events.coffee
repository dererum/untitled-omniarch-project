events = require('events')

console.log("HIHIHIH", ControlCopter)

class ControlCopter.Events extends events.EventEmitter

  @_instance: null

  @instance: ->
    @_instance ?= new @()

  newdevice: (device) =>
    @emit "newdevice", device


    #console.log(ControlCopter.Events.instance())
