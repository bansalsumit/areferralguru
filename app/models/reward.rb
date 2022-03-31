# == Schema Information
#
# Table name: rewards
#
#  id                   :bigint           not null, primary key
#  all_products_allowed :boolean
#  coupon_expiry        :integer
#  description          :string
#  discount             :integer
#  discount_type        :string
#  program              :string
#  reward_type          :integer
#  title                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  shop_id              :bigint
#
# Indexes
#
#  index_rewards_on_shop_id  (shop_id)
#
class Reward < ApplicationRecord
  has_one :program

  enum reward_type: { coupan_rewards: 0, cash_rewards: 1, custom_rewards: 2 }
end
