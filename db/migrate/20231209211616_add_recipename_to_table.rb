class AddRecipenameToTable < ActiveRecord::Migration[7.0]
  def change
    
    add_column :recipes, :recipe_name, :string
    
  end
end
