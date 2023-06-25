class ChangeProductIdsTypeInCarts < ActiveRecord::Migration[7.0]
  def change
    rename_column :carts, :product_ids, :old_product_ids
    add_column :carts, :product_ids, :integer, array: true, default: []
    Cart.reset_column_information
    Cart.find_each do |cart|
      cart.update(product_ids: [cart.old_product_ids])
    end
    remove_column :carts, :old_product_ids
  end
end
