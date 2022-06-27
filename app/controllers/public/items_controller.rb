class Public::ItemsController < ApplicationController
  def show
   @item = Item.find(params[:id])
  end

  def index
    @item = Item.all
    @cart_item = CartItem.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.item_id = current_user.id
    @item.save
    redirect_to public_item_path
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :is_active, :genre_id, :amount)
  end
end