class Manufacturer < ApplicationRecord
  # Associations
  has_one_attached :logo
  has_many :cars
  has_many :favourites

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 2000}

  #Custom Methods
  def self.top_manufacturers
    limit(5)
  end
end