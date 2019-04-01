class AllNotificationsController < ApplicationController
  def index
    @notifications = Notification.where(user_id: current_user.id)
  end

  def list
    @notifications = Notification.where(user_id: current_user.id).last(5).reverse
    @len = Notification.all.count
    render :json => @notifications
  end

  def count_all
    @len = Notification.all.count
    render :json => @len
  end

end
