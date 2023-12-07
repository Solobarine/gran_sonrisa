class Car < ApplicationRecord
  # Associations
  has_many_attached :images
  belongs_to :manufacturer
  has_one :order
  has_many :favourites

  # Validations
  validates :manufacturer_id, presence: true, numericality: { only_integer: true }
  validates :model, presence: true
  validates :body_style, presence: true
  validates :fuel_type, presence: true
  validates :engine, presence: true
  validates :transmission, presence: true
  validates :drive_train, presence: true
  validates :mileage, presence: true
  validates :color, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :description, presence: true, length: { maximum: 2000 }
  validates :sold, inclusion: { in: [true, false] }
  validates :condition, inclusion: { in: %w[used new], message: '%<value>s is not a valid condition' }

  # Scopes
  scope :available, -> { where(sold: false) }

  # Custom Methods

  def self.top_cars
    includes(:manufacturer).limit(5)
  end
end
