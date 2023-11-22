class RemoveManufacturerFromCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :manufacturer, :string
  end
end
