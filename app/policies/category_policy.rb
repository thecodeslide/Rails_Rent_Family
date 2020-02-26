class CategoryPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     # scope.all
  #     scope.where(user: user)
  #   end
  # end

  # def create?
  #   return true
  # end

  # def update?
  #   record.user == user
  #   # - record: the booking passed to the `authorize` method in controller
  #   # - user:   the `current_user` signed in with Devise.
  # end

  # def destroy?
  #   record.user == user
  # end


  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def show?
  #   true
  # end

  def create?
    # return true
    user.present?
  end

  def update?
    record.user == user
    # - record: the booking passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end

end


# class ArticlePolicy < ApplicationPolicy
#   def index?
#     true
#   end

#   def create?
#     user.present?
#   end

#   def update?
#     return true if user.present? && user == article.user
#   end

#   def destroy?
#     return true if user.present? && user == article.user
#   end

#   private

#     def article
#       record
#     end
# end
