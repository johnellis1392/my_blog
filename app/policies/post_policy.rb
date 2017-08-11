class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def show?
    true
  end

  def update?
    @user == @post.user
  end

  def destroy?
    @user == @post.user
  end

  # Example update qualifier
  # def update?
  #   user.admin? or not post.published?
  # end

  class Scope < Scope
    # Auto-generated initializer
    # def initialize(user, scope)
    #   @user = user
    #   @scope = scope
    # end

    def resolve
      # Example use of resolve method
      # if user.admin?
      #   scope.all
      # else
      #   scope.where(published: true)
      # end

      scope
    end
  end
end
