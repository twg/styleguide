//= require "jquery.min"
//= require "styleguide/_navigation"
//= require_tree "./objects/"
//= require_tree "./plugins/"

// initialize js plugins
$(document).ready(function() {
    // init fastclick for removing iOS touch delay
    FastClick.attach(document.body);

    // init placeholder text polyfill for IE
    $('input, textarea').placeholder();
});
