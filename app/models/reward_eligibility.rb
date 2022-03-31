# frozen_string_literal: true

# == Schema Information
#
# Table name: reward_eligibilities
#
#  id                             :bigint           not null, primary key
#  eligible_purchase              :integer
#  minimum_spend                  :integer
#  minimum_successful_conversions :integer
#  purchase_review_period         :integer
#  reward_eligiable_type          :string
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  reward_eligiable_id            :bigint
#  shop_id                        :bigint
#
# Indexes
#
#  index_reward_eligibilities_on_shop_id  (shop_id)
#
class RewardEligibility < ActiveRecord::Base
end
