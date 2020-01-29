$(document).on "turbolinks:load", ->
  $ ->
    max_fields = 3
    wrapper = $('.input-fields-wrap')
    add_button = $('.add-field-button')
    x = 1
    toggleAddLink = ->
      add_button.toggle phone_count < max_fields
      return
    $(add_button).click (e) ->
      e.preventDefault()
      if x < max_fields
        x++
        $(wrapper).append '<div class="form-group delete"><div class="col-sm-6 vendor_phone"><input id="ms_vendor_phone_' + x + '" class="form-control" type="text" name="ms_vendor[phone_' + x + ']"  placeholder="Example: +62 85288876001"/><a href="#" class="remove-field">Remove</a></div></div>'
        phone_count += 1
        toggleAddLink()
      return
    $(wrapper).on 'click', '.remove-field', (e) ->
      e.preventDefault()
      $(this).parents('.delete').remove()
      x--
      phone_count -= 1
      toggleAddLink()
      return
    phone_count = $('.vendor_phone').length
    toggleAddLink()
    return