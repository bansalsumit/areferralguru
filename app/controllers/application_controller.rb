class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :set_shop

  def set_shop
    @shop = current_user.shop
  end
end
