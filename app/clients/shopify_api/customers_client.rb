module ShopifyApi
  class CustomersClient

    def initialize(client)
      @client = client
    end

    def all
      response =  client.get_request("customers")
    end
    
    private
    attr_reader :client
  end
end