class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @categories = policy_scope(Category.all)
  end

  def show
    # skip_policy_scope
    set_category
  end

  def new
    # raise
    @category = authorize Category.new
  end

  def create
    @category = authorize Category.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to root_path
    else
      @categories = current_user.categories
      render 'users/my_page'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to category_path
    else
      render :edit
    end
  end

  private

  def set_category
    @category = authorize Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :price, :photo)
  end
end
