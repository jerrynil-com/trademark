class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @uniq_group_codes = @category.items.pluck(:group_code).uniq
  end
end
