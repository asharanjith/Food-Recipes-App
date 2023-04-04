class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

<<<<<<<<< Temporary merge branch 1
  has_many :recipes, foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, length: { minimum: 3, maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6, maximum: 25 }
=========
  has_many :foods
>>>>>>>>> Temporary merge branch 2
end
