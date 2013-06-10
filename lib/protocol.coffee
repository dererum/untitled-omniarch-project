class Protocol

  constructor: () ->
    @_actions = {}

  actions: () ->
    return

  interface: () ->
    return

  register_action: (name, action) ->
    @_actions[name] = action

  perform: (action, callback) ->
    console.log(action)
    @_actions[action](callback)


exports.Protocol = Protocol
