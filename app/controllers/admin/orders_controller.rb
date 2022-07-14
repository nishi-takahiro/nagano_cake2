class Admin::OrdersController < ApplicationController
 before_action :authenticate_admin!
 
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.postage = 800
  end
  
  def update
     @order = Order.find(params[:id])
     @order_details = @order.order_details
     @order.update(order_params)
     if @order.status == "payment_confirmation"
        @order_details.update_all(making_status: "work_wait")
     end
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