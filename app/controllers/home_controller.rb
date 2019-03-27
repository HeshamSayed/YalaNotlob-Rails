class HomeController < ApplicationController
  def index
    @lastOrder = Order.where(user_id: current_user.id).order("id asc").last(5)
  end
end
