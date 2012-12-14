# == Schema Information
#
# Table name: shopping_lists
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class ShoppingList < ActiveRecord::Base
  attr_accessible :name, :id
  has_many :recipe_lists, :through => :shopping_lists_recipe_lists
end
