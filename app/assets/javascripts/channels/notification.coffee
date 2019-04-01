App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("connected successfully")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log(data['message'])
    console.log("notification received")

  send_notifi: (data) ->
    @perform 'send_notifi', message:data
