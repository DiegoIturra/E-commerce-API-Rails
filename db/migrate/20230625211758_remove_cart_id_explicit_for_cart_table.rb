class RemoveCartIdExplicitForCartTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :cart_id
  end
end
