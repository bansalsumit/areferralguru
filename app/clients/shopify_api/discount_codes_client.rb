module ShopifyApi
  class DiscountCodesClient

    def initialize(client)
      @client = client
    end

    def get_all(query_params: {})
      response = client.get_request("customers", query_params: query_params)
    end

    def get_count
      response = client.get_request("customers/count")
      response["count"]
    end

    def create
      client.create_request('/price_rules/1091957686432/discount_codes', discount_code_data)
    end

    def discount_code_data
      {
        discount_code: 
          {
            code: "SUMMERSALE10OFF"
          }
      }
    end
    
    private
    attr_reader :client
  end
end