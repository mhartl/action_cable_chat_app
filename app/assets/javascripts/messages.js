function message_appender(content) {
  $('#messages-table').append(content);
}

$(document).on('turbolinks:load', function() {
  message_appender('hello, world!');
});