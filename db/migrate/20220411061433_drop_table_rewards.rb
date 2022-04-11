class DropTableRewards < ActiveRecord::Migration[7.0]
  def up
    drop_table :rewards
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
