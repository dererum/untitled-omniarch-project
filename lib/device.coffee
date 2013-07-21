class Device
  constructor: (options={}) ->
    @name = options.name
    procs = options.protocols
    throw new Error("No protocol specified ") unless procs
    @protocols = if (procs instanceof Array) then procs else [procs]

exports.Device = Device
