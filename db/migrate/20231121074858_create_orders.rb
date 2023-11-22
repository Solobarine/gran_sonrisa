class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.references :car, null: false, foreign_key: true, on_delete: :cascade
      t.string :status, default: 'pending'
      t.integer :price
      t.string :payment_method
      t.string :currency
      t.timestamps
    end
  end
end
