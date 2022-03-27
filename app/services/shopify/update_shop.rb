module Shopify
  class UpdateShop
    NEXT_PAGE_REGEX =  /(.)*(?<Type1>page_info=.+)>;\srel=\"next\"/ 

    def initialize(shop_id)
      @shop = Shop.find(shop_id)
      @shopify_api_client = ShopifyApi::ClientCreator.client_for(shop, :shop)
    end

    def call
      response = shopify_api_client.get_shop
      
      shop.update(
        {
          name: response["shop"]["name"],
          domain: response["shop"]["domain"],
          province: response["shop"]["province"],
          country: response["shop"]["country_name"],
          phone: response["shop"]["phone"],
          source: response["shop"]["source"],
          customer_email: response["shop"]["customer_email"],
          email: response["shop"]["email"],
          shop_owner: response["shop"]["shop_owner"],
          plan_name: response["shop"]["plan_name"],
          plan_display_name: response["shop"]["plan_display_name"],
          myshopify_domain: response["shop"]["myshopify_domain"],
        }
      )        
    end

    private
    attr_reader :shop, :shopify_api_client
  end
end

