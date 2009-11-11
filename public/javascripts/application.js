// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function()
{
    $.formAdvisor({ offset: 12 });
    
    $(".kudos-button").click(function(e) {
      $.post($(this).attr('data-url'), "", function(data, statusText) {
        if (data.toReplace) {
          $.each(data.toReplace, function(i,val) {
            $("#" + i).html(val);
          });
        }
      }, "json")
      return false;
    })
    
});