# life_blocks helper
module.exports = Ember.Handlebars.registerBoundHelper "life_blocks", (n) ->
  accum = ""
  i = 0
  while i < n
    accum += '<div></div>'
    ++i
  accum
  new Handlebars.SafeString(accum)