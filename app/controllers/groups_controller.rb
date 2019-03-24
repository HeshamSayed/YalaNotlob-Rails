class GroupsController < ApplicationController
  def index
  end

  def add
    @user = User.find(current_user.id)
    @groups = @user.groups
    # render :text => @groups.inspect
  end

  def destroy 
    @group = Group.find(params[:id])
    @group.destroy
    
    respond_to do |format|
       format.html { redirect_to group_delete_url }
       format.json { head :no_content }
     
      format.js
     end
  end
  def show
    @group = Group.find(params[:id])
 end
  def addgroup
    @group = Group.new(group_params)
   
    if @group.save
      respond_to do |format|
      format.html { redirect_to @group, notice: 'User was successfully created.' }
      format.js
      format.json { head :no_content }
      end
    else
       
    end
    
 end

 def groupmember
  @group = Group.find(params[:id])
  respond_to do |format|
    # format.html { redirect_to group_delete_url }
    format.json { head :no_content }
   format.js
  end
 end

 def addmember
       friend = User.where(:username => friend_params[:name ]).first
      @groupUser = GroupsUser.new({"member_id"=> friend.id ,"group_id"=> friend_params[:group_id ] })
     @groupUser.save
     @member =User.where(:id => @groupUser.member_id).first
 end
 
 def group_params
    params.require(:group).permit(:name, :user_id)
 end

 def friend_params
   params.require(:friend).permit(:name , :user_id ,:group_id)
 end

end
