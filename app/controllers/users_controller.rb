class UsersController < ApplicationController

  def my_page
    @categories = current_user.categories
  end

  def index
    if params[:query].present?
      sql_query = " \
        users.first_name @@ :query \
        OR users.last_name @@ :query \
        OR users.location @@ :query \
        OR users.gender @@ :query \
        OR users.personality @@ :query \
      "
      # "users.age" returns "error" as age is an integer
      @users = User.where(sql_query, query: "%#{params[:query]}%")
    else
      # @users = User.all
      @users = User.all
    end
  end

end
