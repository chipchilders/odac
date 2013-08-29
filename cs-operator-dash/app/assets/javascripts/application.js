// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.easy-pie-chart
//= require bootstrap
//= require raphael
//= require morris
//= require_tree .

$(function() {                                                                                                                                                        │
    // Side Bar Toggle                                                                                                                                                │Started GET "/assets/bootstrap.js?body=1" for 127.0.0.1 at 2013-08-28 15:54:51 -0400
    $('.hide-sidebar').click(function() {                                                                                                                             │[2013-08-28 15:54:51] WARN  Could not determine content-length of response body. Set content-length of th
          $('#sidebar').hide('fast', function() {                                                                                                                     │e response or set Response#chunked = true
                $('#content').removeClass('span9');                                                                                                                   │
                $('#content').addClass('span12');                                                                                                                     │
                $('.hide-sidebar').hide();                                                                                                                            │Started GET "/assets/events.js?body=1" for 127.0.0.1 at 2013-08-28 15:54:51 -0400
                $('.show-sidebar').show();                                                                                                                            │[2013-08-28 15:54:51] WARN  Could not determine content-length of response body. Set content-length of th
          });                                                                                                                                                         │e response or set Response#chunked = true
        });                                                                                                                                                           │
                                                                                                                                                                      │
        $('.show-sidebar').click(function() {                                                                                                                         │Started GET "/assets/bootstrap-typeahead.js?body=1" for 127.0.0.1 at 2013-08-28 15:54:51 -0400
                $('#content').removeClass('span12');                                                                                                                  │[2013-08-28 15:54:51] WARN  Could not determine content-length of response body. Set content-length of th
                $('#content').addClass('span9');                                                                                                                      │e response or set Response#chunked = true
                $('.show-sidebar').hide();                                                                                                                            │
                $('.hide-sidebar').show();                                                                                                                            │
                $('#sidebar').show('fast');                                                                                                                           │Started GET "/assets/application.js?body=1" for 127.0.0.1 at 2013-08-28 15:54:51 -0400
        });                                                                                                                                                           │[2013-08-28 15:54:51] WARN  Could not determine content-length of response body. Set content-length of th
});
