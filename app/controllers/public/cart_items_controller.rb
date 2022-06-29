class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @item = Item.find(params[:cart_item][:item_id]) #parametersの中を取ってきているfind(params[:cart_item]のなかの[:item_id])
    @cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: @item.id) #三つ（current_customer.id、[:cart_item][:item_id]）のデータがあることを確認している
    if @cart_item 
    else
      
      @cart_item = CartItem.new(cart_item_params) #新しいカートアイテムを作成
      @cart_item.customer_id = current_customer.id #current_customer.id を @cart_item.customer_id に代入
      @cart_item.save #データのセーブ
    end
    redirect_to public_cart_items_path
    #binding.pry
  end

  def update
   
  end 

private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end