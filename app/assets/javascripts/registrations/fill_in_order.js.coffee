$(document).on 'click', '#fill_in_form', (e) ->
  e.preventDefault()
  prefix = $(this).data('prefix')
  switch $(this).data('gateway')
    when 'paypal'
      card_to_use = '4029119950458841'
    when 'usa_epay_transaction'
      valid_card = '4111111111111111'
      declined_card = '4000300011112220'
      card_to_use = if e.altKey then declined_card else valid_card

  $("##{prefix}_first_name").val('Alex')
  $("##{prefix}_last_name").val('Smith')
  $("##{prefix}_credit_card_number").val(card_to_use)
  $("##{prefix}_card_verification_number").val('123')
  $("##{prefix}_card_expires_on_1i").val('2018')
  $("##{prefix}_card_expires_on_2i").val('5')
  # Billing
  $("##{prefix}_billing_name").val('John Smith')
  $("##{prefix}_billing_address1").val('1 Infinite Loop')
  $("##{prefix}_billing_city").val('Toronto')
  $("##{prefix}_billing_zip").val('M5V1B1')

  $("##{prefix}_billing_country").val('CA')
  $("##{prefix}_billing_country").trigger('change')
  $("##{prefix}_billing_state").val('ON')
