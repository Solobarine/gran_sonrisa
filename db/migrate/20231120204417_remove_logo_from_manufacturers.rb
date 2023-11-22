class RemoveLogoFromManufacturers < ActiveRecord::Migration[7.0]
  def change
    remove_column :manufacturers, :logo, :string
  end
end
