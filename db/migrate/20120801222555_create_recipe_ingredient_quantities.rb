class CreateRecipeIngredientQuantities < ActiveRecord::Migration
  def change
    create_table :recipe_ingredient_quantities do |t|
      t.integer :recipe_ingredient_id
      t.integer :quantity_id

      t.timestamps
    end
  end
end
