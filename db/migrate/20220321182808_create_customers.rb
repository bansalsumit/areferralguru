class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :country
      t.boolean :active
      t.references :shop, index: true, foreign_key: true
      t.string :source
      t.string :source_id
      t.string :province
      t.string :zipcode
      t.boolean :accept_marketing
      t.integer :orders_count
      t.decimal :total_spent
      t.string :tags
      t.boolean :referral_email_sent
      t.datetime :referral_email_sent_at
      t.boolean :successful_advocate
      t.integer :total_referral
      t.decimal :total_earnings
      t.string :unique_link, index: true

      t.timestamps
    end
  end
end
