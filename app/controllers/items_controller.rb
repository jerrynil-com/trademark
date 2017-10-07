class ItemsController < ApplicationController
  before_action :set_category
  before_action :set_item, only: [:edit, :update]

  def index
    @items = Item.all
  end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to category_path(@item.category_id)
    else
      render 'edit'
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def item_params
    params.require(:item).permit(:group_code, :name, :category_id)
  end

end
