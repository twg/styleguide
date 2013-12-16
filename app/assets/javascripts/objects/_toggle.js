// general toggler
$(document).ready(function(){
  // loop through all elements with the data-toggle attribute
  $('*[data-toggle]').each(function(){
    // find the target of the toggler
    var tar = $(this).attr('data-toggle');
    // add the toggle-base class to the target(s)
    $(tar).addClass('toggle-base');
    // when the toggler is clicked
    $(this).click(function(){
      // prevent the html click event from firing
      if(event.stopPropagation){
        event.stopPropagation();
      }
      // toggle class on trigger
      $(this).toggleClass('toggle-triggered');
      // find the target(s)
      var tar = $(this).attr('data-toggle');
      // toggle the "toggle" class on the target(s)
      $(tar).toggleClass('toggle');
      // ensure that clicking on the toggler target(s) doesnt' close toggler
      $(tar).click(function(){
        event.stopPropagation();
      });
      // prevent default link functionality
      return false;
    });
  });

  // if clicked off the toggler
  $('html').click(function(){
    $('.sticky-main .toggle-triggered').removeClass('toggle-triggered');
    $('.sticky-main .toggle').removeClass('toggle');
  });
});
