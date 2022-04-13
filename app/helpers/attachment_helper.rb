module AttachmentHelper
  def public_url(attribute)
    if attribute&.attachment
      if Rails.env.development?
        attribute_url = Rails.application.routes.url_helpers.rails_blob_url(attribute, only_path: true)
      else
        attribute_url = attribute&.service_url&.split("?")&.first
      end
    end
    #set a default lazily
    attribute_url ||= ActionController::Base.helpers.asset_path("referral_logo.jpeg")
  end
end
