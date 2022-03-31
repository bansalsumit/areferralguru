# frozen_string_literal: true

# == Schema Information
#
# Table name: product_collections
#
#  id                    :bigint           not null, primary key
#  handle                :string
#  title                 :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  reward_eligibility_id :bigint
#  shop_id               :bigint
#
# Indexes
#
#  index_product_collections_on_reward_eligibility_id  (reward_eligibility_id)
#  index_product_collections_on_shop_id                (shop_id)
#
class ProductCollection < ActiveRecord::Base
  validates :title, :shop, presence: true

  belongs_to :shop  

  has_and_belongs_to_many :programs
end
