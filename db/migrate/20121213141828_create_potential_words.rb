class CreatePotentialWords < ActiveRecord::Migration
  def change
    create_table :potential_words do |t|
      t.string :word
      t.integer :recipe_list_id
    end
    add_index :potential_words, :recipe_list_id
  end
end
