ActiveAdmin.register_page 'Invite Customers' do
  menu parent: "Manage Customers"
  content title: 'Invite Customers' do
    render partial: 'index', locals: { shop: shop }
  end

  page_action :single_invite, method: :get do
    render 'single_invite', locals: { customer: @customer }
  end

  page_action :bulk_invite, method: :get do
    render 'single_invite'
  end

  controller do
    before_action :set_customer, only: :single_invite

    private

    def set_customer
      @customer = Customer.new(shop: @shop)
    end
  end
end
