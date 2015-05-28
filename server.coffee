async = require 'async'
harp = require 'harp'
express = require 'express'
request = require 'request'
bodyparser = require 'body-parser'
keystone = require 'keystone'
_ = require 'underscore'

app_name = "Base"

port = process.env.PORT or 9000

keystone.init
  'name': app_name
  'favicon': 'public/favicon.ico'
  'static': '/public'
  'static options': { maxAge: 86400000 }
  'port': port
  'views': '/public'
  'view engine': 'jade'
  'auto update': true
  'compress': true
  'mongo': process.env.MONGOHQ_URL or "mongodb://localhost/#{ app_name.toLowerCase() }"
  'user model': 'User'
  'signout redirect': '/'
  'cookie signin': true
  'cookie secret': "#{ app_name.toLowerCase() }"
  'session': true
  'session store': 'connect-mongo'
  'session store options': {autoReconnect: true}
  'auth': true

keystone.set 'cloudinary config',
  cloud_name: 'reform-act'
  api_key: '375745886328959'
  api_secret: 'tPKo_iaRkJs9EplS1D45m73BKj8'

keystone.app.get '/', (req, res) ->
  locals = {}
  render = _.after 2, ->

  keystone.list('Copy').model.find (err, result) ->
    copy = _.groupBy result, 'language'

    if copy
      locals.copy =
        svenska: copy['svenska']?[0]
        engelska: copy['engelska']?[0]

    res.render __dirname + '/public/index', locals

keystone.app.use harp.mount(__dirname + "/public")

require './models'

keystone.start()

console.log "Running on #{ port }"
