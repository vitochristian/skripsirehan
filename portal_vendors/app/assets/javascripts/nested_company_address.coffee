$(document).on "turbolinks:load", ->
  $ ->
    maxFieldsCount = 2
    $addLink = $('a.add_nested_fields')
    $removeLink = $('a.remove_nested_fields')

    toggleAddLink = ->
      $addLink.toggle fieldsCount <= maxFieldsCount
      return

    $(document).on 'nested:fieldAdded', ->
      fieldsCount += 1
      toggleAddLink()
      return
    $(document).on 'nested:fieldRemoved', ->
      fieldsCount -= 1
      toggleAddLink()
      return
    fieldsCount = $('form .fields').length
    toggleAddLink()
    $removeLink.toggle fieldsCount == 0
    return