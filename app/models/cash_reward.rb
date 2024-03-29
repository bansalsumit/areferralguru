# frozen_string_literal: true

# == Schema Information
#
# Table name: cash_rewards
#
#  id                   :bigint           not null, primary key
#  all_products_allowed :boolean
#  description          :string
#  discount             :integer
#  discount_type        :string
#  program              :string
#  title                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  shop_id              :bigint
#
# Indexes
#
#  index_cash_rewards_on_shop_id  (shop_id)
#
class CashReward < ActiveRecord::Base
  has_one :program
end
