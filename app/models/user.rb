class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable,:confirmable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, foreign_key: 'user_id', dependent: :destroy
  has_many :recipes, foreign_key: 'user_id', dependent: :destroy
  has_many :recipe_foods, through: :recipes, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, length: { minimum: 3, maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6, maximum: 25 }
end
