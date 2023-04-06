class RecipeFood < ApplicationRecord
  # belongs_to :user
  belongs_to :recipe
  belongs_to :food

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
