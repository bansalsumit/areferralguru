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
    user.has_admin_or_owner_role?
  end

  def create?
    user.has_admin_or_owner_role?
  end

  private

  attr_reader :user, :customer
end
