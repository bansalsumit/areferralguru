module ShopifyApi
  class ShopClient

    def initialize(client)
      @client = client
    end

    def get_shop(query_params: {})
      response = client.get_request("shop")
    end
    
    private
    attr_reader :client
  end
end