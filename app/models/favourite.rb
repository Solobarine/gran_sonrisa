class Favourite < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :car

  # Custom Methods
  def self.is_favourite(user, car_id)
    find_by(user_id: user.id, car_id: car_id)
  end
end
