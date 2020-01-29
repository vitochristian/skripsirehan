$(document).on 'turbolinks:load', ->
  $ ->
    url = window.location
    $('ul.main-menu a[href="' + url + '"]').addClass 'active'
    $('ul.main-menu a').filter(->
      @href == url
    ).addClass 'active'
    return