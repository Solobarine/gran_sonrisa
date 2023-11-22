class AddDefaultToSoldInCars < ActiveRecord::Migration[7.0]
  def change
    change_column_default :cars, :sold, false
  end
end
