class CreateJoinTableProductCollectionProgram < ActiveRecord::Migration[7.0]
  def change
    create_join_table :product_collections, :programs do |t|
      # t.index [:product_collection_id, :program_id]
      # t.index [:program_id, :product_collection_id]
    end
  end
end
