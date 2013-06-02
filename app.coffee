global.OurApp = {}

express = require('express')
routes = require('./routes')
user = require('./routes/user')
node = require('./routes/node')
http = require('http')
path = require('path')

sys = require('sys')
exec = require('child_process').exec

WemoProtocol = require('./lib/wemo_protocol').WemoProtocol

expressLayouts = require('express-ejs-layouts')

app = express()

app.set('port', process.env.PORT || 3000)
app.set('views', __dirname + '/views')
app.set('view engine', 'ejs')
app.use(expressLayouts)
app.use(express.favicon())
app.use(express.logger('dev'))
app.use(express.bodyParser())
app.use(express.methodOverride())
app.use(express.cookieParser('your secret here'))
app.use(express.session())
app.use(app.router)
app.use(express.static(path.join(__dirname, 'public')))

if 'development' == app.get('env')
  app.use(express.errorHandler())

app.get('/', routes.index)
app.get('/users', user.list)
app.get('/node/:name', node.view)

server = http.createServer(app)
server.listen app.get('port'), () ->
  console.log('Express server listening on port ' + app.get('port'))

io = require('socket.io').listen(server)

# This is where we have discover() or something
nodes = OurApp.nodes = {}
require('./lib/wemo_device_registry')

io.sockets.on 'connection', (socket) ->
  socket.emit 'news', {message: 'Awaiting your command, master'}
  socket.on 'button-push', (data) ->
    nodes[data.name].perform("toggle", (response) ->
      socket.emit 'button-push-response', {message: response})
