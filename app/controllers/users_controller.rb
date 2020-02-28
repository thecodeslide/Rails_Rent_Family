class UsersController < ApplicationController

  def my_page
    authorize current_user
    @category = Category.new
    @categories = current_user.categories
  end


  def show
    @categories = policy_scope(current_user.categories)
  end

  def index
    @users = User.geocoded #returns flats with coordinates
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end

    # if params[:query].present?
    #   sql_query = " \
    #     users.first_name @@ :query \
    #     OR users.last_name @@ :query \
    #     OR users.location @@ :query \
    #     OR users.gender @@ :query \
    #     OR users.personality @@ :query \
    #   "
    #   # "users.age" returns "error" as age is an integer
    #   @users = User.where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @users = User.all
    # end
  end

end
