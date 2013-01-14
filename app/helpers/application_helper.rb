module ApplicationHelper
		def full_title(page_title)
		base_title = "EasyShoppingList"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def button_to_remove_word(word)
		button_to_function("Remove Ingredient", "remove_ingredient(this,#{word.id})")
	end

	def button_to_make_certain(word)
		button_to_function("Confirm Ingredient", "make_certain(this,#{word.id})")
	end

	def add_recipe_to_shopping_list(recipe_id)
		button_to_function("Add to Shopping List", "add_to_shopping_list(#{recipe_id})")
	end

	def button_to_found_item()
		button_to_function("found", "mark_as_found(this)", :class => "found-button")
	end
end
