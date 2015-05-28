module.exports =
class Slider
  speed: 200

  constructor: (@$el) ->
    @swipe = new Swipe @$el[0],
      auto: 3000
      startSlide: 3
      callback: @slided

    @$swipes = @$el.find('.swipe-item')
    @show_when_loaded()
    @$thumbs = @$el.parent().find('.swipe-thumbnail-item')
    @$thumbs.on 'click', click(@click_thumb)
    $(window).on 'resize', debounce(@resize, 2)

  slided: (index) =>
    @$thumbs
      .eq(index).addClass('is-active')
      .siblings().removeClass('is-active')

  show_when_loaded: ->
    @$el.css 'opacity', 0
    imagesloaded @$el, =>
      @$el.css 'opacity', 1
      @resize()

  resize: =>
    height = Math.min ($(thumb).height() for thumb in @$swipes)...
    @$el.height(height)

  click_thumb: ($el) =>
    @swipe.slide($el.index(), @speed)
