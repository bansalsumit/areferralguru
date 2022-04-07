class CustomRewardPolicy < ApplicationPolicy
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

  def initialize(user, custom_reward)
    @user  = user
    @custom_reward = custom_reward
  end

  def create?
    (user.has_role? :admin) || (user.has_role? :shop_owner)
  end

  def update?
    false
  end

  private

  attr_reader :user, :custom_reward
end
