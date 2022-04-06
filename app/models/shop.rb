# frozen_string_literal: true

# == Schema Information
#
# Table name: shops
#
#  id                :bigint           not null, primary key
#  access_scopes     :string
#  country           :string
#  customer_email    :string
#  domain            :string
#  email             :string
#  myshopify_domain  :string
#  name              :string
#  phone             :string
#  plan_display_name :string
#  plan_name         :string
#  province          :string
#  shop_owner        :string
#  shopify_domain    :string           not null
#  shopify_token     :string           not null
#  source            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_shops_on_shopify_domain  (shopify_domain) UNIQUE
#
class Shop < ActiveRecord::Base
  include ShopifyApp::ShopSessionStorageWithScopes

  has_many :customers, dependent: :destroy
  has_many :product_collections, dependent: :destroy
  has_many :programs

  validates :email, presence: true, :uniqueness => { :case_sensitive => false }

  after_create :create_user

  def api_version
    ShopifyApp.configuration.api_version
  end

  def create_user
    user = User.create(email: email, password: 'test1234')
    user.add_role :shop_owner
  end
end
