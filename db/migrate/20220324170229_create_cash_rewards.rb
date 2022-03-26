class CreateCashRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :cash_rewards do |t|
      t.string :title
      t.string :description
      t.string :discount_type
      t.integer :discount
      t.string :program
      t.references :shop
      t.boolean :all_products_allowed
      
      t.timestamps
    end
  end
end
