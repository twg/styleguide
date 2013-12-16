// This file should only contain the code necessary to initialize any plugins

$(document).ready(function() {
    // init fastclick for removing iOS touch delay
    FastClick.attach(document.body);

    // init placeholder text polyfill
    $('input, textarea').placeholder();

    // init overscroll
    $('.tournament').overscroll({
      showThumbs: false,
      direction: 'horizontal',
      captureWheel: false
    });

    // init royalslider
    $('.royalSlider').royalSlider({
      autoScaleSlider: true,
      globalCaption: true,
      imageScalePadding: 20,
      autoScaleSliderWidth: 800,
      autoScaleSliderHeight: 600
    });
});
