class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  # Validation
  validates :first_name, presence: true, length: { minimum: 2 }

  validates :last_name, presence: true, length: { minimum: 2 }

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  validates :avatar, presence: true, on: :update

  # Associations
  has_one_attached :avatar
  has_many :favourites
  has_many :orders

  # Custom Methods
  def has_favourite_car(car_id)
    favourites.find_by(car_id:)
  end
end
