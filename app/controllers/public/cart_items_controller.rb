class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :cart_item_item?, only: [:create]
 
  def index
    @cart_items = current_customer.cart_items
    # 商品の合計を出すための計算
    @total = @cart_items.inject(0) { |sum,item| sum + item.sum_tax}
  end

  def create
    @item = Item.find(params[:cart_item][:item_id]) #parametersの中を取ってきているfind(params[:cart_item]のなかの[:item_id])
    @cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: @item.id) #三つ（current_customer.id、[:cart_item][:item_id]）のデータがあることを確認している
    if @cart_item.present? 
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.save
    else
      @cart_item = CartItem.new(cart_item_params) #新しいカートアイテムを作成
      @cart_item.customer_id = current_customer.id #current_customer.id を @cart_item.customer_id に代入
      @cart_item.save #データのセーブ
    end
    redirect_to public_cart_items_path
    #binding.pry
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end
  
  def destroy_all
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    redirect_to public_cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path(@cart_item)
  end 

private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end