# frozen_string_literal: true

class HomeController < ApplicationController
  include ShopifyApp::EmbeddedApp
  include ShopifyApp::RequireKnownShop
  include ShopifyApp::ShopAccessScopesVerification
  skip_before_filter :authenticate_user!

  
  def index
    @shop_origin = current_shopify_domain
    @host = params[:host]
  end
end
