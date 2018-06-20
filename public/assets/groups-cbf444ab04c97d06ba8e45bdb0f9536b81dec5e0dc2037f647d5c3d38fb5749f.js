(function() {
  jQuery.fn.ready = function(fn) {
    return $(this).on('turbolinks:load', fn);
  };

}).call(this);
