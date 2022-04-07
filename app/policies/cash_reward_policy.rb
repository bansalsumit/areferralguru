class CashRewardPolicy < ApplicationPolicy
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

  def initialize(user, cash_reward)
    @user  = user
    @cash_reward = cash_reward
  end

  def create?
    (user.has_role? :admin) || (user.has_role? :shop_owner)
  end

  def update?
    false
  end

  private

  attr_reader :user, :cash_reward
end
