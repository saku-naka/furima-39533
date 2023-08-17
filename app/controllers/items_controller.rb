class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new, status: :unprocessable_entity
    end
  end

  #def destroy
    #item = Item.find(params[:id])
    #item.destroy
    #redirect_to_root_path
  #end

  #def edit
  #end

  #def update
   # item = Item.find(params[:id])
   # item.update(item,_params)
   # redirect_to_root_path
 # end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_date_id, :price ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
