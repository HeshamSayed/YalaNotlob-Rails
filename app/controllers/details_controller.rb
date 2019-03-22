class DetailsController < ApplicationController
    def index
        @order = Order.find(params[:order_id])
    end
    def new
        # @orderDetails = OrderDetail.new
        # @orderDetails.item = 'batates'
        # @orderDetails.amount = 1
        # @orderDetails.price = 2.50
        # @orderDetails.comments = 't7ena'
        # @orderDetails.user_id = 1
        # @orderDetails.order_id = 2
        # @orderDetails.save
    end
end
