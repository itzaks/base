module.exports = 
class AnchorScroll
  speed: 1000

  constructor: (@$el) ->
    @$el.on 'click', 'a', click(@click)
    @offset = $('.header').height() / 2.2

  click: ($el) =>
    speed = @speed

    $target = $(href = $el.attr("href"))
    top = $target.position().top - @offset

    if href is '#top'
      top = 0
      speed = 200

    $.scrollTo(top, speed)
