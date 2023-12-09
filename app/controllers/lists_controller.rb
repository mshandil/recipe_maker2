class ListsController < ApplicationController
  def index
    matching_lists = List.all

    @full_list = matching_lists.order({ :created_at => :desc })

    render({ :template => "lists/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_lists = List.where({ :id => the_id })

    @the_list = matching_lists.at(0)

    render({ :template => "lists/show" })
  end

  def create
    the_list = List.new
    the_list.creator_id = params.fetch("query_creator_id")
    the_list.recipe_name = params.fetch("query_recipe_name")
    the_list.category = params.fetch("query_category")
    the_list.calories = params.fetch("query_calories")

    if the_list.valid?
      the_list.save
      redirect_to("/lists", { :notice => "List created successfully." })
    else
      redirect_to("/lists", { :alert => the_list.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_list = List.where({ :id => the_id }).at(0)

    the_list.creator_id = params.fetch("query_creator_id")
    the_list.recipe_name = params.fetch("query_recipe_name")
    the_list.category = params.fetch("query_category")
    the_list.calories = params.fetch("query_calories")

    if the_list.valid?
      the_list.save
      redirect_to("/lists/#{the_list.id}", { :notice => "List updated successfully."} )
    else
      redirect_to("/lists/#{the_list.id}", { :alert => the_list.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_list = List.where({ :id => the_id }).at(0)

    the_list.destroy

    redirect_to("/lists", { :notice => "List deleted successfully."} )
  end
end
