module ShopifyApi
  class ShopAccessClient
    def initialize(shop, client, default_api_version: ShopifyApp.configuration.api_version)
      @shop = shop
      @client = client
      @default_api_version = default_api_version
    end

    def get_request(*args, **options)
      handle_shop_access do 
        client.get_request(
          *args,
          **{ api_version: default_api_version }.merge(options)
        )
      end
    end

    def create_request(path, params, api_version: default_api_version)
      handle_shop_access do 
        client.create_request(path, params, api_version: api_version)
      end
    end

    def update_request(path, params, api_version: default_api_version)
      handle_shop_access do 
        client.update_request(path, params, api_version: api_version)
      end
    end

    def delete_request(path, params, api_version: default_api_version)
      handle_shop_access do 
        client.delete_request(path, params, api_version: api_version)
      end
    end

    private

    attr_reader :shop, :client, :default_api_version

    def handle_shop_access
      yield
      rescue *ShopifyApi::ApiError::SHOP_ACCESS_ERRORS => exc
        ExceptionNotifier.new(exc).notify
    end
  end
end