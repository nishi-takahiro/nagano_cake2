class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  #マイページへのアクション
  def show
    @customer = current_customer
  end

  #編集へのアクション
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_customers_my_page_path
    else
      render :edit
    end
  end
  
  def unsubscribe
  end
  
  def withdraw
    @customer = Customer.find(current_customer[:id])
    # is_deletedカラムをtrueに変更することで削除フラグを
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end
  
end