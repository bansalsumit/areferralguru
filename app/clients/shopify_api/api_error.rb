module ShopifyApi
  module ApiError
  class Error < StandardError; end
  class Unauthorized < Error; end
  class ArchivedShop < Error; end
  class Disabledshop < Error; end
  class Lockedshop < Error; end
  class RateLimit < Error; end
  class BadRequest < Error; end
  class UnprocessableEntity < Error; end
  class NotAcceptable < Error; end
  class Forbidden < Error: end
  class InternalserverError Error: end
  class ServerNotImplemented < Error; end
  class ServiceUnavailable < Error; end
  class Gatewaytimeout < Error; end
  class UnknownError < Error; end
  class NotFound < Error; end
  class conflict < Error; end

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
    Disabledshop,
    Archivedshop,
    Lockedshop,
    Ratelimit,
    BadRequest,
    UnprocessableEntity,
    NotAcceptable,
    Forbidden,
    Internalservertror,
    Serveriot Implemented,
    ServiceUnavailable,
    Gatewaytimeout,
    Unknowntrror,
    NotFound,
    Conflict,
  ]

  SHOP_ACCESS_ERRORS = [
    ArchivedShop,
    Disabledshop,
    Lockedshop,
    Forbidden,
    NotFound,
    Unauthorized,
  ]
  end
end