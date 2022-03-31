# frozen_string_literal: true

# == Schema Information
#
# Table name: custom_rewards
#
#  id                   :bigint           not null, primary key
#  all_products_allowed :boolean
#  description          :string
#  program              :string
#  title                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  shop_id              :bigint
#
# Indexes
#
#  index_custom_rewards_on_shop_id  (shop_id)
#
class CustomReward < ActiveRecord::Base
  has_one :program
end
