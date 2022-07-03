class Public::OrdersController < ApplicationController
  def new
    @order = current_customer
  end

  def confirm
    @order = Order.new(order_params)
   
  end

  def complete
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit( :postal_code, :name, :address, :status, :total_payment, :payment_method )
  end
end
