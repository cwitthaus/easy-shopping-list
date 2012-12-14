class PotentialWordsController < ActionController::Base
	respond_to :html, :json

	def delete
		potential_word = PotentialWord.find(params[:id])
		@recipe_list = RecipeList.find(potential_word.recipe_list_id)
		potential_word.destroy
		redirect_to @recipe_list
	end

	def update
		logger.debug "ATTEMPTING TO UPDATE"
	  @word = PotentialWord.find(params[:id])
	  @word.update_attributes(:word => params[:potential_word][:word])
	  respond_with @word
	end

	def make_certain
		logger.debug params
		logger.debug "attempting to make certain #{params[:word]}"
		potential_word = PotentialWord.find(params[:word])
		CertainWord.create(:word => potential_word.word, :recipe_list_id => potential_word.recipe_list_id)
		@recipe_list = RecipeList.find(potential_word.recipe_list_id)
		potential_word.destroy
		redirect_to @recipe_list
	end
end
