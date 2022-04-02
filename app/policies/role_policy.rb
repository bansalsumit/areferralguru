class RolePolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.has_role? :admin
        scope.all
      else
        scope.where.not(name: 'admin')
      end
    end

    private

    attr_reader :user, :scope
  end

  def initialize(user, role)
    @user  = user
    @role = role
  end

  def index?
    (user.has_role? :admin) || (user.has_role? :shop_owner)
  end

  private

  attr_reader :user, :role
end
