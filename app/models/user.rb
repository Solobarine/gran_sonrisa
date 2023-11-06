class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :trackable, :confirmable

  # Validation
  validates :first_name, presence: true
  validates :first_name, length: { minimum: 2 }

  validates :last_name, presence: true
  validates :last_name, length: { minimum: 2 }

  validates :email, presence: true
  validates :email, uniqueness: true

  # Associations
end
