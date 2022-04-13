class EmailPerformaPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.has_role? :admin
        scope.all
      else
        scope.where(shop_id: @user.shop_id)
      end
    end

    private

    attr_reader :user, :scope
  end

  def initialize(user, email_performa)
    @user  = user
    @email_performa = email_performa
  end

  def create?
    (user.has_role? :admin) || (user.has_role? :shop_owner)
  end

  def update?
    false
  end

  def index?
    true
  end

  private

  attr_reader :user, :email_performa
end
