App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if (data.message && !data.message.blank?)
      $('#messages-table').append(data.message)
      scroll_bottom()
    if data.mention
      alert('You have a new mention')


scroll_bottom = () ->
  height = $('#messages')[0].scrollHeight
  $('#messages').scrollTop(height)

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey
      $('input').click()
      event.target.value = ""
      event.preventDefault()

$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()
