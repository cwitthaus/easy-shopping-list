# == Schema Information
#
# Table name: potential_words
#
#  id             :integer          not null, primary key
#  word           :string(255)
#  recipe_list_id :integer
#

class PotentialWord < ActiveRecord::Base
  attr_accessible :recipe_list_id, :word
  belongs_to :recipe_list
  validates_presence_of :word
  validates_presence_of :recipe_list_id
  validates :word, :presence => true, :uniqueness => {:scope => :recipe_list_id}
end
