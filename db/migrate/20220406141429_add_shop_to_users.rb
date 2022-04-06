class AddShopToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :shop, foreign_key: true
  end
end
