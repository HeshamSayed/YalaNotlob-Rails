class HomeController < ApplicationController
  def index
    @lastOrder = Order.where(user_id: current_user.id).order("id Desc").last(5)
   
    @orders = Order.where(
      user_id: Friend.select("friend_id")
      .where(user_id: current_user.id)
  ).order("id Desc").last(4)

  end

  def friendactivity
    @orders = Order.where(
      user_id: Friend.select("friend_id")
      .where(user_id: current_user.id)
  ).order("id Desc").last(4)
  @test_temp =[]
  for order in @orders 

    @test_temp << {:name => User.find_by_id(order.user_id).username , :meal => order.meal ,:restaurant_name =>order.restaurant_name}
  end
  respond_to do |format|
    format.html
    format.json {render json: @test_temp}
  end
      # respond_to do |format|
      # format.html { redirect_to @orders, notice: 'group was successfully created.' }
      # format.js
      # format.json { head :no_content }
      # end
    
 end
end
