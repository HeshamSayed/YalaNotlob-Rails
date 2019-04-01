class AllNotificationsController < ApplicationController
  def index
    @notifications = Notification.where(user_id: current_user.id)
  end

  def list
    @notifications = Notification.where(user_id: current_user.id).limit(5)
    render :json => @notifications
  end
end
