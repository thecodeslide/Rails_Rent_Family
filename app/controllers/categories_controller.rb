class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = " \
        users.first_name @@ :query \
        OR users.last_name @@ :query \
        OR users.location @@ :query \
        OR users.gender @@ :query \
        OR users.personality @@ :query \
        OR categories.name @@ :query
      "
      @categories = policy_scope(Category).joins(:user).where(sql_query, query: "%#{params[:query]}%")
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
        # infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
      }
    end
  end

  def show
    # skip_policy_scope
    # authorize set_category
    set_category
    @markers = [
      {
        lat: @category.user.latitude ,
        lng: @category.user.longitude
      }
    ]
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
      redirect_to my_page_path
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
