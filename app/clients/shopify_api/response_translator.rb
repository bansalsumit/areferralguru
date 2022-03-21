#frozen_string_literal: true

module ShopifyApi 
  module ResponseTranslator

    SEE_OTHER = 303 
    BAD_REQUEST = 400 
    UNAUTHORIZED = 401 
    UNPROCESSABLE_ENTITY = 422 
    LOCKED = 423 
    NOT_ACCEPTABLE = 406 
    RATE_LIMIT = 429 
    PAYMENT_REQUIRED = 402 
    FORBIDDEN = 403 
    NOT_FOUND = 404 
    INTERNAL_SERVER_ERROR = 500 
    NOT_IMPLEMENTED = 501 
    SERVICE_UNAVAILABLE = 503 
    GATEWAY_TIMEOUT = 504 
    CONFLICT = 409

    ERRORS = {
      BAD_REQUEST => ApiError::BadRequest, 
      UNAUTHORIZED => ApiError::Unauthorized, 
      UNPROCESSABLE_ENTITY => ApiError::UnprocessableEntity, 
      NOT_ACCEPTABLE => ApiError:: NotAcceptable, 
      RATE_LIMIT => ApiError::RateLimit, 
      PAYMENT_REQUIRED => ApiError:: DisabledShop, 
      LOCKED => ApiError::LockedShop, 
      FORBIDDEN => ApiError:: Forbidden, 
      INTERNAL_SERVER_ERROR => ApiError::InternalServerError, 
      NOT_IMPLEMENTED => ApiError::ServerNotImplemented,
      SERVICE_UNAVAILABLE => ApiError:: ServiceUnavailable, 
      GATEWAY_TIMEOUT => ApiError::GatewayTimeout, 
      NOT_FOUND => ApiError:: NotFound,
      CONFLICT => ApiError:: Conflict, 
    }

    # TRANSPORT_ERRORS = ::Cusco::Middleware::HTTPTransport::TRANSPORT ERRORS

    class << self 
      def error_for_http_status(http_status)
        ERRORS.fetch(http_status, ApiError::UnknownError) 
      end 
    end

    def translate_response
      @response = yield 
      http_status = @response.code

      case http_status 
      when 200..299
        @response 
      when 400..599
        raise ResponseTranslator.error_for_http_status (http_status), error_message 
      else
        @response 
      end 
    rescue *TRANSPORT_ERRORS => exception  
      raise ApiError::UnknownError, exception.message
    end
        
    private
        
    def parsed_response_hash
      if @response.parsed_response.present?
        @response.parsed_response.with_indifferent_access 
      else
        @response.to_hash.with_indifferent_access 
      end 
    end
        
    def error_message 
      if @response.parsed_response.present? && @response.parsed_response.is_a?(String)
        @response.parsed_response 
      else  
        parsed_response_hash.fetch(:errors, "").to_s 
      end 
    end 
  end 
end