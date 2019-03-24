class OrdersController < ApplicationController
    def index
        @orders = Order.all
        # @order = Order.new
        # @order.meal = 'dinner'
        # @order.restaurant_name = 'Prego'
        # @order.user_id = 3
        # @order.menu_image = 'image'
        # @order.status = 1
        # @order.save
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
        params.require(:order).permit(:restaurant_name, :meal,:menu_image)
    end


end
