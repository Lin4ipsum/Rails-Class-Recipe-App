class CreateQuantityIngredients < ActiveRecord::Migration
  def change
    create_table :quantity_ingredients do |t|
      t.integer :quantity_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
