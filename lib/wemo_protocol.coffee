exec = require('child_process').exec
Protocol = require('./protocol').Protocol

class WemoProtocol extends Protocol

  constructor: (identifier) ->
    super()
    @identifier = identifier
    @_actions["on"] = @on_action
    @_actions["off"] = @off_action
    @_actions["toggle"] = @toggle_action

  _execute: (action, callback) ->
    exec "wemo switch \"#{@identifier}\" #{action}", (error, stdout, stderr) ->
      callback("Toggled!")

  on_action: (callback) =>
    @_execute("on", callback)

  off_action: (callback) =>
    @_execute("off", callback)

  toggle_action: (callback) =>
    console.log(@)
    @_execute("toggle", callback)

exports.WemoProtocol = WemoProtocol
