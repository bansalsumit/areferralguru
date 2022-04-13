ActiveAdmin.register_page 'Emails' do
  action_item :create_email do
    link_to 'Create Template', new_admin_email_template_path
  end
end
