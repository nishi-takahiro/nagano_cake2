class Admin::ItemsController < ApplicationController
  

  def new
    @item = Item.new
  end

  def index
  end

  def show
  end

  def edit
  end
  
  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(:id)
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image,:is_active)
  end
end
