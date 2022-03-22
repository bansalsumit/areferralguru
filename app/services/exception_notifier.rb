class ExceptionNotifier
  def initialize(exception, shop = nil)
    @exception = exception
    Rails.logger.error(exception.to_s)
    Rails.logger.error(shop&.shopify_domain)
  end

  def notify
    raise exception
  end

  private
  attr_reader :exception
end