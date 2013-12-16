$(document).ready(function(){
  $('.alert:not(.static)').click(function(e){
    // get mouse position from right side of clicked alert
    var clickedX = $(this).outerWidth() - (e.pageX - $(this).offset().left);

    // if user clicked within 30px of the ride side (on/near the 'x') dismiss the alert
    if(clickedX <= 30){
      $(this).addClass('dismissed');
    }
  });
});
