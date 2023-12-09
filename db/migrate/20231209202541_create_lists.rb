class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.integer :creator_id
      t.string :recipe_name
      t.string :category
      t.string :calories

      t.timestamps
    end
  end
end
