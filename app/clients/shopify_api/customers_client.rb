module ShopifyApi
  class CustomersClient

    def initialize(client)
      @client = client
    end

    def all
      response = client.get_request("customers")
    end

    def count
      response = client.get_request("customers/count")
      response["count"]
    end
    
    private
    attr_reader :client
  end
end