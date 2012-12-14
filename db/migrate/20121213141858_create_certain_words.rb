class CreateCertainWords < ActiveRecord::Migration
  def change
    create_table :certain_words do |t|
      t.string :word
      t.integer :recipe_list_id
    end
    add_index :certain_words, :recipe_list_id
  end
end
