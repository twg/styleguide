var sgClicked = false;

$(document).ready(function(){
  sgHashCheck();
  $(document).scroll(function(){
    if(!sgClicked){
      sgNavCheck();
    }
  });
  $('.sg-nav a').click(function(){
    // remove current active nav item
    $('.sg-is-active').removeClass('sg-is-active');
    // apply the new active nav item
    $(this).parent().addClass('sg-is-active');
    sgResetClicked();
  });
});

function sgHashCheck(){
  var sgHash = window.location.hash;
  if(sgHash){
    $('.sg-nav').find('a[href='+sgHash+']').parent().addClass('sg-is-active'); 
    sgResetClicked();
  }
  else{
    sgNavCheck();
  }
}

function sgResetClicked(){
    sgClicked = true;
    window.setTimeout(function(){
      sgClicked = false;
    }, 1000);
}

function sgNavCheck(){
  // check all .sg-sections
  var sgSection = '';
  $('.sg-content').find('.sg-anchor').each(function(){
    if(isElementInViewport(this)){
      sgSection = $(this).attr('id');
      return false;
    }
  });

  // if item isn't empty
  if(sgSection != ''){
    // remove current active nav item
    $('.sg-is-active').removeClass('sg-is-active');
    // apply the new active nav item
    $('.sg-nav a[href="#'+sgSection+'"]').parent().addClass('sg-is-active');
  }
}

// helper function to determine if an element is in the viewport
// http://stackoverflow.com/questions/123999/how-to-tell-if-a-dom-element-is-visible-in-the-current-viewport/7557433#7557433
function isElementInViewport(el) {
  var rect = el.getBoundingClientRect();
  return (
    rect.top >= 0 &&
    rect.left >= 0 &&
    rect.bottom <= (window.innerHeight || document. documentElement.clientHeight) && /*or $(window).height() */
    rect.right <= (window.innerWidth || document. documentElement.clientWidth) /*or $(window).width() */
  );
}
