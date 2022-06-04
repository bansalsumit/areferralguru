ActiveAdmin.register_page 'Contact us' do
  menu parent: "My Profile"

  content title: 'Contact Us' do
    support_issue_ticket = SupportIssueTicket.new
    render partial: 'index', locals: { shop: shop, support_issue_ticket: support_issue_ticket }
  end
end
