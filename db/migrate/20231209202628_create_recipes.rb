class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.integer :recipe_id
      t.string :ingredients
      t.string :cook_time
      

      t.timestamps
    end
  end
end
