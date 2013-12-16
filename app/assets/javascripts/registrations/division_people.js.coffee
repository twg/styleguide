$ ->
  return unless $('.org_registrations_division_people-page').length

  $('#choose_child').on 'change', ->
    $('.person').hide()
    if $(this).val() == ''
      $('.add-new-child').show()
    else
      $('.add-new-child').hide()
      $('#person_' + $(this).val()).show()

  # Trigger change on load
  $('#choose_child').change()
