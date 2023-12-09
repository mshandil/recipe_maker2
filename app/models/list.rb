# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  calories    :string
#  category    :string
#  recipe_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  creator_id  :integer
#
class List < ApplicationRecord

  belongs_to :creator, required: true, class_name: "User", foreign_key: "creator_id"

  has_many  :recipes, class_name: "Recipe", foreign_key: "recipe_id", dependent: :destroy
end
