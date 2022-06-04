class CreateSupportIssueTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :support_issue_tickets do |t|
      t.string :email
      t.string :subject
      t.string :description

      t.timestamps
    end
  end
end
