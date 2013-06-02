nodes = OurApp.nodes
WemoProtocol = require('./wemo_protocol').WemoProtocol

nodes["tvroom"] = new WemoProtocol("tv")
nodes["bedroom"] = new WemoProtocol("Bedroom Light")
nodes["frontroom"] = new WemoProtocol("Front Room")
nodes["closet"] = new WemoProtocol("Front Closet")
