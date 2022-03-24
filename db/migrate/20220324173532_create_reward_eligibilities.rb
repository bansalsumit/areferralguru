class CreateRewardEligibilities < ActiveRecord::Migration[7.0]
  def change
    create_table :reward_eligibilities do |t|
      t.integer :minimum_spend
      t.integer :purchase_review_period
      t.integer :minimum_successful_conversions
      t.integer :eligible_purchase
      t.bigint :reward_eligiable_id
      t.string :reward_eligiable_type
      t.references :shop

      t.timestamps
    end
  end
end
