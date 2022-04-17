class RenameSalutaionInEmailPerformas < ActiveRecord::Migration[7.0]
  def change
    rename_column :email_performas, :salutaion, :salutation
  end
end
