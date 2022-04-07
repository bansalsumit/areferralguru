class RewardEligibilityPolicy < ApplicationPolicy
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

  def initialize(user, reward_rligibility)
    @user  = user
    @reward_rligibility = reward_rligibility
  end

  def create?
    (user.has_role? :admin) || (user.has_role? :shop_owner)
  end

  def update?
    false
  end

  private

  attr_reader :user, :reward_rligibility
end
