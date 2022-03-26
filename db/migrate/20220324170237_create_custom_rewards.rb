class CreateCustomRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :custom_rewards do |t|
      t.string :title
      t.string :description
      t.references :shop
      t.string :program
      t.boolean :all_products_allowed

      t.timestamps
    end
  end
end
