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

  member_action :activate_current, method: :put do
    @email.update(params.require(:email_performa).permit(:active))
    @email.shop.email_performas.where.not(id: @email.id).update_all(active: false)

    render json: @email
  end

  controller do
    before_action :set_email, only: :activate_current 

    private

    def set_email
      @email = EmailPerforma.find_by(id: params['id'])
    end
  end
end
