class ShoppingListsController < ApplicationController

	def show
		@shopping_list = ShoppingList.first()
		if @shopping_list.nil?
			@shopping_list = ShoppingList.create()
		end
		shopping_lists_recipe_lists = ShoppingListsRecipeLists.find_all_by_shopping_list_id(@shopping_list.id)
		@recipe_lists = Array.new
		shopping_lists_recipe_lists.each do |list_list|
			@recipe_lists.push(RecipeList.find(list_list.recipe_list_id))
		end
		@ingredients = Array.new()
		@recipe_lists.each do |recipe|
			logger.debug "recipe id: #{recipe.id}"
			@ingredients += CertainWord.find_all_by_recipe_list_id(recipe.id)
			@ingredients += PotentialWord.find_all_by_recipe_list_id(recipe.id)
		end
		@ingredients = remove_duplicate_ingredients(@ingredients)
	end


	def add_to_shopping_list
		logger.debug "ATTEMPTING TO ADD RECIPE LIST: #{params[:recipe_list_id]}"
		@shopping_list = get_shopping_list
		logger.debug "#{@shopping_list.id}"
		shooping_lists_recipe_list = ShoppingListsRecipeLists.create(:recipe_list_id => params[:recipe_list_id], :shopping_list_id => @shopping_list.id)
		redirect_to @shopping_list
	end

	def remove_from_shopping_list
		logger.debug "Attempting to remove recipe list: #{params}"
		@shopping_list = get_shopping_list
		recipe_list_id = params[:recipe]
		ShoppingListsRecipeLists.find(:first, :conditions => ["recipe_list_id = ? and shopping_list_id = ?", recipe_list_id, @shopping_list.id]).destroy
		redirect_to @shopping_list
	end

	private 
		def get_shopping_list
			shopping_list = ShoppingList.first()
			if shopping_list.nil?
				shopping_list = ShoppingList.create()
			end
			return shopping_list
		end

		def remove_duplicate_ingredients(array)
			unique_ingredients = Array.new
			existing_ingredients = Array.new
			array.each do |value|
				if !existing_ingredients.include? value.word
					unique_ingredients.push value
					existing_ingredients.push value.word
				end
			end
			return unique_ingredients
		end

end