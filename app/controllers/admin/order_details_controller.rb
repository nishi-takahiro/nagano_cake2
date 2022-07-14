class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
     @order_details = OrderDetail.find(params[:id])
     @order = @order_details.order
     @order_details.update(order_details_params)
     if @order_details.making_status == "work_middle"
        @order.update(status: "under_prodction")
        @order.save
        redirect_to admin_order_path(@order_details.order)
     elsif @order.order_details.count == @order.order_details.where(making_status: "work_completion").count
           @order.update(status: "preparing_ship")
           @order.save
           redirect_to admin_order_path(@order_details.order)
     else
        redirect_to admin_order_path(@order_details.order)
     end
   end
  
  private
  
   def order_details_params
    params.require(:order_detail).permit( :item, :price, :amount, :making_status )
  end
end