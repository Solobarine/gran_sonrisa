class AddManufacturerToCars < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :manufacturer, null: false, foreign_key: true, on_delete: :cascade
  end
end
