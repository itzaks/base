module.exports =
class Share
  data:
    link: 'http://sadiq.london'
    twitter: 'Together we can change London. I’m with Sadiq – please join us. http://sadiq.london #TogetherWeKhan'

  constructor: (@$el) ->
    @$el.on 'click', '.share-button', @click_handler

  click_handler: (ev) =>
    $el = $(ev.currentTarget)
    @facebook_click() if $el.hasClass 'is-facebook'
    @twitter_click() if $el.hasClass 'is-twitter'

  facebook_click: ->
    window.open("https://www.facebook.com/sharer/sharer.php?u=#{ @data.link }", "pop", "width=600, height=400, scrollbars=no")

  twitter_click: ->
    window.open """
    https://twitter.com/intent/tweet
    ?text=#{ encodeURIComponent(@data.twitter) }
    """
