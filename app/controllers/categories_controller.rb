class CategoriesController < ApplicationController
  before_action :set_category, only: [show:, create:]
  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(cateogry_params)
    if @category.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def cateogry_params
    params.require(:category).permit(:name, :description, :price)
  end
end
