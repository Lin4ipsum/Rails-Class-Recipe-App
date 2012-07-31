class AddAmountToQuantity < ActiveRecord::Migration
  def change
    add_column :quantities, :amount, :string
  end
end
