$(document).ready(function(){
  formFocusAction($('input[autofocus]'));
  $('input[type=text], input[type=password], input[type=email]')
  .focus(function(){
    formFocusAction(this)
  })
  .blur(function(){
    $('.focus-indicator').remove();
  });

  $('.control-group.error *').focus(function(){
    $(this).parents('.control-group.error').addClass('focused');
  });
});

function formFocusAction(tar){
  $('.focus-indicator').remove();
  $(tar).after('<i class="icon focus-indicator"></i>');
}
