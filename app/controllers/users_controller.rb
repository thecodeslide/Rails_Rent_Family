class UsersController < ApplicationController
  def index
    @users = User.geocoded #returns flats with coordinates

    @markers = @flats.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end
end
