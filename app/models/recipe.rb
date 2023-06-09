class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :prepration_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true, length: { minimum: 3, maximum: 1000 }

  def toggle_privacy!
    update(public: !public)
  end
end
