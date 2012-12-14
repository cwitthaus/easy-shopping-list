# == Schema Information
#
# Table name: certain_words
#
#  id             :integer          not null, primary key
#  word           :string(255)
#  recipe_list_id :integer
#

class CertainWord < ActiveRecord::Base
	before_validation :check_ingredient
  attr_accessible :recipe_list_id, :word
  belongs_to :recipe_list
  validates_presence_of :word
  validates_presence_of :recipe_list_id
  validates :word, :presence => true, :uniqueness => {:scope => :recipe_list_id}

  def check_ingredient
  	logger.debug "CURRENT name: #{self.word.singularize}"
  	Ingredient.create(:name => word)
  end
end
