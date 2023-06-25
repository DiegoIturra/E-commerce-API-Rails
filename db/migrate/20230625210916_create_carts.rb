class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :cart_id, null: false
      t.integer :total_price, null: false
      t.string :product_ids, null: false
      t.timestamps
    end
  end
end
