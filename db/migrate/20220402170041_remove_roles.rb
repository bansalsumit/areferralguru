class RemoveRoles < ActiveRecord::Migration[7.0]
  def up
    drop_join_table  :roles, :users
    drop_table :roles
  end

  def down
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end
    create_join_table :roles, :users do |t|
      t.index [:role_id, :user_id]
    end
  end
end
