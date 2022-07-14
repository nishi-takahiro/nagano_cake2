class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new #購入情報の入力画面で、宛先や情緒などを入力する。
    @order = Order.new
    @customer = current_customer
  end
  
  def index
    @orders = current_customer.orders.all
    # binding.pry
  end

  def show
    @order = Order.find(params[:id])
    @order.postage = 800
    @order_item = @order.order_details
    @total = 0
    # OrderDetail.all.sum(:price)*(:amount)
  end
 
  def create #購入の確定、Orderに情報を保存
    cart_items = current_customer.cart_items.all #ログインユーザーのカートアイテムを全て取り出す。
    @order = current_customer.orders.new(order_params) #紐づけされて値を @order にいれる

    if @order.save
     cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.amount
        order_detail.price = cart.item.price
        order_detail.save
    end
      redirect_to public_orders_complete_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params) # newから渡ってきたデータを @orderにいれる
    @order.postage = 800 #送料
    @cart_items = current_customer.cart_items.all #カートアイテムの情報を取り出すためのもの
    @total = @cart_items.inject(0) { |sum,item| sum + item.sum_tax } #商品の合計をだすための計算
    @total_all = @total + @order.postage #送料を含めた合計をだすための計算
    
    # viewで定義ているaddress_numberが"address_1"だったときの処理
    # @order の各カラムに必要なカラムを紐づけ（入れて）していく
    if params[:order][:address_number] == "address_1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      
    # viewで定義ているaddress_numberが"address_2"だったときの処理
    elsif params[:order][:address_number] == "address_2"
      if Address.find(params[:order][:address_id])
        @order.postal_code = Address.find(params[:order][:address_id]).postal_code
        @order.name = Address.find(params[:order][:address_id]).name
        @order.address =Address.find(params[:order][:address_id]).address
      else
        render :new
      end
    
    # viewで定義ているaddress_numberが"address_3"だったときの処理
    elsif params[:order][:address_number] == "address_3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else 
        render :new
    end
    else
      redirect_to new_public_order_path
    end
    # binding.pry
 end
 
  def complete
  end

  private
  
  def address_params
    params.require(:order).permit(:name, :address,:postal_code)
  end
  
  def order_params
    params.require(:order).permit( :postal_code, :name, :address, :status, :total_payment, :payment_method )
  end
end
