exec = require('child_process').exec

class Command

  constructor: (command) ->
    @_command = command

  run: () ->
    args = [@_command]
    args.push(item) for item in arguments
    if typeof args.slice(-1)[0] == 'function'
      callback = args.pop()
    @exec(args, callback)

  exec: (args, callback) ->
    whendone = (error, stdout, stderr) ->
      if callback != undefined
        callback(error, stdout, stderr)
    exec(args.join(" "), whendone)

exports.Command = Command
