# == Schema Information
#
# Table name: shopping_lists_recipe_lists
#
#  id               :integer          not null, primary key
#  recipe_list_id   :integer
#  shopping_list_id :integer
#

class ShoppingListsRecipeLists < ActiveRecord::Base
  attr_accessible :recipe_list_id, :shopping_list_id
  belongs_to :recipe_list
  belongs_to :shopping_list
  validates :recipe_list_id, :presence => true, :uniqueness => {:scope => :shopping_list_id}
end
