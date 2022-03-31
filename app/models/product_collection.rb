# frozen_string_literal: true
class ProductCollection < ActiveRecord::Base
  validates :title, :shop, presence: true

  belongs_to :shop  

  has_and_belongs_to_many :programs
end
