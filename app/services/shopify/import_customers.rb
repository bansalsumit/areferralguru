module Shopify
  class ImportCustomers
    NEXT_PAGE_REGEX =  /(.)*(?<Type1>page_info=.+)>;\srel=\"next\"/ 

    def initialize(shop_id)
      @shop = Shop.find(shop_id)
      @shopify_api_client = ShopifyApi::ClientCreator.client_for(shop, :customers)
    end

    def call
      response = shopify_api_client.get_all(query_params: { limit: 100 })
      loop do 
        import_records(response)
        
        next_page_id = get_next_page_info(response.headers)
        break unless next_page_id

        response =  shopify_api_client.get_all(
          query_params: { limit: 100, page_info: next_page_id }
        )
      end
    end

    private
    attr_reader :shop, :shopify_api_client, :total_customers

    def get_next_page_info(headers)
      link = headers["link"]
      link.match(NEXT_PAGE_REGEX)&.captures&.first&.split("=")&.last
    end

    def import_records(response)
      Customer.create(cusomers_data(response))
    end
  
    def cusomers_data(response)
      response["customers"].map { |customer|
        {
          first_name: customer["first_name"],
          last_name: customer["last_name"],
          email: customer["email"],
          phone: customer["phone"],
          country: address_details(customer["addresses"])[:country],
          shop: shop,
          source: "Shopify",
          source_id: customer["id"],
          province: address_details(customer["addresses"])[:province], 
          zipcode: address_details(customer["addresses"])[:zipcode],
          accept_marketing: customer["accepts_marketing"],
          orders_count: customer["orders_count"],
          total_spent: customer["total_spent"],
          tags: customer["tags"],
          unique_link: 'code',
          sms_marketing_consent: customer["sms_marketing_consent"]["state"],
          marketing_opt_in_level: customer["marketing_opt_in_level"]
        }
      }
    end

    def address_details(addresses)
      address = default_address(addresses)
      {
        province: address["province"],
        zipcode: address["zip"],
        country: address["country"]
      }
    end

    def default_address(addresses)
      addresses.select { |address| address["default"] }.first
    end
  end
end

