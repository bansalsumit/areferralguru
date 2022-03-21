class ExceptionNotifier
  def initialize(exception, shop = nil)
    Rails.logger.error(exception.to_s)
    Rails.logger.error(shop.shopify_domain)
    
  end

  def notify
    raise exception
  end
end