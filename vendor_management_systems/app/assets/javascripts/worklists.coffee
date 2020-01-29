# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $ ->
    $('tr[data-link] td:not(.not-include)').click ->
      window.location = $(this).parent().data('link')
      return