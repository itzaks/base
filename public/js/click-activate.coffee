module.exports = ($el) ->
  $el.addClass('is-active').siblings().removeClass('is-active')
