$(document).ready(function(){
  $('input[type=text], input[type=password], input[type=email]')
  .focus(function(){
    $('.focus-indicator').remove();
    $(this).after('<i class="focus-indicator"></i>');
  })
  .blur(function(){
    $('.focus-indicator').remove();
  });
});
