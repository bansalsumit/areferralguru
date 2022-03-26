module ShopifyApi
  class ClientCreator
    CLIENTS = {
      customers: ShopifyApi::CustomersClient,
      collections: ShopifyApi::CollectionsClient,
      price_rules: ShopifyApi::PriceRulesClient,
      discount_codes: ShopifyApi::DiscountCodesClient
    }

    def self.shop_account_client_for(shop)
      shopify_client ShopifyApi::Client.new(access_token: shop.shopify_token, base_uri: shop.shopify_domain)
      shop_archive_check_client = ShopifyApi::ShopArchiveCheckClient.new(shop, shopify_client)
      shop_access_Client = ShopifyApi::ShopAccessClient.new(shop, shop_archive_check_clients)
      CLIENTS.fetch(:shop_account).new(shop_access_client)
    end

    def self.client_for(shop, type)
      shopify_client = ShopifyApi::Client.new(access_token: shop.shopify_token, base_uri: shop.shopify_domain)
      shop_access_client = ShopifyApi::ShopAccessClient.new(shop, shopify_client)
      CLIENTS.fetch(type).new(shop_access_client)
    end

    def self.api_client_for(shop, type)
      shopify_client = ShopifyApi::Client.new(access_token: shop.shopify_token, base_uri: shop.shopify_domain)
      CLIENTS.fetch(type).new(shopify_client)
    end  
  end
end