(function() {
  jQuery(document).on('turbolinks:load', function() {
    var messages, messages_to_bottom;
    messages = $('#conversation-body');
    if (messages.length > 0) {
      messages_to_bottom = function() {
        return messages.scrollTop(messages.prop("scrollHeight"));
      };
      return messages_to_bottom();
    }
  });

}).call(this);
