class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :type 
      t.datetime :start_date
      t.datetime :end_date
      t.references :advocate_programeable, polymorphic: true
      t.references :referred_programeable, polymorphic: true
      t.references :reward_eligibility
      t.references :shop

      t.timestamps
    end
  end
end
