class FriendsController < ApplicationController
    def add
        @user = User.find(current_user.id)
        @friends = @user.users
    end

    def addfriend
        friend = User.where(:email => friend_params[:email]).first
        @friendUser = Friend.new({"friend_id"=> friend.id ,"user_id"=> friend_params[:user_id] })
        @friendUser.save
        @friend = @friendUser
    end

    def friend_params
        params.require(:friend).permit(:email , :user_id )
    end

    def destroy 
        @friend = Friend.find(params[:id])
        @friend.destroy
        
        respond_to do |format|
           format.html { redirect_to friend_delete_url }
           format.json { head :no_content }
         
          format.js
         end
      end

end
