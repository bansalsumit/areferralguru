class CreateJoinTableRoleUser < ActiveRecord::Migration[7.0]
  def change
    create_join_table :roles, :users do |t|
      t.index [:role_id, :user_id]
    end
  end
end
