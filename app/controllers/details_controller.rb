class DetailsController < ApplicationController
    def index
        @order = Order.find(params[:order_id])
        @invited = OrdersUser.all
        @users = User.all
    end
    def new
        # @orderDetails = OrderDetail.new
        # @orderDetails.item = 'batates'
        # @orderDetails.amount = 1
        # @orderDetails.price = 2.50
        # @orderDetails.comments = 't7ena'
        # @orderDetails.user_id = 1
        # @orderDetails.order_id = 1
        # @orderDetails.save
    end
    def create
        # render plain: params[:order_detail].inspect
        # new_order_detail = JSON.parse(params[:order_detail])
        @order = Order.find(params[:order_id])
        @orderDetails = OrderDetail.new()
        @orderDetails.item = params[:order_detail]['item']
        @orderDetails.amount = params[:order_detail]['amount']
        @orderDetails.price = params[:order_detail]['price']
        @orderDetails.comments = params[:order_detail]['comment']
        @orderDetails.user_id = current_user.id
        @orderDetails.order_id = @order.id
        @orderDetails.save
        redirect_to "/orders/#{@order.id}/details" 
    end
    def destroy
        # @order = Order.find(params[:order_id])
        # @orderDetail = @order.order_details.find(params[:id])
        # @orderDetail.destroy
        # # redirect_to order_details
        @order = Order.find(params[:order_id])
        @orderDetail = @order.order_details.find(params[:id])
        @orderDetail.destroy
        
        respond_to do |format|
            format.html { redirect_to order_detail_url }
            format.json { head :no_content }
            
            format.js
        end
        redirect_to "/orders/#{@order.id}/details"
          
    end
end
