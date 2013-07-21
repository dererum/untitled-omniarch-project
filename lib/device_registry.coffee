#|Registry|1--<>0..*| Device |
#| Device |1--<>1..*|Protocol|
#|Protocol|1--<>1..*| Action |
#
fs = require 'fs'
path = require 'path'
Device = require("../lib/device").Device

HOMEDIR = process.env.HOME || process.env.HOMEPATH || process.env.USERPROFILE

class DeviceRegistry
  DEFAULT_CONFIG_FILE=path.join(HOMEDIR, ".copterrc")

  constructor: (config_file) ->
    @config_file = config_file or DEFAULT_CONFIG_FILE
    @devices = {}

  load: () ->
    if not fs.existsSync(@config_file)
      @_initializeConfig()
      #try
      #  data = fs.readFileSync(@config_file)
      #  @config = JSON.parse(data)
      #  @_loadDevices()
      #catch IOError
      #  console.log("Unable to read config file")
      #  process.exit(1)
      data = fs.readFileSync(@config_file)
      @config = JSON.parse(data)
      console.log(@config)
      console.log(data.toString())
      @_loadDevices()

  addDevice: (device) ->
    if @devices[device.name]
      throw new Error("That device already exists. Delete it first.")
    @devices[device.name] = device

  get: (name) ->
    @devices[name]

  ############################################################################
  # private
  ############################################################################

  _initializeConfig: () ->
    # Initialize a config file from scratch
    fs.writeFileSync(@config_file, JSON.stringify({}))

  _loadDevices: () ->
    for device_config in @config.devices or {}
      console.log(device_config)
      @addDevice(new Device(device_config))

exports.DeviceRegistry = DeviceRegistry
