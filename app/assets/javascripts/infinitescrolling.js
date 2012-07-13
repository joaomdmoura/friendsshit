//Stolen from infinitescrolling gem.
//Sorry , should accept parameters...
(function($){
  var my = {
    marginThreshold: 20,

    delay: 250,

    hasScrolled: false,

    callback: function(){
      if (!my.hasScrolled){
        my.hasScrolled = true;
        setTimeout(my.checkScroll, my.delay);
      }
    },

    checkScroll: function() {
      my.hasScrolled = false;
      if (my.lowEnough()) {
        my.loadCallback();
      }
    },

    lowEnough: function() {
      var pageHeight = $(document).height();
      var viewportHeight = $(window).height();
      var scrollHeight = $(document).scrollTop();
      return pageHeight - viewportHeight - scrollHeight < my.marginThreshold;
    }
  };

  $.fn.infiniteScrolling = function(options){
    mine = $.extend(my, options);
    this.bind('scroll', mine.callback);
    this.bind('resize', mine.callback);
    return this;
  };
})(jQuery);
