module Shopify
  class ImportCustomers
    def initialize(shop_id)
      @shop = Shop.find_by(shop_id)
      @shopify_api_client = ShopifyApi::ClientCreator.client_for(shop, :customers)
    end

    def call
      @total_customers = shopify_api_client.get_count(limit=100)
    end

    private
    attr_reader :shop, :shopify_api_client, :total_customers
  end
end