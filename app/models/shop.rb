# frozen_string_literal: true
class Shop < ActiveRecord::Base
  include ShopifyApp::ShopSessionStorageWithScopes

  has_many :customers, dependent: :destroy
  has_many :product_collections, dependent: :destroy
  has_many :programs

  def api_version
    ShopifyApp.configuration.api_version
  end
end
