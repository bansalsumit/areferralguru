ActiveAdmin.register SupportIssueTicket do
  menu parent: "My Profile"

  controller do

    def create
      @support_issue_ticket = SupportIssueTicket.new(permitted_params)
      if @support_issue_ticket.save
        flash[:notice] = "support_issue_ticket is created successfully."
        redirect_to admin_root_path
      else
      end
    end

    private

    def permitted_params
      params.require(:support_issue_ticket).permit(:email, :description, :subject)
    end
  end
end
