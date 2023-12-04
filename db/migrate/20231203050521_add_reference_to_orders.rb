class AddReferenceToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :reference, :string, null: false
  end
end
