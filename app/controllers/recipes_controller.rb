class RecipesController < ApplicationController

	def new
		@recipe = Recipe.new
	end

	def index
		@recipes = Recipe.all
	end

	def create
		recipe_name = params.delete :recipe_name
		logger.debug "CREATING RECIPE WITH PARAMS #{params[:recipe]}"
		logger.debug "recipe_name: #{recipe_name}"
  	@recipe = Recipe.new(params[:recipe])
  	if @recipe.save
  		@recipe_list = RecipeList.create(:recipe_id => @recipe.id, :recipe_name => recipe_name)
  		@recipe.recipe_list_id = @recipe_list.id
  		if @recipe.save
	  		redirect_to @recipe_list
	  	end
  	else
  		render 'new'
  	end
	end

	def show
		@recipe = Recipe.find(params[:id])
	end
end
