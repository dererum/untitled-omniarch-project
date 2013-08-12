events = require('events')
fs = require('fs')
path = require('path')



class Protocol

  PROTODIR = path.resolve(__dirname, "protocols")

  @list_protocols: () ->
    _(@get_protocols()).map (proto) ->
      console.log(proto.name)

  constructor: () ->
    @_actions = {}

  actions: () ->
    return

  interface: () ->
    return

  register_action: (name, action) ->
    @_actions[name] = action

  perform: (action, callback) ->
    @_actions[action](callback)

  discover: () ->
    throw "Not Implemented"

  @get_protocols: () ->
    return @_protocols if @_protocols?
    fnames = fs.readdirSync(PROTODIR)
    results = []
    _(fnames).map (fname) ->
      fullname = path.resolve(PROTODIR, fname)
      if not fs.statSync(fullname).isDirectory()
        proto = require(fullname).Protocol
        results.push(proto)
    @_protocols = results
    return results

exports.Protocol = Protocol
