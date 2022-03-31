# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id                     :bigint           not null, primary key
#  accept_marketing       :boolean
#  active                 :boolean
#  country                :string
#  email                  :string
#  first_name             :string
#  last_name              :string
#  marketing_opt_in_level :string
#  orders_count           :integer
#  phone                  :string
#  province               :string
#  referral_email_sent    :boolean
#  referral_email_sent_at :datetime
#  sms_marketing_consent  :string
#  source                 :string
#  successful_advocate    :boolean
#  tags                   :string
#  total_earnings         :decimal(, )
#  total_referral         :integer
#  total_spent            :decimal(, )
#  unique_link            :string
#  zipcode                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  shop_id                :bigint
#  source_id              :string
#
# Indexes
#
#  index_customers_on_shop_id      (shop_id)
#  index_customers_on_unique_link  (unique_link)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#
class Customer < ActiveRecord::Base
  validates :email, :shop, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }


  belongs_to :shop
  
end
