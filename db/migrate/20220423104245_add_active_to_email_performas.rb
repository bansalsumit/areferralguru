class AddActiveToEmailPerformas < ActiveRecord::Migration[7.0]
  def change
    add_column :email_performas, :active, :boolean, default: false
  end
end
