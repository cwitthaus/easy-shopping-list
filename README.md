Easy Shopping List
==================

This project started as a goal to play around with parsing different recipe formats to quickly and easily build shopping lists. Most of the original work was done for a fed-ex day at Widen Enterprises in about 30 hours.

It makes sense to add recipes from a phone, and you want to have the shopping list available when you're out shopping, but depending on how much work has to be done editing the recipes themselves, you might want to actually sit down at a computer to do the rest of the work. I think the main improvements that could be made are to get to the point where we're smart enough that we are parsing the recipes really well, having a pretty large collection of already built recipes, or making the copy/paste functionality extremely easy to use on mobile devices.

Goals
-----

Original goal was to allow a user to take a picture using their phone, upload it to the application, and pull out the ingredients without a lot of extra work. The limitations of the availble (free) optical character recognition plugins encouraged me to rethink this goal and build the app to focus on the recipe formats that I use. I store most of my recipes on dropbox in word document format, and get the rest off various websites. For the sake of time, I decided to focus primarily on the recipes I owned (and used most often) that are in .doc format on dropbox.

After parsing the recipe, I pull off any easily identifiable numbers and units to make it easier to determine the intended ingredient. I then compare the potential ingredient to a list of already known ingredients. If the potential ingredient matches a known ingredient, we confirm that it belongs to the recipe. If it doesn't we leave it as a potential ingredient, giving the user the ability to edit, confirm or delete it from the recipe. Once a user has confirmed an ingredient, we add it to the list of known ingredients so that we can be smarter in the future.

Once we have a recipe that contains some number of ingredients, we can use those ingredients to build a shopping list. Simply add the ingredient to the shopping list, and then you can click to strike-through an item after you've picked it up at the store.


Future Work/Ideas
-----------------

- make the recipes full recipes, rather than just lists of ingredients
-- amount and unit for each ingredient
-- steps
-- time

- modifiers for ingredients, so cooked black beans and black beans aren't listed as seperate ingredients

- copy and paste in a recipe. use javascript to mark ingredients and steps

- upload a word document/text document and do the same thing we are doing with the images

- multiple shopping lists
-- multiple per user, 

- easy meal planning
-- group recipes by like ingredients to help decide what meals to make in a week

- merge with recibox for one awesome recipe blogging tool

Improvements
------------

- figure out how to actually upload images from my iphone

- save applications original guess when confirming so that we can be smarter when looking for potential ingredients.
-- m1lk -> milk
-- when we encounter m1lk, we should just assume it's milk.


