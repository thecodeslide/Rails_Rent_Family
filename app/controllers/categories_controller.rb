class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:category]
      @categories = policy_scope(Category.where(name: params[:category]))
    else
      @categories = policy_scope(Category.all)
    end
    geocode
  end
  
  def geocode
    @users = User.geocoded #returns flats with coordinates
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def show
    # skip_policy_scope
    authorize set_category

  end

  def new
    # raise
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
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
    @category = Category.find(params[:id])
    authorize @category
  end

  def category_params
    params.require(:category).permit(:name, :description, :price, :photo)
  end
end
