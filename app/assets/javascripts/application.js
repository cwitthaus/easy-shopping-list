// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery.purr
//= require best_in_place

//= require jquery.mobile
function remove_ingredient(link,id) {
  $.ajax({
  	type: 'POST',
  	url: '/delete_potential_word',
  	dataType: 'json',
  	data: {id: id},
  })
  $(link).parent().parent().hide();
}

function add_to_shopping_list(recipe_id) {
	$.ajax({
		type: 'POST',
		url: '/add_to_shopping_list',
		dataType: 'json',
		data: {id: recipe_id},
	})
}

function toggleStrike(link) {
  if (link.style.textDecoration == "line-through")
    {
      link.style.textDecoration = ""
    }
  else
    {
      link.style.textDecoration = "line-through"
    }
}
