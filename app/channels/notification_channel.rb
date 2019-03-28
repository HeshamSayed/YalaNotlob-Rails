class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from current_user.username
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_notifi(data)

    @d = data['message'].split(",")
    ActionCable.server.broadcast @d[0], message:data['message']

    # ActionCable.server.broadcast  , message:data['message']
    # @d = data['notifi'].split(",")
    # ActionCable.server.broadcast @d[0], notifi:data['notifi']
    # -----------------
    # msg = message:data['message'].split(",")
    #   userId = msg[0]
    #   invitedUserName = msg[2]
    #   if msg[1] == "Invitation"
    #     @orderId = Order.last(1).first.id
    #     ActionCable.server.broadcast "1", message:data['message']


  end
end
