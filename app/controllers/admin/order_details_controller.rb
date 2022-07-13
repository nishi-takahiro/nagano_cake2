class Admin::OrderDetailsController < ApplicationController

  
  def update
     @order_details = OrderDetail.find(params[:id])
     @order = @order_details.order
     @order_details.update(order_details_params)
     if @order_details.making_status == "work_middle"
        @order.update(status: "under_prodction")
     elsif @order_details.making_status == "work_completion"
           @order.update(status: "preparing_ship")
     redirect_to admin_order_path(@order_details.order)
     else
       render "show"
     end
  end
  
  private
  
   def order_details_params
    params.require(:order_detail).permit( :item, :price, :amount, :making_status )
  end
end