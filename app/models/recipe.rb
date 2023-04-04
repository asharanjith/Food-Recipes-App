class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :description, presence: true, length: { minimum: 3, maximum: 1000 }

  def toggle_privacy!
    update(public: !public)
  end
end
