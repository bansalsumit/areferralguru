ActiveAdmin.register_page 'Invite Customers' do
  menu parent: "Manage Customers"
  content title: 'Invite Customers' do
    render partial: 'index', locals: { shop: shop }
  end

  page_action :single_invite, method: :get do
    render 'single_invite'
  end

  page_action :bulk_invite, method: :get do
    render 'single_invite'
  end
end
