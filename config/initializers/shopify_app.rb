ShopifyApp.configure do |config|
  config.application_name = "A Referral Guru"
  config.old_secret = ""
  config.scope = "read_products, read_orders,
    read_customers, read_discounts, write_discounts, 
    read_gift_cards, write_gift_cards, write_customers,
    read_marketing_events, write_marketing_events,
    read_price_rules, write_price_rules,
    read_script_tags, write_script_tags,
    read_locations, read_product_listings" # Consult this page for more scope options:
                                  # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2022-01"
  config.shop_session_repository = 'Shop'

  config.reauth_on_access_scope_changes = true

  config.allow_jwt_authentication = true
  config.allow_cookie_authentication = false

  config.api_key = Rails.application.credentials[:shopify][:api_key].presence
  config.secret = Rails.application.credentials[:shopify][:api_secret].presence
  if defined? Rails::Server
    raise('Missing SHOPIFY_API_KEY. See https://github.com/Shopify/shopify_app#requirements') unless config.api_key
    raise('Missing SHOPIFY_API_SECRET. See https://github.com/Shopify/shopify_app#requirements') unless config.secret
  end
end

# ShopifyApp::Utils.fetch_known_api_versions                        # Uncomment to fetch known api versions from shopify servers on boot
# ShopifyAPI::ApiVersion.version_lookup_mode = :raise_on_unknown    # Uncomment to raise an error if attempting to use an api version that was not previously known
