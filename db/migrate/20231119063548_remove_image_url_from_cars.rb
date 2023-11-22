class RemoveImageUrlFromCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :image_url, :string
  end
end
