class RecipesController < ApplicationController
  def index
    matching_recipes = Recipe.all

    @the_recipe = matching_recipes.order({ :created_at => :desc })

    render({ :template => "recipes/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_recipes = Recipe.where({ :recipe_id => the_id })

    @the_recipe = matching_recipes.at(0)

    render({ :template => "recipes/show" })
  end

  def create
    the_recipe = Recipe.new
    the_recipe.recipe_id = params.fetch("query_recipe_id")
    the_recipe.ingredients = params.fetch("query_ingredients")
    the_recipe.cook_time = params.fetch("query_cook_time")

    if the_recipe.valid?
      the_recipe.save
      redirect_to("/recipes", { :notice => "Recipe created successfully." })
    else
      redirect_to("/recipes", { :alert => the_recipe.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_recipe = Recipe.where({ :id => the_id }).at(0)

    the_recipe.recipe_id = params.fetch("query_recipe_id")
    the_recipe.ingredients = params.fetch("query_ingredients")
    the_recipe.cook_time = params.fetch("query_cook_time")

    if the_recipe.valid?
      the_recipe.save
      redirect_to("/recipes/#{the_recipe.id}", { :notice => "Recipe updated successfully."} )
    else
      redirect_to("/recipes/#{the_recipe.id}", { :alert => the_recipe.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_recipe = Recipe.where({ :recipe_id => the_id }).at(0)

    the_recipe.destroy

    redirect_to("/lists", { :notice => "Recipe deleted successfully."} )
  end
end
