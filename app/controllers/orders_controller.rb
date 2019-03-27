class OrdersController < ApplicationController
    require 'will_paginate/array'
    def index

        @orders = Order.where(user_id: current_user.id).paginate page: params[:page], per_page: 2
        @invited = OrdersUser
        # @newOrder = OrdersUser.where(user_id: current_user.id).inspect
   end

    def destroy
        @orders = Order.find(params[:id])
        @orders.destroy
        redirect_to orders_path
        end
     
        def update
            @order = Order.find(params[:id])
            p params[:id];
            @order.update(status: 1)
            redirect_to orders_path
        end
  
    def new
        @order = Order.new
    end

    def create 
        #logger.debug "\n#{params[:tags]}\n";
        @order = Order.new({"meal"=>order_params[:meal] , "restaurant_name"=>order_params[:restaurant_name] ,"menu_image"=>order_params[:menu_image] })
        @order.user_id = current_user.id
        @order.status=0
        @order.save
        if @order.save
          #  logger.debug "\n#{params[:friends}\n";
           logger.debug "\n#{order_params[:friends]}\n";

           for friend in order_params[:friends]
            @user = User.where(:username => friend).first
            @ordersUser = OrdersUser.new({"order_id"=> @order.id ,"user_id"=> @user.id })
            @ordersUser.save
            end
           
            redirect_to "/orders/#{@order.id}/details"
        else
            render 'new'
        end
       
    end

    def test
        @user = User.find(current_user.id)
        @friends = @user.users
        @customFriends = []
        for friend in @friends
            es = User.where("id = ?", friend.friend_id).first
                @customFriends << es
        end
     
        respond_to do |format|
          format.html
          format.json {render json: @customFriends}
        end
    end


    def group
        @user = User.find(current_user.id)
        @groups = @user.groups
        respond_to do |format|
          format.html
          format.json {render json: @groups}
        end
    end
    

    def save
        #logger.debug "\n#{params[:tags]}\n";
        JSON.parse(params[:tags]);
        
    end

    def saveadd
        #logger.debug "\n#{params[:tags]}\n";
       # @ar = JSON.parse(params[:tags]);
        logger.debug "\n#{save}\n";
        @user = User.where(:username => save).first
        @orderUser = OrdersUser.new({"order_id"=> 1 ,"user_id"=> @user })
        @OrdersUser.save
    end

    def show
        @order = Order.find(params[:id])
    end

    private
    def order_params
        params.require(:order).permit(:restaurant_name, :meal,:menu_image,:friends => {})
        
    end


end
