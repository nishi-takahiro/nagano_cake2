class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.postage = 800
  end
  
  def update
     @order = Order.find(params[:id])
     @order.update(order_params)
     redirect_to admin_order_path
  end
  
  private
  
   def order_params
    params.require(:order).permit( :making_status, :status )
  end
  
   def order_details_params
    params.require(:order_detail).permit( :item, :price, :amount, :making_status )
  end
end