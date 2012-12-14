# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121213151641) do

  create_table "certain_words", :force => true do |t|
    t.string  "word"
    t.integer "recipe_list_id"
  end

  add_index "certain_words", ["recipe_list_id"], :name => "index_certain_words_on_recipe_list_id"

  create_table "ingredients", :force => true do |t|
    t.string "name"
  end

  add_index "ingredients", ["name"], :name => "index_ingredients_on_name"

  create_table "potential_words", :force => true do |t|
    t.string  "word"
    t.integer "recipe_list_id"
  end

  add_index "potential_words", ["recipe_list_id"], :name => "index_potential_words_on_recipe_list_id"

  create_table "recipe_lists", :force => true do |t|
    t.integer "recipe_id"
    t.string  "recipe_name"
  end

  create_table "recipes", :force => true do |t|
    t.integer  "recipe_list_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "recipes", ["recipe_list_id"], :name => "index_recipes_on_recipe_list_id"

  create_table "shopping_lists", :force => true do |t|
    t.string "name"
  end

  create_table "shopping_lists_recipe_lists", :force => true do |t|
    t.integer "recipe_list_id"
    t.integer "shopping_list_id"
  end

  add_index "shopping_lists_recipe_lists", ["recipe_list_id"], :name => "index_shopping_lists_recipe_lists_on_recipe_list_id"
  add_index "shopping_lists_recipe_lists", ["shopping_list_id"], :name => "index_shopping_lists_recipe_lists_on_shopping_list_id"

end
