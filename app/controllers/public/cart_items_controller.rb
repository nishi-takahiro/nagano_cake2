class Public::CartItemsController < ApplicationController
  def index
  end
end

def create
 @item = Item.find(cart_item.params[:item_id])
end

private
def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
end
