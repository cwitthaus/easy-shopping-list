# == Schema Information
#
# Table name: recipes
#
#  id                 :integer          not null, primary key
#  file_path          :string(255)
#  recipe_list_id     :integer
#  recipe_name        :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
