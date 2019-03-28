class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from current_user.username
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_notifi(data)
  #   puts "SENDING MESSAGE\n"
  # puts "data['message']\n"
  # msg = data['message'].split(",")
  # userId = msg[0]
  # invitedUserName = msg[2]
  # # userid,Inviation,mohamed
  # if msg[1] == "Invitation"
  #   @orderId = Order.last(1).first.id
  #   ActionCable.server.broadcast userId, message:"invited y to "+","+@orderId.to_s


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






# def send_msg(data)
#   puts "SENDING MESSAGE\n"
#   puts "data['message']\n"
#   msg = data['message'].split(",")
#   userId = msg[0]
#   invitedUserName = msg[2]
#   if msg[1] == "Invitation"
#     @orderId = Order.last(1).first.id
#     ActionCable.server.broadcast userId, message:data['message']+","+@orderId.to_s
#   end
# end