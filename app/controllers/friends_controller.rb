class FriendsController < ApplicationController
    def add
        @user = User.find(current_user.id)
        @friends = @user.users
    end

    def addfriend
        friend = User.where(:email => friend_params[:email]).first
        # @friendUser = Friend.new({"friend_id"=> @friend.id ,"user_id"=> friend_params[:user_id] })
        #  @friendUser.save
        #  @friend =User.where(:id => @friend.id).first
    end

    def friend_params
        params.require(:friend).permit(:email , :user_id )
    end

end
