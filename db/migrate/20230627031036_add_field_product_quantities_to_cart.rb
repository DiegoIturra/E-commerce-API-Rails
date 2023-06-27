class AddFieldProductQuantitiesToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :product_quantities, :string
  end
end
