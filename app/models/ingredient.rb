# == Schema Information
#
# Table name: ingredients
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Ingredient < ActiveRecord::Base
  attr_accessible :name
  validates_uniqueness_of :name
end