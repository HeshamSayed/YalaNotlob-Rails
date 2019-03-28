class HomeController < ApplicationController
  def index
    @lastOrder = Order.where(user_id: current_user.id).order("id Desc").last(4)
   
    @friendActivity = Order.where(
      user_id: Friend.select("friend_id")
      .where(user_id: current_user.id)
  ).order("id Desc").last(3)

  end
 
end
