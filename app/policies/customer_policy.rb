class CustomerPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.has_role? :admin
        scope.all
      else
        scope.where(id: nil)
      end
    end

    private

    attr_reader :user, :scope
  end

  def initialize(user, customer)
    @user  = user
    @customer = customer
  end

  def index?
    (user.has_role? :admin) || (user.has_role? :shop_owner)
  end

  private

  attr_reader :user, :customer
end
