class RemoveQuantityIngredients < ActiveRecord::Migration
  def change
    drop_table :quantity_ingredients
  end
end