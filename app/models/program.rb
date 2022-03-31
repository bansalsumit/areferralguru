# frozen_string_literal: true
class Program < ActiveRecord::Base
  belongs_to :shop
  belongs_to :advocate_programeable, polymorphic: true
  belongs_to :referred_programeable, polymorphic: true
  belongs_to :reward_eligibility

  has_and_belongs_to_many :product_collections
end