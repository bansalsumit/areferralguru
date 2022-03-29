ActiveAdmin.register Customer do
  permit_params :shop_id, :first_name, :last_name, :email

  filter :active

  index do
    selectable_column
    actions class: 'col-actions left-aligned-col-actions'
    column :first_name
    column :last_name
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
