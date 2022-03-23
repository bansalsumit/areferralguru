module ShopifyApi
  class CustomersClient

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
    
    private
    attr_reader :client
  end
end