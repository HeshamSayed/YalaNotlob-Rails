class AllNotificationsController < ApplicationController
  def index
    @notifications = Notification.where(user_id: current_user.id)
  end

  def list
    @notifications = Notification.where(user_id: current_user.id).last(5).reverse
    render :json => @notifications
  end
end
