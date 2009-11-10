/*
Copyright (c) 2009 Pawe³ Miko³ajewski (http://gamma.mini.pw.edu.pl/~mikolajewskip)

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

*/

(function($) {
  $.formAdvisor = function(settings) {
 
    settings = jQuery.extend({
      fadeTime : 500,
      offset: 0
    }, settings);
  
    $('.show_advice').focus(function () {
      
      $('.form_advisor').remove();
  
      var position = $(this).offset(); 
    
      var advisorElem = $("<div class='form_advisor'>"+$(this).attr('title')+"</div>");
    
      var advisorCss = {
        'position' : 'absolute',
        'left' : position.left + $(this).width() + settings.offset + 'px',
        'top' : position.top + 'px',
        'display' : 'none'
      }
  
      advisorElem.css(advisorCss);
      advisorElem.appendTo('body');
      advisorElem.fadeIn(settings.fadeTime);
     
    });

    $('.show_advice').blur(function () {
      
      $('.form_advisor').fadeOut(settings.fadeTime);

    });
  };
})(jQuery);
