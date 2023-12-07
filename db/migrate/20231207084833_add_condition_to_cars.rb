class AddConditionToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :condition, :string
  end
end
