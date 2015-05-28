module.exports = (fn) -> (ev) ->
  ev.preventDefault()
  fn($(ev.currentTarget))
