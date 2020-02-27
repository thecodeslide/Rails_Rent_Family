class UsersController < ApplicationController

  def my_page
    authorize current_user
    @category = Category.new
    @categories = current_user.categories
  end

  def show
    @categories = policy_scope(current_user.categories)
  end

    @users = User.geocoded #returns flats with coordinates

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end

end
