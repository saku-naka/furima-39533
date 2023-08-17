class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]

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

  def edit
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

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
