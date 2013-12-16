$(document).ready(function(){

  // ensure active tabs are set, if not, set them
  defaultTabs('.tabs-nav');
  defaultTabs('.tabs-content');
  function defaultTabs(tar){
    $(tar).each(function(){
      if($(this).find('.active').length === 0){
        $(this).children().first().addClass('active');
      }  
    });
  }

  // handle clicking tabs
  $('.tabs-nav li').on('click',function(){
    // update tabs
    $(this).parent().children('.active').removeClass('active');
    $(this).addClass('active');

    // update tabs-content
    var ind = $(this).parent().children('li').index(this);
    var tar = $(this).parent().next();
    $(tar).children('.active').removeClass('active');
    $(tar).children('li:eq('+ind+')').addClass('active');
  });

  // insert tab-responsive-headings
  $('.tabs-nav li').each(function(){
    var tabTitle = $(this).text();
    var tabContent = $(this).parent().next();
    var tabIndex = $(this).parent().children('li').index(this);
    $(tabContent).find('li:nth-child('+(tabIndex+1)+')').prepend('<span class="tab-responsive-heading">'+tabTitle+'</span>');
  });
});
