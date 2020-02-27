class UsersController < ApplicationController


  def my_page
    @categories = current_user.categories
  end

end
