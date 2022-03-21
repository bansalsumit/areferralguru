module ShopifyApi
  module ApiError
    class Error < StandardError; end
    class Unauthorized < Error; end
    class ArchivedShop < Error; end
    class DisabledShop < Error; end
    class LockedShop < Error; end
    class RateLimit < Error; end
    class BadRequest < Error; end
    class UnprocessableEntity < Error; end
    class NotAcceptable < Error; end
    class Forbidden < Error; end
    class InternalServerError < Error; end
    class ServerNotImplemented < Error; end
    class ServiceUnavailable < Error; end
    class GatewayTimeout < Error; end
    class UnknownError < Error; end
    class NotFound < Error; end
    class Conflict < Error; end

    CLIENT_ERRORS = [
      Unauthorized,
      DisabledShop,
      LockedShop,
      BadRequest,
      Forbidden,
      UnprocessableEntity,
      NotAcceptable,
      UnknownError,
      NotFound,
      Conflict,
    ]

    ALL_ERRORS = [
      Unauthorized,
      DisabledShop,
      ArchivedShop,
      LockedShop,
      RateLimit,
      BadRequest,
      UnprocessableEntity,
      NotAcceptable,
      Forbidden,
      InternalServerError,
      ServerNotImplemented,
      ServiceUnavailable,
      GatewayTimeout,
      UnknownError,
      NotFound,
      Conflict,
    ]

    SHOP_ACCESS_ERRORS = [
      ArchivedShop,
      DisabledShop,
      LockedShop,
      Forbidden,
      NotFound,
      Unauthorized,
    ]
  end
end