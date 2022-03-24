class CreateCouponRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :coupon_rewards do |t|
      t.integer :discount
      t.string :discount_type
      t.integer :coupon_expiry
      t.string :title
      t.string :description
      t.references :shop
      t.string :program
      t.boolean :all_products_allowed

      t.timestamps
    end
  end
end
