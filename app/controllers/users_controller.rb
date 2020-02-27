class UsersController < ApplicationController


  def my_page
    @categories = current_user.categories
  end

    @users = User.geocoded #returns flats with coordinates

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
end
