class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe
  has_many :recipes, through: :recipe_foods

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
