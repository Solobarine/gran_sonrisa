class CreateManufacturer < ActiveRecord::Migration[7.0]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.integer :year
      t.string :logo
      t.text :description
      t.timestamps
    end
  end
end
