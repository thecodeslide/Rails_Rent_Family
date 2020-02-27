class UsersController < ApplicationController

  def my_page
    @category = Category.new
    @categories = current_user.categories
  end
end
