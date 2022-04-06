# frozen_string_literal: true

# == Schema Information
#
# Table name: programs
#
#  id                         :bigint           not null, primary key
#  advocate_programeable_type :string
#  end_date                   :datetime
#  name                       :string
#  referred_programeable_type :string
#  start_date                 :datetime
#  type                       :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  advocate_programeable_id   :bigint
#  referred_programeable_id   :bigint
#  reward_eligibility_id      :bigint
#  shop_id                    :bigint
#
# Indexes
#
#  index_programs_on_advocate_programeable  (advocate_programeable_type,advocate_programeable_id)
#  index_programs_on_referred_programeable  (referred_programeable_type,referred_programeable_id)
#  index_programs_on_reward_eligibility_id  (reward_eligibility_id)
#  index_programs_on_shop_id                (shop_id)
#
class Program < ActiveRecord::Base
  belongs_to :shop
  belongs_to :advocate_programeable, polymorphic: true, optional: true
  belongs_to :referred_programeable, polymorphic: true, optional: true
  belongs_to :reward_eligibility, optional: true

  has_and_belongs_to_many :product_collections
end
