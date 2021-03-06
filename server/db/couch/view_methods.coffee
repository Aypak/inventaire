__ = require('config').root
_ = __.require 'builders', 'utils'
couch_ = __.require 'lib', 'couch'

module.exports = (designDocName)->

  methods =
    viewCustom: (viewName, query)->
      _.types arguments, ['string', 'object']
      @view(designDocName, viewName, query)
      .then couch_.mapDoc

    viewByKeysCustom: (viewName, keys, query)->
      _.types arguments, ['string', 'array', 'object']
      @viewKeys(designDocName, viewName, keys, query)
      .then couch_.mapDoc

    viewByKey: (viewName, key)->
      _.types arguments, ['string', 'string|array|object']
      query =
        key: key
        include_docs: true
      @viewCustom viewName, query

    viewByKeys: (viewName, keys)->
      _.types arguments, ['string', 'array']
      query = { include_docs: true }
      @viewByKeysCustom viewName, keys, query

  return methods