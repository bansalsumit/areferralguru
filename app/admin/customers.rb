ActiveAdmin.register Customer do
  permit_params :shop_id, :first_name, :last_name, :email
  actions :all

  filter :active
  filter :email

  action_item :only => :index do
    link_to 'Sync customer from shopify', sync_customer_from_shopify_admin_customers_path
  end

  collection_action :sync_customer_from_shopify do
    Shopify::ImportCustomers.new(1)
    redirect_to admin_customers_path, alert: 'Imported customers.'
  end

  index do
    selectable_column
    actions class: 'col-actions left-aligned-col-actions'
    column :first_name
    column :last_name
    column :email
    column :active
  end

  form html: { multipart: true } do |f|
    f.semantic_errors
    f.inputs 'Details' do
      f.input :shop_id, as: :select,
        collection: Shop.pluck(:id, :name).map { |user| ["#{user[1]}", user[0]] },
        input_html: { :style => 'min-width:30%' }
      f.input :first_name
      f.input :last_name
      f.input :email
      f.actions
    end
  end
end
