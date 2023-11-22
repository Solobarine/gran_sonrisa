# frozen_string_literal: true;

# Migration to Create Car Model

class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :manufacturer
      t.string :model
      t.integer :year
      t.string :price
      t.text :description
      t.timestamps
    end
  end
end
