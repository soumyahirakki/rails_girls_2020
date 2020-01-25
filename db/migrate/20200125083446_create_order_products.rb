class CreateOrderProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.timestamps
    end
    add_index :order_products, [:order_id, :product_id], unique: true
    
  end
end
