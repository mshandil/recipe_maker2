# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  cook_time   :string
#  ingredients :string
#  recipe_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  recipe_id   :integer
#
class Recipe < ApplicationRecord

  belongs_to :category, required: true, class_name: "List", foreign_key: "recipe_id"
end
