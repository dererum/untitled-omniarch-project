exports.view = (req, res) ->
  name = req.params.name
  node = ControlCopter.nodes[name]
  unless node
    throw new Error("BAD NAME!")
  res.render('node/view', { title: "View for #{name}", name: name})
