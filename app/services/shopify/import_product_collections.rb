module Shopify
  class ImportProductCollections
    NEXT_PAGE_REGEX =  /(.)*(?<Type1>page_info=.+)>;\srel=\"next\"/ 

    def initialize(shop_id)
      @shop = Shop.find(shop_id)
      @shopify_api_client = ShopifyApi::ClientCreator.client_for(shop, :collections)
    end

    def call
      import_collections("custom_collections")
      import_collections("smart_collections")
    end

    def import_collections(collection_type)
      response = shopify_api_client.get_collections(
        type: collection_type,
        query_params: { limit: 100 }
      )

      loop do 
        import_records(response, collection_type)
        
        next_page_id = get_next_page_info(response.headers)
        break unless next_page_id

        response =  shopify_api_client.get_all(
          type: collection_type,
          query_params: { limit: 100, page_info: next_page_id }
        )
      end
    end

    private
    attr_reader :shop, :shopify_api_client, :total_customers

    def get_next_page_info(headers)
      link = headers["link"]
      link&.match(NEXT_PAGE_REGEX)&.captures&.first&.split("=")&.last
    end

    def import_records(response, collection_type)
      ProductCollection.create(collections_data(response, collection_type))
    end
  
    def collections_data(response, collection_type)
      response[collection_type].map { |collection|
        {
          title: collection["title"],
          handle: collection["handle"],
          shop: shop,
        }
      }
    end
  end
end

