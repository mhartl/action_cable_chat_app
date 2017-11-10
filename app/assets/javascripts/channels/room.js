App.room = App.cable.subscriptions.create('RoomChannel', {
  connected: function () {
    console.log('x is connected')
  },
  disconnected: function () {},
  received: function (data) {
    console.log(`
      new message
      data.content is ${data.content}
      data.username is ${data.username}
    `)
  }
})
