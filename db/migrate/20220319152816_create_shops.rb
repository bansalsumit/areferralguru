class CreateShops < ActiveRecord::Migration[7.0]
  def self.up
    create_table :shops  do |t|
      t.string :shopify_domain, null: false
      t.string :shopify_token, null: false
      t.string :name
      t.string :domain
      t.string :province
      t.string :country
      t.string :phone
      t.string :source
      t.string :customer_email
      t.string :email
      t.string :shop_owner
      t.string :plan_name
      t.string :plan_display_name
      t.string :myshopify_domain

      t.timestamps
    end

    add_index :shops, :shopify_domain, unique: true
  end

  def self.down
    drop_table :shops
  end
end
