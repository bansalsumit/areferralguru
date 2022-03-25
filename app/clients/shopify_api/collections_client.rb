module ShopifyApi
  class CollectionsClient

    def initialize(client)
      @client = client
    end

    def get_custom_collections(query_params: {})
      response = client.get_request("custom_collections", query_params: query_params)
    end

    def get_smart_collections(query_params: {})
      response = client.get_request("smart_collections", query_params: query_params)
    end

    def get_count
      response = client.get_request("collection_listings/count")
      response["count"]
    end
    
    private
    attr_reader :client
  end
end