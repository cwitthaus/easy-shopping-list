class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :recipe_list_id
    end
    add_index :recipes, :recipe_list_id
  end
end
