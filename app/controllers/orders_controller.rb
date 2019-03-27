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
            # @order.user_id = current_user.id
            @order.update(status: 1)
            redirect_to orders_path
        end
  
    def new
        @order = Order.new
    end

    def create 
        @order = Order.new(order_params)
        @order.user_id = current_user.id
        @order.status=0
        if @order.save
            redirect_to @order
        else
            render 'new'
        end
    end


    def show
        @order = Order.find(params[:id])
    end

    private
    def order_params
        params.require(:order).permit(:restaurant_name, :meal,:menu_image,:tags)
    end


end
