class CreateProductCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :product_collections do |t|
      t.string :title
      t.string :handle
      t.references :shop
      t.references :reward_eligibility

      t.timestamps
    end
  end
end
