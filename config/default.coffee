appRoot = require('app-root-path').path

module.exports =
  env: 'default'
  protocol: 'http'
  name: 'inventaire'
  host: 'localhost'
  publicHost: 'localhost'
  verbosity: 1
  port: 3006
  fullHost: -> "#{@protocol}://#{@host}:#{@port}"
  fullPublicHost: -> "#{@protocol}://#{@publicHost}:#{@port}"
  secret: 'yoursecrethere'
  db:
    instable: true
    protocol: 'http'
    host: 'localhost'
    port: 5984
    fullHost: -> "#{@protocol}://#{@username}:#{@password}@#{@host}:#{@port}"
    username: 'yourcouchdbusername'
    password: 'yourcouchdbpassword'
    auth: -> "#{@username}:#{@password}"
    suffix: null
    name: (dbBaseName)->
      if @suffix? then return "#{dbBaseName}-#{@suffix}"
      else dbBaseName
    fakeUsers: false
    restricted: true
  noCache: false
  staticMaxAge: 30*24*60*60*1000
  aws:
    key: 'customizedInLocalConfig'
    secret: 'customizedInLocalConfig'
    region: 'customizedInLocalConfig'
    bucket: 'customizedInLocalConfig'
    protocol: 'http'
  root:
    paths:
      root: ''
      server: '/server'
      lib: '/server/lib'
      models: '/server/models'
      utils: '/server/lib/utils'
      sharedLibs: '/client/app/lib/shared'
      data: '/server/data'
      db: '/server/db'
      couch: '/server/db/couch'
      level: '/server/db/level'
      graph: '/server/db/level/graph'
      builders: '/server/builders'
      controllers: '/server/controllers'
      leveldb: '/db/leveldb'
      couchdb: '/db/couchdb'
      client: '/client'
    path: (route, name)->
      path = @paths[route]
      return "#{appRoot}#{path}/#{name}"
    require: (route, name)-> require @path(route, name)
  https:
    key: '/cert/inventaire.key'
    cert: '/cert/inventaire.csr'
  typeCheck: true
  promisesStackTrace: true
  godMode: false # friends requests automatically accepted
  monitoring: false
  morgan:
    logFormat: 'dev'
    mutedRoutes: [
      '/api/logs/public'
    ]
  logStaticFilesRequests: true
  sendServerErrorsClientSide: true
  logMissingI18nKeys: true
  apiOpenBar: false
  resetCacheAtStartup: false
  serveStatic: true
  mailer:
    service: 'yoursettings',
    auth:
      user: 'yoursettings'
      pass: 'yoursettings'