class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.decimal :price
      t.integer :inventory 
      t.timestamps
    end
  end
end
