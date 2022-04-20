module EmailsHelper
  def set_email_path(email)
    if email.class.to_s == 'EmailTemplate'
      admin_email_templates_path(email)
    else
      admin_email_performas_path(email)
    end
  end
end
