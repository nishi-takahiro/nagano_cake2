class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
end

private

def customer_params
  params.require(:customer).permit(:name, :introduction, :price, :image, :is_active, :genre_id)
end