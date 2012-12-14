class RecipeListsController < ApplicationController
	AMOUNT_REGEX = /[0-9]*(\.|\/)*[0-9]/
	UNITS = ["teaspoon", "tablespoon", "tsp", "tsp", "cup", "quart", "pint", "pound", "lb", "oz"]
  EXTRAS_REGEX = /\(\w*\)/

	def new
		@recipe_list = RecipeList.new
	end

  def create
  end

  def show
  	@recipe_list = RecipeList.find(params[:id])
    recipe_list_id = @recipe_list.id
  	logger.debug "RECIPE LIST :::: #{@recipe_list} :::: #{recipe_list_id}"
  	@recipe = Recipe.find(@recipe_list.recipe_id)
  	logger.debug "RECIPE :::: #{@recipe}"
    @certain_words = CertainWord.find_all_by_recipe_list_id(recipe_list_id)
    logger.debug "CERTAIN :: #{@certain_words}"
    @potential_words = PotentialWord.find_all_by_recipe_list_id(recipe_list_id)
    logger.debug "POTENTIAL :: #{@potential_words}"
  end

  def update
  	@recipe_list = RecipeList.find(params[:id])

    CertainWord.find_all_by_recipe_list_id(@recipe_list.id).each { |word| word.destroy }
    PotentialWord.find_all_by_recipe_list_id(@recipe_list.id).each { |word| word.destroy }

  	recipe = Recipe.find(@recipe_list.recipe_id)
  	inpath = recipe.image.path
  	outpath = recipe.image.path

  	system("tesseract #{inpath} #{outpath}")


  	update_recipe_list_with_ingredients(@recipe_list, recipe)

  	redirect_to @recipe_list
  end

  private
  	def update_recipe_list_with_ingredients(recipe_list, recipe)
      recipe_list
      potential_ingredients = Array.new
      certain_ings = Array.new
      potential_ings = Array.new
  		File.open(recipe.image.path+".txt","r").readlines.each do |line|
        logger.debug "CHECKING #{line}"
  			cleaned_line = clean_line line.squish
        potential_ingredients.push cleaned_line.join(" ")
  		end
      potential_ingredients.each do |potential_ingredient|
        is_existing_ingredient = !Ingredient.find_by_name(potential_ingredient).nil?
        if is_existing_ingredient
          certain_ings.push(potential_ingredient)
        else
          potential_ings.push(potential_ingredient)
        end
      end
      certain_ings.each do |ing|
        logger.debug "ADDING CERTAIN #{ing}"
        CertainWord.create([:word => ing, :recipe_list_id => recipe_list.id])
      end
      potential_ings.each do |ing|
        logger.debug "ADDING POTENTIAL #{ing}"
        PotentialWord.create([:word => ing, :recipe_list_id => recipe_list.id])
      end
  	end

  	def clean_line(line)
			words = line.split
			cleaned_line = Array.new
			words.each do |word|
				cleaned_word = word.gsub(/(\.|\,)/,'').singularize
				if !((cleaned_word =~ AMOUNT_REGEX)||
             (UNITS.include? cleaned_word)||
             (cleaned_word =~ EXTRAS_REGEX))
					cleaned_line.push(cleaned_word)
				end
			end
			return cleaned_line
		end
end