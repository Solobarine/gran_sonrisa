# frozen_string_literal: true

class Order < ApplicationRecord
  # Association
  has_one :user
  has_one :car

  # Validations
  validates :status, inclusion: { in: %w[pending processing completed cancelled] }

  # Custom Queries
  def self.latest_orders
    includes(:car, :user).order(created_at: :desc).limit(5)
  end

  def self.five_months_sale
  
  end

  def self.top_brands
    
  end
end
