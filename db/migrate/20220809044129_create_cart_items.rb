class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :item_id, null: false
      t.integer :customer_id, null: false
      t.integer :amount, null: false
      t.timestamps
    end
    add_index :cart_items, [:customer_id, :item_id], unique: true
  end
end
