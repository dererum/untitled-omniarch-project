#|Registry|1--<>0..*| Device |
#| Device |1--<>1..*|Protocol|
#|Protocol|1--<>1..*| Action |

class DeviceRegistry
  constructor: () ->
    @devices = {}

  addDevice: (device) ->
    if @devices[device.name]
      throw new Error("That device already exists. Delete it first.")
    @devices[device.name] = device

  get: (name) ->
    @devices[name]

exports.DeviceRegistry = DeviceRegistry
