class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.decimal :total_price
      t.string :order_identifier
      t.timestamps
    end
    add_index :orders, [:order_identifier], unique: true
  end
end
