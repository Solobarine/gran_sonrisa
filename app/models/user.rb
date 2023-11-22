class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :trackable, :confirmable

  # Validation
  validates :name, presence: true
  validates :name, length: { minimum: 2 }

  validates :email, presence: true
  validates :email, uniqueness: true

  # Associations
end
