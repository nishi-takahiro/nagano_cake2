class Admin::ItemsController < ApplicationController
  

  def new
    @item = Item.new
  end

  def index
  end

  def show
   
   @item = Item.find(params[:id])
   binding.pry
  end

  def edit
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end
  
   def update
  	@item = Item.find(params[:id])
  	if @item.update(item_params)
  	  redirect_to admin_item_path(@item.id)
  	else
  		render "edit"
  	end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :is_active, :genre_id)
  end
end
