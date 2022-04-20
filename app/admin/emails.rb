ActiveAdmin.register_page 'Emails' do
  content title: 'Emails' do
    div '', class: 'email-container' do
      emails.each do |email|
        render partial: 'email', locals: { email: email }
      end
    end
    div '', id: 'modal-container' do
    end
  end

  page_action :get_email_preview, method: :get do
    @email = if params['email_type'] == 'EmailTemplate'
      EmailTemplate.find_by(id: params['email_id'])
    else
      EmailPerforma.find_by(id: params['email_id'])
    end
    respond_to do |format|
      format.js { render 'email_preview' }
    end
  end

  action_item :create_email do
    if current_user.has_role? :admin
      link_to 'Create Template', new_admin_email_template_path
    else
      link_to 'Create Email Format', new_admin_email_performa_path
    end
  end

  controller do
    before_action :set_email_templates
    before_action :create_email_performas, if: :is_shop_owner
    before_action :set_emails

    def set_emails
      if current_user.has_role? :admin
        @emails = @email_templates
      else
        @emails = @shop.email_performas.reload
      end
    end

    def create_email_performas
      email_templates_not_linked = @email_templates.ids - @shop.email_performas.pluck(:email_template_id)
      if email_templates_not_linked.present?
        EmailTemplate.where(id: email_templates_not_linked).each do |email_template|
          @shop.email_performas.build(email_template: email_template)
        end
        @shop.save
      end
    end

    private

    def is_shop_owner
      current_user.has_role? :shop_owner
    end

    def set_email_templates
      @email_templates = EmailTemplate.all
    end
  end
end
