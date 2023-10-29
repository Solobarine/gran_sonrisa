# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.name null: false
      t.manufacturer
      t.model null: false
      t.year
      t.price
      t.description
      t.timestamps null: false
    end
  end
end
