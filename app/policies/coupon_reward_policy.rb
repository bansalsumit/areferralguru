class CouponRewardPolicy < ApplicationPolicy
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

  def initialize(user, coupon_reward)
    @user  = user
    @coupon_reward = coupon_reward
  end

  def index?
    (user.has_role? :admin) || (user.has_role? :shop_owner)
  end

  def create?
    index?
  end

  private

  attr_reader :user, :coupon_reward
end
