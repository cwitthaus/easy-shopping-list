class CreateShoppingListsRecipeLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists_recipe_lists do |t|
    	t.integer :recipe_list_id
    	t.integer :shopping_list_id
    end
    add_index :shopping_lists_recipe_lists, :recipe_list_id
    add_index :shopping_lists_recipe_lists, :shopping_list_id
  end
end
