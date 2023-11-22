class AddOtherPropertiesToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :body_style, :string
    add_column :cars, :mileage, :string
    add_column :cars, :color, :string
    add_column :cars, :transmission, :string
    add_column :cars, :engine, :string
    add_column :cars, :fuel_type, :string
    add_column :cars, :drive_train, :string
    add_column :cars, :image_url, :string
  end
end
