ActiveAdmin.register EmailPerforma do
  permit_params :id, :name, :subject, :sender, :recipient, :salutation, :email_body, :closing,
    :logo, :banner

  form do |f|
    f.inputs '' do
      f.input :name
      f.input :subject
      f.input :sender
      f.input :recipient
      f.input :salutation
      f.input :email_body
      f.input :closing
      f.input :logo, as: :file
      f.input :banner, as: :file
    end
    f.actions
  end
end
