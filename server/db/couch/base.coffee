CONFIG = require('config')
__ = CONFIG.root
_ = __.require 'builders', 'utils'

module.exports = (dbBaseName, designDocName)->
  dbName = CONFIG.db.name dbBaseName
  designDocName or= dbBaseName

  cot = __.require('couch', 'cot_base')(dbName)
  viewMethods = __.require('couch', 'view_methods')(designDocName)
  nanoMethods = __.require('couch', 'nano_base')(dbName)

  return _.extend cot, viewMethods, nanoMethods
