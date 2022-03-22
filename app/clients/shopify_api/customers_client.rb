module ShopifyApi
  class CustomersClient

    def initialize(client)
      @client = client
    end

    def get_all
      response = client.get_request("customers")
    end

    def get_count
      response = client.get_request("customers/count")
      response["count"]
    end
    
    private
    attr_reader :client
  end
end