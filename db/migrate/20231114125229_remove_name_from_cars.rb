class RemoveNameFromCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :name, :string
  end
end
