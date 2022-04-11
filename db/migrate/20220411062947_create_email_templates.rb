class CreateEmailTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :email_templates do |t|
      t.string :name
      t.string :subject
      t.string :sender
      t.string :recipient
      t.string :salutaion
      t.string :email_body
      t.string :closing

      t.timestamps
    end
  end
end
