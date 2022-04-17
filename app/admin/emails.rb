ActiveAdmin.register_page 'Emails' do
  content title: 'Emails' do
    emails.each do |email|
      render partial: 'email', locals: { email: email }
    end
  end

  action_item :create_email do
    link_to 'Create Template', new_admin_email_template_path
  end

  controller do
    before_action :set_emails

    def set_emails
      @emails = EmailTemplate.all
    end
  end
end
