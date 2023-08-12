class ItemsController < ApplicationController

  def index
    @itemss = Item.all
  end

  def new
    @items = Item.new
  end
  

  private

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
end
