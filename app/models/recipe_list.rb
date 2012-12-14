# == Schema Information
#
# Table name: recipe_lists
#
#  id        :integer          not null, primary key
#  recipe_id :integer
#

class RecipeList < ActiveRecord::Base
  attr_accessible :recipe_name, :recipe_id, :recipe
  has_one :recipe
  has_many :certain_words
  has_many :potential_words
  has_many :shopping_lists, :through => :shopping_lists_recipe_lists
end
