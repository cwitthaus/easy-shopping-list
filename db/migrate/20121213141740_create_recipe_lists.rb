class CreateRecipeLists < ActiveRecord::Migration
  def change
    create_table :recipe_lists do |t|
      t.integer :recipe_id
      t.string :recipe_name
    end
  end
end
