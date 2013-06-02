class Protocol

  constructor: () ->
    @_actions = {}

  actions: () ->
    return

  interface: () ->
    return

  perform: (action, callback) ->
    console.log(action)
    @_actions[action](callback)


exports.Protocol = Protocol
