# frozen_string_literal: true
class Customer < ActiveRecord::Base
  validates :email, :shop, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }


  belongs_to :shop
  
end
