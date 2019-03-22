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
end
