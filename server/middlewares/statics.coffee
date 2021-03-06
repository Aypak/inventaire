CONFIG = require 'config'
americano = require 'americano'
publicPath = CONFIG.root.path 'client', 'public'


staticMiddleware = ->
  options = maxAge: CONFIG.staticMaxAge
  return americano.static publicPath, options

# 2 elements array: arguments apply'ied to app.use by americano
exports.mountStaticFiles = ['/public', staticMiddleware()]


favicon = require 'serve-favicon'

exports.favicon = favicon publicPath + '/images/favicon.ico'


exports.cacheControl = (req, res, next) ->
  if CONFIG.noCache
    res.header 'Cache-Control', 'no-cache, no-store, must-revalidate'
  next()