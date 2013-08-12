Protocol = require('../protocol').Protocol
Command = require('../command').Command

class WemoProtocol extends Protocol

  @name = "WeMo"

  @discover: () =>
    new Command('wemo').run("list", (error, stdout, stderr) ->
      console.log(stdout)
    )

  constructor: (identifier) ->
    super()
    @identifier = identifier
    @command = new Command('wemo')
    @_actions["on"] = @on_action
    @_actions["off"] = @off_action
    @_actions["toggle"] = @toggle_action

  _execute: (action, callback) ->
    @command.run("switch", @identifier, action, callback)

  on_action: (callback) =>
    @_execute("on", callback)

  off_action: (callback) =>
    @_execute("off", callback)

  toggle_action: (callback) =>
    @_execute("toggle", callback)


exports.Protocol = WemoProtocol
