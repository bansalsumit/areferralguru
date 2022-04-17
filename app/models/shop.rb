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
  has_many :users, dependent: :destroy
  has_many :product_collections, dependent: :destroy
  has_many :programs
  has_many :email_performas

  validates :email, presence: true, :uniqueness => { :case_sensitive => false }

  before_validation :add_default_user, on: :create
  after_create :add_shop_owner_role_to_default_user

  def api_version
    ShopifyApp.configuration.api_version
  end

  def add_default_user
    user = self.users.build(email: email, password: 'test1234')
  end

  def add_shop_owner_role_to_default_user
    user = self.users.first
    user.add_role :shop_owner
  end
end
