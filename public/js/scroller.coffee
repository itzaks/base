module.exports = 
class Scroller
  scrolled: false
  limit: 50

  constructor: ->
    @$body = $('body')
    @$window = $(window)
    @$window.on 'scroll', debounce(@scroll, 2)
    setTimeout @scroll, 100

  scroll: =>
    top = @$window.scrollTop()

    if top > @limit and not @scrolled
      @scrolled = true
      @$body.addClass 'is-scrolling'

    if top < @limit and @scrolled
      @scrolled = false
      @$body.removeClass 'is-scrolling'
