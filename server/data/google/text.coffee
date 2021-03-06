__ = require('config').root
_ = __.require('builders', 'utils')
books_ = __.require('sharedLibs','books')(_)
cache_ = __.require 'lib', 'cache'
promises_ = __.require 'lib', 'promises'

# getDataFromText
module.exports = (text, timespan)->
  _.typeString text
  key = "google:#{text}"
  cache_.get key, requestBooksDataFromText.bind(null, text), timespan


requestBooksDataFromText = (text)->
  promises_.get books_.API.google.book(text)
  .then parseBooksData.bind(null, text)

parseBooksData = (text, res)->
  if res.totalItems > 0
    parsedItems = res.items.map(normalizeBookData)
    return  _.compact parsedItems
  else
    _.error res, 'Google Book response'
    throw "no item found for: #{text}"


normalizeBookData = (item)->
  books_.normalizeBookData(item.volumeInfo)