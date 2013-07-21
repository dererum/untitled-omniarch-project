require './spec_helper'
fs = require 'fs'
path = require 'path'

DeviceRegistry = require('../lib/device_registry').DeviceRegistry

describe 'DeviceRegistry', ->

  CONFIG_FILE = "/tmp/.copterrc"

  beforeEach ->
    @config_file = () ->
      CONFIG_FILE
    if fs.existsSync(@config_file())
      fs.unlinkSync(@config_file())

    @registry = () ->
      new DeviceRegistry(@config_file())

  describe '#load', ->
    it 'creates a .copterrc', ->
      fs.existsSync(@config_file()).should.be.false
      @registry().load()
      fs.existsSync(@config_file()).should.be.true

    it 'creates an empty JSON object', ->
      @registry().load()
      fs.readFileSync(@config_file(), {encoding:"utf8"}).should.eql("{}")

    it 'loads an empty configuration object', ->
      registry = @registry()
      fs.existsSync(@config_file()).should.be.false
      registry.load()
      registry.config.should.eql({})

    it 'loads an existing config file with a device', ->
      @config_file = () ->
        path.resolve(__dirname, "fixtures/.copterrc")
      registry = @registry()
      registry.load()
      cfg = registry.config
      cfg.devices.should.be.an.instanceOf(Array)
      cfg.devices.should.be.length(1)

    it 'loads devices from config', ->
      @config_file = () ->
        path.resolve(__dirname, "fixtures/.copterrc")
      registry = @registry()
      registry.load()
      registry.devices['foo'].should.be.an.instanceOf(Device)

  describe '#addDevice', ->
    it 'can add device', ->
      registry = @registry()
      registry.addDevice(protocol: 'WemoProtocol', name: 'office')
      registry.get('office').should.eql(protocol: 'WemoProtocol', name: 'office')

    it 'throws an exception if name is not unique', ->
      @registry().addDevice(protocol: 'WemoProtocol', name: 'office')
      (() =>
        @registry().addDevice(protocol: 'WemoProtocol', name: 'office'))
        .should.throw.error
