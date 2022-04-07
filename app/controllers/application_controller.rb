class ApplicationController < ActionController::Base
  include Pundit::Authorization
  # after_action :verify_authorized, except: :index, unless: :active_admin_controller?
  # after_action :verify_policy_scoped, only: :index, unless: :active_admin_controller?

  before_action :set_shop

  def set_shop
    if current_user.present?
      @shop = current_user.shop
    end
  end

  def active_admin_controller?
    is_a?(ActiveAdmin::BaseController)
  end
end
