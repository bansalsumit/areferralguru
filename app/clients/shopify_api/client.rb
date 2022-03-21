module ShopifyApi 
  class Client
    include HTTParty 
    include ResponseTranslator 
    
    DEFAULT_TIMEOUT = 5
    
    default_timeout DEFAULT_TIMEOUT 
    open_timeout 10
    
    def initialize(access_token:, base_uri:, default_api_version: ShopifyApp.configuration.api_version)
      @access_token = access_token 
      @base_uri = base_uri 
      @default_api_version = default_api_version 
    end
    
    def get_request(path, api_version: default_api_version, read_timeout: DEFAULT_TIMEOUT) 
      translate_response do
        self.class.get(request_uri(path, api_version), headers: default_headers, read_timeout: read_timeout) 
      end 
    rescue *ShopifyApi::ApiError::ALL_ERRORS => exc
      ExceptionNotifier.new(exc).notify
    end
    
    
    def create_request(path, params, api_version: default_api_version) 
      translate_response do
        self.class.post(request_uri(path, api_version), body: params.to_json, headers: default_headers) 
      end 
    rescue *ShopifyApi::ApiError::ALL_ERRORS => exc
      ExceptionNotifier.new(exc).notify
    end
    
    def update_request(path, params, api_version: default_api_version) 
      translate_response do
        self.class.put(request_uri(path, api_version), body: params.to_json, headers: default_headers)
      end 
    rescue *ShopifyApi::ApiError::ALL_ERRORS => exc
      ExceptionNotifier.new(exc).notify
    end

    def delete_request(path, params, api_version: default_api_version) 
      translate_response do
        self.class.delete(request_uri(path, api_version), body: params.to_json, headers: default_headers)
      end 
    rescue *ShopifyApi::ApiError::ALL_ERRORS => exc
      ExceptionNotifier.new(exc).notify
    end

    private

    attr_reader :access_token, :base_uri, :default_api_version

    def request_uri(path, api_version)
      "https://#{base_uri}/admin/api/#{api_version}/#{path}.json"
    end

    def default_headers
      {
        "X-Shopify-Access-Token" => access_token,
        "Content-Type" => "application/json"
      }
    end
  end
end