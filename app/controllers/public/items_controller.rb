class Public::ItemsController < ApplicationController
  def show
   @item = Item.find(params[:id])
   @cart_item = CartItem.new
  end

  def index
    @item = Item.page(params[:page]).per(8)
  end
  

  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :is_active, :genre_id, :amount)
  end
end