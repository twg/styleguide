jQuery ->
  return unless $('.org_registrations_accounts-page.login_register-action').length
  
  # :input selector selects input/textarea/select/button elements (http://api.jquery.com/input-selector/)
  $('#form-preview').find(':input').prop('disabled', true)
