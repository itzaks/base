imagesloaded = require 'imagesloaded'
debounce = require 'debounce'
is_mobile = require 'ismobilejs'

validate = require './js/validation'

jQuery.easing.def = "easeInOutCirc"

$ ->
  $('input, textarea').placeholder()
  $('<span>')
    .css color: 'red'
    .text ' – i come from js'
    .appendTo $('h1')
